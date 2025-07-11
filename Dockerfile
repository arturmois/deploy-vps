# --- Estágio de Build ---
  FROM node:20-alpine AS builder

  # Define o diretório de trabalho dentro do contêiner
  WORKDIR /app
  
  # Copia os arquivos package.json e package-lock.json para instalar as dependências
  COPY package*.json ./
  
  # Instala as dependências de desenvolvimento e produção
  RUN npm ci --only=production && npm install
  
  # Copia o restante do código-fonte
  COPY . .
  
  # Compila o código TypeScript para JavaScript
  RUN npm run build
  
  # --- Estágio de Produção ---
  FROM node:20-alpine
  
  # Define o diretório de trabalho
  WORKDIR /app
  
  # Copia as dependências de produção do estágio de build
  COPY --from=builder /app/node_modules ./node_modules
  
  # Copia o código compilado do estágio de build
  COPY --from=builder /app/dist ./dist
  
  # Copia package.json e package-lock.json para o estágio de produção
  COPY --from=builder /app/package*.json ./
  
  # Expõe a porta em que a aplicação irá rodar
  EXPOSE 3000
  
  # Define a variável de ambiente para produção
  ENV NODE_ENV=production
  
  # Comando para iniciar a aplicação
  CMD ["npm", "start"]