from os import getenv
import pymongo
from dotenv import load_dotenv

load_dotenv()
client = pymongo.MongoClient(getenv("MONGO_DETAILS"))
db = client[getenv(key="DB_NAME", default="usersMGM")]
user_collection = db.get_collection(
    name=getenv(key="COLLECTION_NAME", default="usuarios"))
