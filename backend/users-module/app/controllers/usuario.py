from config.db import user_collection
from bson.objectid import ObjectId

# helpers which convert data from db to python dict 
def user_helper(user) -> dict:
    return {
        "id_usuario": str(user["_id"]),
        "nombre_usuario": user["nombre_usuario"],
        "apellido_usuario": user["apellido_usuario"],
        "fecha_registro": user["fecha_registro"],
        "rol_usuario": user["rol_usuario"],
        "credenciales": user["credenciales"]
    }

# Retrieve all users present in the database
def retrieve_all_users():
    users = []
    for user in user_collection.find():
        users.append(user_helper(user))
    return users


# Add a new user into to the database
def add_user(user_data: dict) -> dict:
    user_id_inserted = user_collection.insert_one(user_data).inserted_id
    new_user = user_collection.find_one({"_id": user_id_inserted})
    return user_helper(new_user)


# Retrieve a user with a matching ID
def retrieve_user_by_id(id: str) -> dict:
    user = user_collection.find_one({"_id": ObjectId(id)})
    if user:
        return user_helper(user)

def retrieve_user_by_name(name: str) -> dict:
    user = user_collection.find_one({"nombre_usuario": name}) 
    if user:
        return user_helper(user)

# Update a user with a matching ID
def update_user(id: str, data: dict):
    # Return false if an empty request body is sent.
    if len(data) < 1:
        return False
    user = user_collection.find_one({"_id": ObjectId(id)})
    if user:
        # print("1: ", data.values())
        # # if isinstance(data.values(), dict):
        # #     data = {k: v for k, v in data.values() if v is not None}
        # print("2: ", isinstance(data.values(), dict))
        # for i in data.values():
        #     if isinstance(i, dict):
        #         key_embebbed = i.keys()
        #         dict_embebed = {k: v for k, v in i.items() if v is not None}
        #         print("3: ", key_embebbed, dict_embebed)
        #         updated_user = user_collection.update_one(
        #             {"_id": ObjectId(id)}, {"$set": { key_embebbed:dict_embebed}}
        #         )
        #         return True

        updated_user = user_collection.update_one(
            {"_id": ObjectId(id)}, {"$set": data}
        )
        if updated_user:
            return True
        return False


# Delete a user from the database
def delete_user(id: str):
    user = user_collection.find_one({"_id": ObjectId(id)})
    if user:
        user_collection.delete_one({"_id": ObjectId(id)})
        return True