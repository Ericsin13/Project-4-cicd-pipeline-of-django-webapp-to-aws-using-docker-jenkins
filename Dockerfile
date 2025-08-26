FROM python:latest 

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . . 

EXPOSE 5000 

CMD ["python", "manage.py", "runserver", "0.0.0.0:5000"]

