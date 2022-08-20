from db.redis import Redis

class CartRepository:
    def __init__(self, limit:int = 10000000):
        self._db = Redis.get_db()
        self._limit = limit

    def add_to_cart(self, session, item: str, count: int):
        if count <= 0:
            self._db.hrem('cart:' + session, item)
        else:
            self._db.hset('cart:' + session, item, count)

    def get_cart(self, session):
        cart = self._db.hgetall('cart:' + session)
        if cart:
            return cart
        return None
    
    # def clean_sessions(self):
    #     while not self._quit:
    #         size = self._db.zcard('recent:')
    #         if size <= self._limit:
    #             time.sleep(1000)
    #             continue
    #         end_index = min(size - self._limit, 100)
    #         sessions = self._db.zrange('recent:', 0, end_index-1)

    #         session_keys = []
    #         for session in sessions:
    #             session_keys.append('cart:' + session)
    #             self._db.delete(*session_keys)
