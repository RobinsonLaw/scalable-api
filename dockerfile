FROM python:3.11-slim
WORKDIR /app
COPY app.py .
RUN pip install pandas numpy flask
RUN pip freeze > requirements.txt
CMD ["python", "app.py"]
