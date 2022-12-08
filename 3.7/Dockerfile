FROM cimg/python:3.7
WORKDIR /home/circleci
COPY requirements.txt .
RUN which pyenv \
    && pyenv versions \
    && which pip \
    && pip --version \
    && which python \
    && python --version \
    pip install --no-cache-dir \
    -r requirements.txt \
    && rm requirements.txt
