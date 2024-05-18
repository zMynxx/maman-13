#!/usrenv -S just --justfile
# ^ A shebang isn't required, but allows a justfile to be executed
#   like a script, with `./justfile test`, for example.

set dotenv-filename := '.env'
set dotenv-load := true
# set dotenv-path := './'
set ignore-comments := false
log := "warn"

#############
## Chooser ##
#############
default:
  @just --choose

## Simpele
# docker run --interactive --tty --rm --volume $(pwd)/app:/project --workdir /project eclipse-temurin:17-jdk-jammy bash
# Run the build command
build:
    @echo "Building dev-container..."
    docker compose build 
alias b := build

# Run container interactively
run:
    @echo "Running in interactive mode..."
    docker compose up
alias r := run

# Run container detached
run-detached:
    @echo "Running in detached mode..."
    docker compose up --detach
alias rd := run-detached

# Run container detached
run-shell:
    @echo "Running interactive shell..."
    docker compose up --detach
    docker compose exec --interactive --tty app bash
alias rs := run-shell

# Compile the project
run-compile:
  @echo "Running compile..."
  docker compose exec app mvn build
alias rc := run-compile

# Run the test command
run-test:
  @echo "Running test..."
  docker compose exec app mvn test
alias rt := run-test

# Restart container
restart:
    @echo "Restarting container..."
    docker compose restart
alias res := restart

# Shut down conatiner
shut-down:
    @echo "Restarting container..."
    docker compose down
alias down := shut-down

# Run the clean command
clean:
    @echo "Cleaning up..."
    docker compose down --volumes
