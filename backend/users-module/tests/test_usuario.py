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

        # definiendo el mock para la colección de usuarios
        monkeypatch.setattr(
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


    def test_retrieve_all_users_not_empty(self, user_valid, mock_db):
        """Test to check the retrieve user function is not empty"""
        user = user_valid
        users_mocked = retrieve_all_users()
        # Probando el mock
        assert users_mocked[0]["nombre_usuario"] == user["nombre_usuario"]
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
        # Probando el mock con el usuario agregado
        assert user_added["nombre_usuario"] == usuario_sin_id["nombre_usuario"]
        assert user_added["apellido_usuario"] == usuario_sin_id["apellido_usuario"]


    @pytest.mark.parametrize(
        "object_id,expected",
        [
            ("64fccf050fdc323933caec96", False),
            (12345678, False),
            ("5678", False),
            ([], False)
        ],
    )
    def test_retrieve_user_by_id_invalid(self, mock_db, object_id, expected):
        """Parametrized test to check the retrieve user by id function only with valid id"""
        assert retrieve_user_by_id(object_id) is expected


    @pytest.mark.parametrize(
        "nombre,expected",
        [
            (
                "nombre_user",
                {
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
                },
            ),
            ("Prueba", False),
            ("", False),
            (" ", False),
            (123, False),
        ]
    )
    def test_retrieve_user_by_name(self, mock_db, nombre, expected):
        """Parametrized test to check the retrieve user by name"""
        assert retrieve_user_by_name(nombre) == expected


    @pytest.mark.parametrize(
        "objectId,expected",
        [
            ("60a7b3b6e4b9f9b5f07777", False),
            (12345678, False),
            ({"ObjectId"}, False)
        ],
    )
    def test_delete_user_by_id_invalid(self, mock_db, objectId, expected):
        """Test to check the delete user with invalid id doesn´t work"""
        assert delete_user(objectId) is expected
