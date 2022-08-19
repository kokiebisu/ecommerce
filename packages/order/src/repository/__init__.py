from uuid import uuid4

from db.dynamodb import DynamoDBDatabase


class OrderRepository:
    _db = DynamoDBDatabase.get_db()

    @classmethod
    def create(cls, user, quantity, product):
        if not cls._db:
            raise Exception('DB was not properly fetched')
        cls._db.put_item(
            Item={
                'order_id': uuid4(),
                'quantity': quantity,
                'user_id': user['id'],
                'first_name': user['first_name'],
                'last_name': user['last_name'],
                'product_id': product['id'],
                'product_name': product['name']
            }
        )

    @classmethod
    def retrieve(cls, order_id: str):
        if not cls._db:
            raise Exception('DB was not properly fetched')
        response = cls._db.get_item(
            Key={
                'order_id': order_id
            }
        )
        return response['Item']

    @classmethod
    def delete(cls, order_id):
        if not cls._db:
            raise Exception('DB was not properly fetched')
        cls._db.delete_item(
            Key={
                'order_id': order_id
            }
        )