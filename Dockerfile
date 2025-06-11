FROM node:18-slim

WORKDIR /app

# Copy only package files first to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the code (for build image, but will be overridden in dev)
COPY . .

# Build TypeScript (for build image, not needed in dev with mounting)
RUN npm run build

EXPOSE 9090

# Add entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# ---
# For development, mount your code with:
# docker run --rm -it -v $(pwd):/app -w /app -p 9090:9090 asset-transfer-basic
# ---
