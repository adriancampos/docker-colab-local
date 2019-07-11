FROM nvidia/cuda:10.0-base-ubuntu18.04

MAINTAINER Adrian Campos "https://github.com/adriancampos"


# install Python
ARG _PY_SUFFIX=3
ARG PYTHON=python${_PY_SUFFIX}
ARG PIP=pip${_PY_SUFFIX}

# See http://bugs.python.org/issue19846
ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y \
    ${PYTHON} \
    ${PYTHON}-pip

RUN ${PIP} --no-cache-dir install --upgrade \
    pip \
    setuptools
	
RUN ln -s $(which ${PYTHON}) /usr/local/bin/python 

	


RUN mkdir -p /opt/colab

WORKDIR /opt/colab

COPY requirements.txt .

RUN pip install -r requirements.txt \
    && pip install jupyter_http_over_ws \
    && jupyter serverextension enable --py jupyter_http_over_ws

EXPOSE 8081

CMD ["jupyter","notebook","--NotebookApp.allow_origin='https://colab.research.google.com'","--allow-root","--port","8081","--NotebookApp.port_retries=0","--ip","0.0.0.0"]
