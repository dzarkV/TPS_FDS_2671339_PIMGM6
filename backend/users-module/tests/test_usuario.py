import pytest
import mongomock
from app.controllers.usuario import (
    retrieve_all_users,
    retrieve_user_by_id,
    user_helper,
    add_user,
    retrieve_user_by_name,
    delete_user,
)


class TestControllerUsuario:
    """
    Pruebas unitarias para controlador usuario
    """

    @pytest.fixture
    def user_valid(self) -> None:
        """Fixture to create a valid user"""
        return {
            "_id": "60a7b3b6e4b9f9b5f0e1b1a2",
            "nombre_usuario": "nombre_user",
            "apellido_usuario": "apellido_user",
            "fecha_registro": "2021-05-01",
            "rol_usuario": {"id_rol": "101", "nombre_rol": "test_rol"},
            "credenciales": {
                "usuario": "test_user",
                "contrasena": "test_password",
                "estado": "activo",
            },
        }

    @pytest.fixture
    def mock_db(self, user_valid, monkeypatch: pytest.MonkeyPatch):
        """Fixture to create a mock user collection"""

        def mock_user_coll(user_valid):
            """Mock Mongo client and insert an user"""
            user_coll_mocked = mongomock.MongoClient().db.usuarios
            user_coll_mocked.insert_one(user_valid)
            return user_coll_mocked

        with monkeypatch.context() as m:
            m.setattr(
                "app.controllers.usuario.user_collection", mock_user_coll(user_valid)
            )

    def test_user_helper(self, user_valid):
        """Test function to converts a user from MongoDB to a dictionary"""
        assert user_helper(user_valid) == {
            "id_usuario": "60a7b3b6e4b9f9b5f0e1b1a2",
            "nombre_usuario": "nombre_user",
            "apellido_usuario": "apellido_user",
            "fecha_registro": "2021-05-01",
            "rol_usuario": {"id_rol": "101", "nombre_rol": "test_rol"},
            "credenciales": {
                "usuario": "test_user",
                "contrasena": "test_password",
                "estado": "activo",
            },
        }

    def test_retrieve_all_users_not_empty(self, mock_db):
        """Test to check the retrieve user function is not empty"""
        assert len(retrieve_all_users()) != 0

    def test_add_user_valid(self, user_valid, mock_db):
        """Test to check the add user function is like a user valid"""
        usuario_sin_id = user_valid.copy()
        del usuario_sin_id["_id"]
        usuario_sin_id["nombre_usuario"] = "Nuevo nombre usuario"
        usuario_sin_id["apellido_usuario"] = "Nuevo apellido usuario"

        user_added = add_user(usuario_sin_id)

        assert user_added is not None
        assert len(user_added) != 0
        assert user_added["nombre_usuario"] == usuario_sin_id["nombre_usuario"]
        assert user_added["apellido_usuario"] == usuario_sin_id["apellido_usuario"]

    @pytest.mark.parametrize(
        "objectId,expected",
        [
            ("60a7b3b6e4b9f9b5f0e1b1a2", False),
            (12345678, False),
            ("5678", False),
            ([], False),
            ({"60a7b3b6e4b9f9b5f0e1b1a6"}, False),
        ],
    )
    def test_retrieve_user_by_id_invalid(self, objectId, expected, mock_db):
        """Parametrized test to check the retrieve user by id function only  with valid id"""
        assert retrieve_user_by_id(objectId) is expected

    # @pytest.mark.parametrize(
    #     "usern_name,expected",
    #     [
    #         (
    #             "nombre_user",
    #             {
    #                 "id_usuario": "60a7b3b6e4b9f9b5f0e1b1a2",
    #                 "nombre_usuario": "nombre_user",
    #                 "apellido_usuario": "apellido_user",
    #                 "fecha_registro": "2021-05-01",
    #                 "rol_usuario": {"id_rol": "101", "nombre_rol": "test_rol"},
    #                 "credenciales": {
    #                     "usuario": "test_user",
    #                     "contrasena": "test_password",
    #                     "estado": "activo",
    #                 },
    #             },
    #         ),
    #         ("Prueba", False),
    #         ("", False),
    #         (" ", False),
    #         (123, False),
    #     ]
    # )
    # def test_retrieve_user_by_name(self, usern_name, expected, mock_db):
    #     """Parametrized test to check the retrieve user by name"""
    #     assert retrieve_user_by_name(usern_name) == expected

    @pytest.mark.parametrize(
        "objectId,expected",
        [
            ("60a7b3b6e4b9f9b5f07777", False),
            (12345678, False),
        ],
    )
    def test_delete_user_by_id_invalid(self, objectId, expected, mock_db):
        """Test to check the delete user with invalid id doesn´t work"""
        assert delete_user(objectId) is expected
