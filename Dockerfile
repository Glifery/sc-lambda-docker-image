FROM node:6.11

ENV TERM=xterm

RUN apt-get update && apt-get install -y default-jre vim

RUN apt-get -y autoremove && apt-get clean && apt-get autoclean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN npm config set unsafe-perm=true && npm install -g serverless jscs mocha sequelize-cli

COPY ["./entry_point.sh", "entry_point.sh"]

RUN chmod 0777 ./entry_point.sh

EXPOSE 3000
EXPOSE 8000

ENTRYPOINT ["./entry_point.sh"]

