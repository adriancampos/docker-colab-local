# docker-colab-local
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/aecampos/colab-local.svg?label=build)](https://hub.docker.com/r/aecampos/colab-local)

A Docker container to act as a local runtime for [Google Colab](https://colab.research.google.com).

## Run
```bash
$ docker run --runtime=nvidia -it --rm -p 8081:8081 aecampos/docker-colab-local:latest
```

## Connecting
If the container isn't running on your local machine, you'll need to forward port 8081:
```
ssh YOUR_REMOTE_MACHINE -L 8081:localhost:8081
```

In Colaboratory, click the "Connect" button and select "Connect to local runtime...". Enter the port 8081 step in the dialog that appears and click the "Connect" button. (from [colaboratory](https://research.google.com/colaboratory/local-runtimes.html))


## Notes
* Missing some packages that come with Colab. Install them with `!pip install` in your notebook.
