# Etapa 1: build da aplicação
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Etapa 2: imagem final leve
FROM node:18-alpine
WORKDIR /app
 # Instala curl para healthcheck
RUN apk add --no-cache curl  
# Copia arquivos do build para imagem final         
COPY --from=builder /app /app
ENV PORT=8080
EXPOSE 8080

# Healthcheck para verificar se a aplicação está ativa
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s CMD curl -f http://localhost:8080/health || exit 1

# Inicia a aplicação
CMD ["npm", "start"]