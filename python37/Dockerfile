FROM cimg/python:3.7 AS base

FROM base AS builder
USER root
RUN pip3 install --prefix=/install --no-warn-script-location \
    awscli \
    boto3 \
    pytest \
    prospector[with_everything]

FROM base AS runner
MAINTAINER "Brett Taylor <github.com/ssplatt>"
COPY --from=builder /install /usr/local
