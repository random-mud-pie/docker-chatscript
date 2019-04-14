# ChatScript on Docker

[ChatScript](https://github.com/random-mud-pie/ChatScript)  is the next generation chatbot engine that has won the Loebner's 4 times and is the basis for natural language company for a variety of tech startups. It is a rule-based engine, where rules are created by humans writers in program scripts through a process called dialog flow scripting.

This repo is a containerized version.

[![Docker Pulls](https://img.shields.io/docker/pulls/randommudpie/docker-chatscript.svg)](https://hub.docker.com/r/randommudpie/docker-chatscript/)
[![Docker Stars](https://img.shields.io/docker/stars/randommudpie/docker-chatscript.svg)](https://hub.docker.com/r/randommudpie/docker-chatscript/)

## Install Docker

Follow [these instructions](https://docs.docker.com/engine/installation/) to get Docker running on your server.

## Available on Docker Hub (prebuilt) or built from source

### To run using docker just do the following:

```
> docker-compose pull # if you haven't pulled or built
> docker-compose up
```

And ChatScript should be accessible via 'localhost:1024'.

Note: if you have not pulled any of the images from the repository, when you do an `up`, it will attempt to build from scratch!

### To pull the latest images to your machine:

```
docker pull random-mud-pie/docker-chatscript
```

Or just `docker-compose pull`.

### To build from scratch

```
docker-compose build
```

## License
MIT License (MIT)
