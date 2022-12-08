FROM cimg/python:3.9
WORKDIR /tmp
COPY requirements.txt .
RUN echo "$PATH" \
    && which pyenv \
    && pyenv versions \
    && which pip \
    && pip --version \
    && which python \
    && python --version \
    pip install --no-cache-dir \
    -r requirements.txt
WORKDIR /home/circleci/project
