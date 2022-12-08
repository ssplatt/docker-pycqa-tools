#!/usr/bin/env bash
set -e
set -x

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )/"
PROJECT_ROOT="$(dirname "$DIR")"
BASE_NAME=${VENV_NAME:-$(basename "${PROJECT_ROOT}")}

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

while read -r TARGET; do
    echo "$TARGET"
    PYDIR=$(basename "$TARGET")
    cd "$PYDIR" || exit
    BASE_VERSION="${PYDIR}"
    VERSION=$(pyenv install -l | cut -d " " -f 3 | grep -E "^$BASE_VERSION" | sort -Vr | head -1)
    VENV_NAME="${BASE_NAME}-${VERSION}"

    if pyenv activate "${VENV_NAME}"; then
        CURRENT_PY_VERSION="$(python --version 2>&1 | cut -d " " -f 2)"
        if [[ "$VERSION" != "$CURRENT_PY_VERSION" ]]; then
            pyenv uninstall --force "${VENV_NAME}"
            pyenv install --skip-existing "${VERSION}"
            pyenv virtualenv --force "${VERSION}" "${VENV_NAME}"
        fi
    else
        # Venv doesn't exist yet; install and create it.
        pyenv install --skip-existing "${VERSION}"
        pyenv virtualenv --force "${VERSION}" "${VENV_NAME}"
    fi

    pyenv local "${VENV_NAME}"
    pyenv activate "${VENV_NAME}"
    which python
    which pip
    pip install --upgrade pip setuptools wheel pip-tools
    # pip install -r requirements.txt
    pyenv deactivate
    cd "${PROJECT_ROOT}" || exit
done <<< "$(find . -name Dockerfile -exec dirname {} \;)"
