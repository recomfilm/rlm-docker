FROM python:3.8-slim

RUN apt-get update -yq \
 && apt-get install -yq \
    curl unzip

RUN mkdir statease-rlm

WORKDIR /statease-rlm

RUN curl "https://reprisesoftware.com/wp-content/uploads/2024/v16-1/x64_l1.admin.tar.gz" -o "rlm.tgz" \
  && tar xzf rlm.tgz --strip-components=1

# Erstelle die Verknüpfung
RUN ln -s /root/.rlm/daselement.set /statease-rlm/daselement.set
RUN ln -s /root/.rlm/peregrinel.set /statease-rlm/peregrinel.set

CMD [ "/statease-rlm/rlm" ]
