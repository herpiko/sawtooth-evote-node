FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y curl iputils-ping
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
COPY shuffler.js shuffler.js
RUN rm -rf tp/node_modules
RUN npm install pg async shuffle-array

RUN echo "node shuffler.js" >> /bin/shuffler
RUN chmod +x /bin/shuffler

CMD ["bash", "-c", "/bin/shuffler"]
