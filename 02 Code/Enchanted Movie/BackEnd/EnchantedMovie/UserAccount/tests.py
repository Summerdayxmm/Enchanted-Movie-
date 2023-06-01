from django.test import TestCase

# Create your tests here.
from django.test import TestCase, Client
from django.urls import reverse
from .models import UserAccount, UserInfo

class LoginTest(TestCase):
    def setUp(self):
        self.client = Client()
        self.login_url = reverse('UserAccount:login')  # Replace 'login' with the actual name of the URL mapping for the login view
        self.test_user_info = UserInfo.objects.create(
            user_name="TestUser",
            user_email="test@test.com",
            user_tel="12345678901",
            user_sex="male",
            user_old="30"
        )
        self.test_user = UserAccount.objects.create(
            user_name="TestUser",
            user_password="TestPassword123",
            user_loginState="active",
            user_userInfo=self.test_user_info
        )

    def test_login_success(self):
        response = self.client.post(self.login_url, {
            "user_name": "TestUser",
            "user_password": "TestPassword123",
            "user_loginState": "active"
        })
        self.assertEqual(response.status_code, 200)
        self.assertIn("login success", response.content.decode())

    def test_login_wrong_password(self):
        response = self.client.post(self.login_url, {
            "user_name": "TestUser",
            "user_password": "WrongPassword",
            "user_loginState": "active"
        })
        self.assertEqual(response.status_code, 200)
        self.assertIn("User Password Error", response.content.decode())

    def test_login_nonexistent_user(self):
        response = self.client.post(self.login_url, {
            "user_name": "NonexistentUser",
            "user_password": "SomePassword",
            "user_loginState": "active"
        })
        self.assertEqual(response.status_code, 200)
        self.assertIn("User Account does not exist", response.content.decode())
