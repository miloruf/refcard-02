# Build-Stage: Abhaengigkeiten installieren, testen, bauen
FROM docker.io/library/node:22-slim AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY public ./public
COPY src ./src
RUN CI=true npm test
RUN npm run build

# Runtime-Stage: statische Dateien mit nginx ausliefern
FROM docker.io/library/nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
