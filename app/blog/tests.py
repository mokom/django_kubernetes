from django.test import TestCase
from django.contrib.auth.models import User
from .models import Post

class PostTestCase(TestCase):

    def setUp(self):
        test_user = User.objects.create_user(username='testuser', password='12345')
        Post.objects.create(title="django", slug="django", author=test_user, status="published")

    def test_failure(self):
        qs = Post.objects.all()
        self.assertTrue(qs.exists())