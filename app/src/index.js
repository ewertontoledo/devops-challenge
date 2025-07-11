'use strict';

const express = require('express');    // framework web
const morgan = require('morgan');      // logger HTTP
const helmet = require('helmet');      // segurança HTTP
const path = require('path');          // manipulação de caminhos
require('dotenv').config();            // carrega variáveis de ambiente

const app = express();

const PORT = process.env.PORT || 8080;
const APP_NAME = process.env.APP_NAME || 'DevOps Challenge App';

// Serve arquivos estáticos (CSS) da pasta 'public'
app.use(express.static(path.resolve(__dirname, '../public')));

// Segurança HTTP com Helmet
app.use(helmet());

// Logs detalhados das requisições HTTP
app.use(morgan('combined'));

// Endpoint de health check
app.get('/health', (req, res) => {
  res.status(200).json({ status: 'UP' });
});

// Página inicial simples com título e mensagem
app.get('/', (req, res) => {
  res.send(`
    <html>
      <head>
        <title>${APP_NAME}</title>
        <link rel="stylesheet" href="/styles.css" />
      </head>
      <body>
        <div class="container">
          <h1>🚀 Aplicação web usada no desafio - ${APP_NAME}</h1>
          <p>Entregue por: <strong>Ewerton Toledo</strong></p>
        </div>
      </body>
    </html>
  `);
});

// Inicia o servidor na porta definida
app.listen(PORT, () => {
  console.log(`${APP_NAME} listening on port ${PORT}`);
});