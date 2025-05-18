FROM node:18-alpine 
WORKDIR /bezkoder-app 
COPY package*.json ./ 
RUN npm install 
COPY . . 
RUN npm run build 
FROM nginx:alpine 
EXPOSE 80 
COPY --from=0 /app/dist /usr/share/nginx/html 
CMD ["nginx", "-g", "daemon off;"] 
