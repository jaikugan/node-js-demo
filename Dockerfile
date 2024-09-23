FROM node:latest
WORKDIR /app
ADD . .
RUN npm install
USER jenkins
CMD ["node", "index.js"]  
 
