FROM node:21.6.2-bookworm-slim

# Install system dependencies
RUN apt update && apt install -y openssl curl

WORKDIR /home

# Copy package files
COPY package*.json ./

# Clear npm cache and install dependencies
RUN npm cache clean --force
RUN npm install

# Copy source code
COPY . .

# Set environment variables
ENV NEXT_TELEMETRY_DISABLED 1
ENV NODE_ENV development

EXPOSE 3000

CMD ["npm", "run", "dev"]
