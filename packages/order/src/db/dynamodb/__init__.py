import boto3

class DynamoDBDatabase:
    _resource = None
    _db = None

    def get_db(self):
        if not self._resource:
            self._resource = boto3.resource('dynamodb')
        if not self._db:
            self._db = self._resource.Table('orders')
        return self._db

    