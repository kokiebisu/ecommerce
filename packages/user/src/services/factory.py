from abc import ABCMeta, abstractstaticmethod
from repository import UserRepository
from services import UserService


class ServiceFactory(ABCMeta):
    @abstractstaticmethod
    def create_service():
        pass

class UserServiceFactory(ServiceFactory): 
    @staticmethod
    def create_service():
        user_repository = UserRepository
        service = UserService(user_repository)
        return service
