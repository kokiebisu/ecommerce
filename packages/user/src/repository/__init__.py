from typing import Any
from db import MySQLDatabase
from schemas.user import UserSchema


class UserRepository:
    TABLE_NAME = "user"
    def create_user(self, payload: UserSchema):
        query = '''
            INSERT INTO user (first_name, last_name, age) VALUES (%s, %s, %s)
        '''
        val = (payload.first_name, payload.last_name, payload.age)
        db = MySQLDatabase.get_db()
        cursor = MySQLDatabase.get_cursor()
        cursor.execute(query, val)
        db.commit()
    def retrieve_users(self):
        query = '''
            SELECT * FROM user
        '''
        cursor = MySQLDatabase.get_cursor()
        cursor.execute(query)
        rows = cursor.fetchall()
        if rows:
            return [{'id': row[0], 'first_name': row[1], 'last_name': row[2], 'age': row[3]} for row in rows]
        else:
            return None

    def update_user(self, user_id: int, payload: UserSchema):
        query = '''
            UPDATE user
            SET first_name=%s, last_name=%s, age=%s
            WHERE id=%s
        '''
        db = MySQLDatabase.get_db()
        cursor = MySQLDatabase.get_cursor()
        val = (payload.first_name, payload.last_name, payload.age, user_id)
        cursor.execute(query, val)
        db.commit()

    def delete_user_by_id(self, user_id: int):
        query = '''
            DELETE FROM user
            WHERE id=%s
        '''
        print("USER_ID", user_id)
        db = MySQLDatabase.get_db()
        cursor = MySQLDatabase.get_cursor()
        val = (user_id,)
        cursor.execute(query, val)
        db.commit()

        