FROM cimg/python:3.7
LABEL maintainer="Brett Taylor <github.com/ssplatt>"
RUN pip3 install --no-cache-dir \
    awscli \
    boto3 \
    pytest \
    "prospector[with_everything]" \
    && rm -rf ~/.cache/pip
