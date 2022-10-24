FROM alpine 
EXPOSE 8000 
RUN apt update
RUN apt install nodejs -y
RUN apt install npm -y
RUN npm install express
COPY src/sample.js /hone/ubuntu
RUN node /hone/ubuntu/sample.js

