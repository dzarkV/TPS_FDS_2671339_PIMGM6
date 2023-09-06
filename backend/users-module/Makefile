runapp:
	python3 app/main.py

buildenv:
	python -m venv venv

activatevenv:
	source venv/bin/activate

installlibs:
	pip install -r requirements.txt

buildapp:
	buildenv
	activateenv
	installlibs

testapp-report:
	cd app && python -m pytest -vv --html=report-tests.html --self-contained-html

env-to-job:
	@echo export MONGO_DETAILS=${{ secrets.MONGO_DETAILS }} >> venv/bin/activate
    @echo export DB_NAME=${{ secrets.DB_NAME }} >> venv/bin/activate
    @echo export COLLECTION_NAME=${{ secrets.COLLECTION_NAME }} >> venv/bin/activate