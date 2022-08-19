import mysql.connector


class MySQLDatabase:
    _connection_string: str
    _db = None
    _cursor = None

    @classmethod
    def _retrieve_db(cls):
        return mysql.connector.connect(
                host="0.0.0.0",
                user="root",
                password="password",
                database="users"
            )

    @classmethod
    def get_cursor(cls):
        if not cls._db:
            cls._db = MySQLDatabase._retrieve_db()
        if not cls._cursor:
            cls._cursor = cls._db.cursor()
        return cls._cursor

    @classmethod
    def get_db(cls):
        if not cls._db:
            cls._db = MySQLDatabase._retrieve_db()
        return cls._db
