import unittest

from checkout import checkout_total


class CheckoutTest(unittest.TestCase):
    def test_total(self):
        self.assertEqual(checkout_total([(2, 5)]), 10)


if __name__ == "__main__":
    unittest.main()
