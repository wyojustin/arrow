.PHONY: auto build test docs clean

auto: build

build:
	virtualenv local
	. local/bin/activate
	local/bin/pip install -r requirements.txt
	local/bin/pip install -r requirements-dev.txt

test:
	tox -e py27

docs:
	touch docs/index.rst
	cd docs; sphinx-build -b html -d _build/doctrees . _build/html

clean:
	rm -rf local
	rm -f arrow/*.pyc tests/*.pyc
	rm -f .coverage

