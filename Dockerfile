# Gunakan image Node.js resmi
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy file package.json dan package-lock.json (kalau ada)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy seluruh project
COPY . .

# Expose port (sesuaikan dengan PORT yang ada di .env)
EXPOSE 3001

# Jalankan aplikasi
CMD ["node", "index.js"]
