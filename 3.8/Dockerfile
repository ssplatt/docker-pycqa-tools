FROM cimg/python:3.8
WORKDIR /tmp
COPY requirements.txt .
RUN pip install --no-cache-dir \
    -r requirements.txt
WORKDIR /home/circleci/project
