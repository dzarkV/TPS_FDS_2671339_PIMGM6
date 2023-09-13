import pytest
import mongomock
from app.controllers.login import authenticate_user


class TestControllerLogin:
    """Pruebas unitarias para controlador login"""


    @pytest.fixture
    def mock_db(self, monkeypatch: pytest.MonkeyPatch):
        """Fixture to create a mock user collection"""

        def mock_user_coll():
            """Mock Mongo client and insert an user"""
            user_coll_mocked = mongomock.MongoClient().db.usuarios
            return user_coll_mocked

        # definiendo el mock para la colección de usuarios que usa al autenticar
        monkeypatch.setattr(
            "app.controllers.usuario.user_collection", mock_user_coll()
        )


    @pytest.mark.parametrize(
        "username, password",
        [
            ("test_user", "$2b$12$0Z1Z1Z1Z1%%Z1Z1Z1Z1Z1"),
            ("uservalid", 12345),
            (" ", " "),
            ({"data"}, True),
            ([], []),
        ],
    )
    def test_authenticate_user_invalid(self, mock_db, username, password):
        """Test to check the authenticate user function when user does not exist"""
        assert authenticate_user(username, password) is False
