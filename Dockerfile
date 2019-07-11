FROM python:3.6

MAINTAINER Adrian Campos "https://github.com/adriancampos"

RUN mkdir -p /opt/colab

WORKDIR /opt/colab

COPY requirements.txt .

RUN pip install -r requirements.txt \
    && pip install jupyter_http_over_ws \
    && jupyter serverextension enable --py jupyter_http_over_ws

EXPOSE 8081

CMD ["jupyter","notebook","--NotebookApp.allow_origin='https://colab.research.google.com'","--allow-root","--port","8081","--NotebookApp.port_retries=0","--ip","0.0.0.0"]
