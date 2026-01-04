ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache git bluez python3 py3-pip jq

WORKDIR /app

RUN git clone https://github.com/Nawo/easywallbox.git .

RUN pip install -r requirements.txt --break-system-packages

COPY run.sh /app/run.sh
RUN chmod a+x /app/run.sh

CMD [ "/app/run.sh" ]