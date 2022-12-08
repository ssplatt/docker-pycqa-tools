FROM cimg/python:3.7
WORKDIR /home/circleci
COPY requirements.txt .
RUN pyenv versions \
    && pip --version \
    && python --version \
    pip install --no-cache-dir \
    -r requirements.txt \
    && rm requirements.txt

