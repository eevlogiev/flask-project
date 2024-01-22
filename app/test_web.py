import unittest

from flask import Flask
from web import home


class FlaskAppTestCase(unittest.TestCase):

    def setUp(self):
        # Create a test Flask application
        self.app = Flask(__name__)
        self.app.config['TESTING'] = True
        self.app.add_url_rule('/', 'home', home)  # Register the home route
        self.client = self.app.test_client()

    def test_home_route(self):
        # Test the / route
        response = self.client.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b"Hello, DevOps Gurus!", response.data)

if __name__ == '__main__':
    unittest.main()
