# Base image
FROM python:3.10

# Install dependencies for OpenCV
RUN apt-get update && \
    apt-get install -y libgl1-mesa-glx

# Set working directory
WORKDIR /code

# Salin file dependencies
COPY ./requirements.txt /code/requirements.txt

# Instal dependencies
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Salin aplikasi
#COPY ./app /code/app

# Salin file dataset ke dalam container
#COPY ./Dataset /code/Dataset

# Salin seluruh file proyek ke dalam container
COPY . /code

# Ekspos port Streamlit (default 8501)
EXPOSE 8501

# Jalankan aplikasi Streamlit
CMD ["streamlit", "run", "app/main.py", "--server.port=8080", "--server.address=0.0.0.0"]
