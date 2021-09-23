FROM cimg/python:2.7
WORKDIR /home/circleci
COPY requirements.txt .
RUN pip install --no-cache-dir \
    -r requirements.txt \
    && rm requirements.txt
