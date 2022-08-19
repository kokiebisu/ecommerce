import time
from db.redis import Redis
import pickle

class SessionRepository:
    def __init__(self, limit:int = 10000000):
        self._conn = Redis.get_conn()
        self._quit = False
        self._limit = limit

    @property
    def quit(self):
        return self._quit

    @quit.setter
    def quit(self, new_state:bool):
        self._quit = new_state

    def validate_token(self, token: str):
        stream = self._conn.hget('login:', token)
        if stream:
            return pickle.loads(stream)
        return None

    def update_token(self, token: str, user, item=None):
        timestamp = time.time()
        self._conn.hset('login:', token, pickle.dumps(user))
        token = {}
        token['timestamp'] = timestamp
        self._conn.zadd('recent:', token, timestamp)
        if item:
            self._conn.zadd(f'viewed:{token}', item, timestamp)
            self._conn.zremrangebyrank(f'viewed:{token}', 0, -26)

    def add_to_cart(cls, session, item, count):
        if count <= 0:
            cls.db.hrem('cart:' + session, item)
        else:
            cls.db.hset('cart:' + session, item, count)
    
    def clean_sessions(self):
        while not self._quit:
            size = self._conn.zcard('recent:')
            if size <= self._limit:
                time.sleep(1000)
                continue
            end_index = min(size - self._limit, 100)
            tokens = self._conn.zrange('recent:', 0, end_index-1)

            session_keys = []
            for token in tokens:
                session_keys.append(f'viewed:{token}')
                self._conn.delete(*session_keys)
                self._conn.hdel('login:', *tokens)
                self._conn.zrem('recent:', *tokens)
