FROM cimg/python:3.9
WORKDIR /home/circleci
COPY requirements.txt .
RUN pip install --no-cache-dir \
    -r requirements.txt \
    && rm requirements.txt
