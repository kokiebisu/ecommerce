from repository import UserRepository

class UserService:
    user_repository: UserRepository

    def __init__(self, user_repository):
        self.user_repository = user_repository

    def get_users(self):
        return self.user_repository.retrieve_users()

    def create_user(self):
        return self.user_repository.create_user()

    def update_user(self):
        return self.user_repository.update_user()

    def delete_user(self, user_id:int):
        return self.user_repository.delete_user_by_id(user_id)
