FROM cimg/python:3.8
LABEL maintainer="Brett Taylor <github.com/ssplatt>"
WORKDIR /src
COPY requirements.txt .
RUN pip install --no-cache-dir \
    -r requirements.txt \
    && rm -rf ~/.cache/pip \
    && rm requirements.txt
