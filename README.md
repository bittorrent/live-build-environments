# live-build-environments

This repo defines environments that can be used to build our projects.

# Suggested Usage with Live Repositories

If you have a Live repository that includes a `docker-compose.yml`, you can probably use these environments to build that.

First, generate an SSH key for use exclusively inside docker containers and add it to GitHub. Then add the following aliases to your shell:

```
alias android-env='GITHUB_SSH_KEY=~/.ssh/github docker-compose run --rm android-env'
alias linux-env='GITHUB_SSH_KEY=~/.ssh/github docker-compose run --rm linux-env'
```

To build something in that environment, prefix your build commands with either `android-env` or `linux-env`:

```
android-env ./scripts/build -t android
linux-env ./scripts/build
```

# Suggested General Usage

Pick a tag from [DockerHub](https://hub.docker.com/r/bittorrent/live-build-environments/tags/) and execute a desired command inside the container:

```
docker run --rm bittorrent/live-build-environments:$DOCKER_TAG $command
```
