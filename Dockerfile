FROM python:3.11.6

WORKDIR /usr/src/

COPY requirements.txt .

RUN [ "pip", "install", "--break-system-packages", "-r", "requirements.txt" ]

COPY manage.py .
COPY db.sqlite3 .

COPY static_in_env/ static_in_env/
COPY templates/ templates/
COPY core/ core/
COPY cookies-n-soda/ cookies-n-soda/

ENTRYPOINT [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]
