FROM python:3.8-slim

RUN apt-get update -yq \
 && apt-get install -yq \
    curl unzip

RUN curl "https://reprisesoftware.com/wp-content/uploads/2024/v16-1/x64_l1.admin.tar.gz" -o "rlm.tgz" \
  && tar xzf rlm.tgz --strip-components=1

WORKDIR /statease-rlm

CMD [ "/statease-rlm/rlm" ]
