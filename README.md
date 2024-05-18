# java
Jave repo for my Open University course

# Syntax
- Naming convention: camelCase.
- Class naming: PascalCase.
- Attributes naming: prefied with underscore `_`.
- constanst naming: UPPERCASE.

# Justfile
```sh
Available recipes:
    build        # Run the build command
    b            # alias for `build`
    clean        # Run the clean command
    default      # fuzzy find and run a recipe
    restart      # Restart container
    res          # alias for `restart`
    run          # Run container interactively
    r            # alias for `run`
    run-compile  # Compile the project
    rc           # alias for `run-compile`
    run-detached # Run container detached
    rd           # alias for `run-detached`
    run-shell    # Run container detached
    rs           # alias for `run-shell`
    run-test     # Run the test command
    rt           # alias for `run-test`
    shut-down    # Shut down conatiner
    down         # alias for `shut-down`
```

# Docker Compose
Is used to setup the environment for the project. It uses the `Dockerfile.jdk` to build the image and the `docker-compose.yml` to setup the container. Target stage is set to `development` by default.

# Dockerfile.jdk
```Dockerfile
FROM maven:3.8.7-openjdk-18-slim as development

# Create a non-privileged user that the app will run under.
# See https://docs.docker.com/go/dockerfile-user-best-practices/
# ARG UID=10001
RUN useradd \
  --system \
  --create-home \
  --home-dir "/home/developer" \
  --shell "/bin/bash" \
  --gid root \
  --groups sudo \
  --uid 1001 \
  developer

USER developer 
WORKDIR /home/developer/project
CMD ["bash"]
```
