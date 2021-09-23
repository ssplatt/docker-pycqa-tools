FROM python:3.7-slim AS BUILDER
WORKDIR /src
COPY requirements.txt .
RUN pip install --no-cache-dir \
    --prefix=/install \
    --no-warn-script-location \
    -r requirements.txt

FROM cimg/python:3.7
LABEL maintainer="Brett Taylor <github.com/ssplatt>"
COPY --from=BUILDER /install /usr/local
