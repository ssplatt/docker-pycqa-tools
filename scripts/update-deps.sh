#!/usr/bin/env bash
set -e
set -x

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )/"
PROJECT_ROOT="$(dirname "$DIR")"
BASE_NAME=${VENV_NAME:-$(basename "${PROJECT_ROOT}")}

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

R_IN_PATH=./requirements.in
R_OUT_PATH=./requirements.txt

while read -r TARGET; do
    DIR=$(basename "$TARGET")
    cd "$DIR" || exit
    BASE_VERSION=${DIR:(-3)}
    VERSION=$(pyenv install -l | cut -d " " -f 3 | grep -E "^$BASE_VERSION" | sort -Vr | head -1)
    VENV_NAME="${BASE_NAME}-${VERSION}"
    rm -rf "${R_OUT_PATH}"
    pyenv local "${VENV_NAME}"
    pyenv activate "${VENV_NAME}"
    which python
    which pip
    pip install --upgrade pip setuptools wheel pip-tools
    pip-compile --no-header --no-emit-index-url --rebuild --verbose \
        --output-file "${R_OUT_PATH}" \
        "${R_IN_PATH}"
    pip-sync "${R_OUT_PATH}"
    pyenv deactivate
    cd "${PROJECT_ROOT}" || exit
done <<< "$(find . -name Dockerfile -exec dirname {} \;)"
