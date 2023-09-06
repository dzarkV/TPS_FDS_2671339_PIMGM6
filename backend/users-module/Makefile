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
