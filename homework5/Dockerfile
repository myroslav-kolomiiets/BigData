# Використання офіційного образу Node.js
FROM node:20

# Створення робочого каталогу
WORKDIR /app

# Копіювання залежностей та коду в контейнер
COPY package*.json ./
RUN npm install
COPY . .

# Використання порту 8080
EXPOSE 8080

# Запуск додатка
CMD ["node", "index.js"]
