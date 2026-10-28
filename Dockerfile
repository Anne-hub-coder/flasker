FROM	python:3.12-slim
WORKDIR /app
COPY    . .
RUN python -m pip install --no-cache-dir --upgrade pip==26.2.2
RUN python -m pip install --no-cache-dir Flask click Jinja2 Werkzeug
RUN python -m pip uninstall -y pip setuptools

RUN	flask --app flasker init-db
ENTRYPOINT      ["flask","--app","flasker","run","--host=0.0.0.0"]
