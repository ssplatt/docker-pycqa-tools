FROM cimg/python:2.7
LABEL maintainer="Brett Taylor <github.com/ssplatt>"
RUN pip install \
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
    bandit \
    && rm -rf ~/.cache/pip
