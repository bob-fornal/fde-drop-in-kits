from service import display_total


def checkout_total(items):
    return sum(display_total(quantity, price) for quantity, price in items)
