FROM cimg/python:2.7 AS base

FROM base AS builder
USER root
RUN pip install --prefix=/install --no-warn-script-location \
    awscli \
    boto3 \
    pytest \
    pylint \
    pep8 \
    pyflakes \
    mccabe \
    dodgy \
    pydocstyle \
    pyroma \
    vulture \
    frosted \
    bandit

FROM base AS runner
MAINTAINER "Brett Taylor <github.com/ssplatt>"
COPY --from=builder /install /usr/local
