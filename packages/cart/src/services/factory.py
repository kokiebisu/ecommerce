from abc import ABCMeta, abstractstaticmethod
from repository.cart import CartRepository
from services import CartService


class ServiceFactory(ABCMeta):
    @abstractstaticmethod
    def create_service():
        pass

class CartServiceFactory(ServiceFactory): 
    @staticmethod
    def create_service():
        cart_repository = CartRepository
        service = CartService(cart_repository)
        return service
