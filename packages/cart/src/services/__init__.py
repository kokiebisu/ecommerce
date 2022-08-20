from repository.cart import CartRepository

class CartService:
    cart_repository: CartRepository

    def __init__(self, cart_repository):
        self.cart_repository = cart_repository

    def get_cart(self):
        return self.cart_repository.retrieve_users()

    def add_item_to_cart(self):
        return self.cart_repository.create_user()
