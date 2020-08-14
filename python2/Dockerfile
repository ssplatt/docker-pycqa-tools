FROM cimg/python:2.7 AS base

FROM base AS builder
USER root
RUN pip install --prefix=/install --no-warn-script-location \
    awscli \
    boto3 \
    pylint \
    pep8 \
    pyflakes \
    flake8 \
    mccabe \
    dodgy \
    pydocstyle \
    pyroma \
    vulture \
    frosted \
    bandit
USER circleci

FROM base AS runner
LABEL maintainer="Brett Taylor <github.com/ssplatt>"
COPY --from=builder /install /usr/local
USER circleci
