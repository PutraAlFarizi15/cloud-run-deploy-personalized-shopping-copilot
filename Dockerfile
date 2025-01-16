# Base image
FROM python:3.9

# Set working directory
WORKDIR /code

# Salin file dependencies
COPY ./requirements.txt /code/requirements.txt

# Instal dependencies
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Salin aplikasi
COPY ./app /code/app

# Ekspos port Streamlit (default 8501)
EXPOSE 8501

# Jalankan aplikasi Streamlit
CMD ["streamlit", "run", "app/main.py", "--server.port=8501", "--server.address=0.0.0.0"]
