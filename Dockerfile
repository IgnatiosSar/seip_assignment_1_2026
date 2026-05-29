# Use a lightweight base image
FROM node:18-alpine
# Set working directory
WORKDIR /app
# Create non-root user for security
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001 -G nodejs && \
    chown -R nodejs:nodejs /app
# Install dependencies and copy application code
COPY package*.json ./
RUN npm install
COPY . .
# Expose the application port and run as non-root user
EXPOSE 3000
USER nodejs
CMD ["npm", "start"]