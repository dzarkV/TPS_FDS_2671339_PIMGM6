import pymongo
from dotenv import load_dotenv
from os import getenv

load_dotenv()
config = getenv("MONGO_DB_STRING")
conn = pymongo.MongoClient(config)

db = conn[getenv("DB_NAME")]
collection = db.get_collection(getenv("COLLECTION_NAME"))