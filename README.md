# docker-pycqa-tools

[![CircleCI](https://circleci.com/gh/ssplatt/docker-pycqa-tools.svg?style=svg&circle-token=31f11e3920328aae0a1422339662781b5f511a2a)](https://circleci.com/gh/ssplatt/docker-pycqa-tools)

Docker Hub: https://hub.docker.com/repository/docker/ssplatt/pycqa-tools

[PyCQA](https://github.com/PyCQA) tools packaged into a container for use in CircleCI workflows.

- Python 2.7 contains:
  - https://github.com/PyCQA/bandit
  - https://github.com/PyCQA/pylint
  - https://pep8.readthedocs.io/en/release-1.7.x/
  - https://github.com/PyCQA/pyflakes
  - https://github.com/PyCQA/flake8
  - https://github.com/PyCQA/mccabe
  - https://github.com/landscapeio/dodgy
  - https://github.com/PyCQA/pydocstyle
  - https://github.com/regebro/pyroma
  - https://github.com/jendrikseipp/vulture
  - https://github.com/timothycrosley/deprecated.frosted
- Python 3.7 contains:
  - https://github.com/PyCQA/prospector and all modules
- Python 3.8 contains:
  - https://github.com/PyCQA/prospector and all modules

## Example usage

```yaml 
#.circleci/config.yml
version: 2.1

jobs:
  test:
    docker:
      - image: ssplatt/pycqa-tools:3.8
    working_directory: ~/repo
    steps:
      - checkout
      - run:
          name: prospector with all modules
          command: |
            prospector \
              --with-tool pyroma \
              --with-tool vulture \
              --with-tool frosted \
              --with-tool mypy \
              --with-tool bandit

workflows:
  version: 2
  default:
    jobs:
      - test
```
