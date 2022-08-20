import redis

class Redis:
    _conn = None

    @classmethod
    def _initialize_conn(cls):
        return redis.Redis()

    @classmethod
    def get_db(cls): 
        if not cls._conn:
            cls._conn = cls._initialize_conn()
        return cls._conn
