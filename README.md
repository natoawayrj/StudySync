# StudySync — Plano de Estudos & Gemini Notebook

Aplicação web progressiva (PWA) para organização de rotina de estudos, controle de sessões semanais, temporizador Pomodoro e consulta rápida de resumos integrados aos cadernos do Gemini Notebook.

> **Acesso online (GitHub Pages):** https://natoawayrj.github.io/StudySync/

---

## 1. Objeto e Finalidade do Projeto

Este repositório tem como **objeto exclusivo o estudo pessoal**.  
O **StudySync** foi desenvolvido como ferramenta individual de apoio à aprendizagem, planejamento acadêmico e prática de desenvolvimento web client-side, sem finalidade comercial e sem vínculo institucional.

Os dados do usuário (cronograma, sessões concluídas e tempo focado) permanecem armazenados localmente no próprio navegador (`localStorage`). A única comunicação externa é o envio de novos materiais de estudo, feito diretamente do navegador para a conta Google do próprio usuário (ver seção 6).

---

## 2. Funcionalidades

- **Painel & Hoje:** visão geral com indicadores de cadernos conectados, sessões concluídas/planejadas na semana, tempo total focado, próxima matéria e gráfico de acompanhamento.
- **Plano de Estudos:** geração e ajuste do cronograma semanal, com suporte a exportação de agenda no formato `.ics` e backup/restauração de dados em `.json`.
- **Cadernos & Resumos:** acesso organizado aos cadernos e resumos de estudo.
- **Novo material de estudo:** cadastro de links, vídeos do YouTube, texto/Markdown ou arquivos `.txt`/`.md`, enviados automaticamente como fonte do caderno selecionado pela Gemini Notebook API, com acompanhamento do status (pendente, processando, no caderno, falhou).
- **Importar pasta do agente:** lê a pasta de uma matéria gerada pelo Agente Faculdade (`.estado.json` + `topico.md` por tópico) e envia cada tópico como fonte do caderno, sem repetir os já importados. Se o caderno ainda não existir no Gemini Notebook, ele é criado com o mesmo título.
- **Temporizador Pomodoro:** cronômetro integrado para registro de sessões de foco.
- **Suporte PWA (Offline):** instalável no computador (Chrome/Edge) e no celular (Android/iOS) por meio de `manifest.json` e Service Worker (`sw.js`).

---

## 3. Tecnologias Utilizadas

- **HTML5** e **JavaScript (Vanilla)**
- **Tailwind CSS** (via CDN)
- **Chart.js** (via CDN)
- **Progressive Web App (PWA):** Web App Manifest e Service Worker
- **Gemini Notebook API** (REST, Public Preview) com **Google Identity Services** (OAuth 2.0 no navegador)
- **GitHub Pages** para hospedagem estática via HTTPS

---

## 4. Estrutura do Projeto

```text
StudySync/
├── index.html          # Interface principal, lógica da aplicação e armazenamento local
├── manifest.json       # Metadados do PWA para instalação
├── sw.js               # Service Worker para cache e funcionamento offline
├── icon-192.png        # Ícone da aplicação (192x192)
├── icon-512.png        # Ícone da aplicação (512x512)
├── iniciar_no_pc.bat   # Atalho para execução local no Windows via Python
├── LEIA-ME.txt         # Instruções rápidas de uso no PC e Android
└── README.md           # Documentação do projeto
```

---

## 5. Como Usar

### 5.1. Pelo GitHub Pages (recomendado)

1. Acesse **https://natoawayrj.github.io/StudySync/** em qualquer dispositivo.
2. Para instalar como aplicativo:
   - **Android (Chrome):** toque no menu (`⋮`) → **Adicionar à tela inicial** / **Instalar aplicativo**.
   - **PC (Chrome/Edge):** clique no ícone de **Instalar aplicativo** na barra de endereços.

### 5.2. Execução local (Windows)

1. Faça o download ou clone este repositório:
   ```bash
   git clone https://github.com/natoawayrj/StudySync.git
   ```
2. Entre na pasta `StudySync` e execute `iniciar_no_pc.bat` (requer Python instalado) para servir a aplicação em `http://localhost:8765`.

---

## 6. Envio de Materiais ao Gemini Notebook

Na aba **Cadernos & Resumos**, o cartão **Novo Material de Estudo** envia o material como fonte do caderno selecionado. A API não aceita chave de API, apenas OAuth 2.0, então é preciso uma configuração única (gratuita durante o preview):

1. No [Google Cloud Console](https://console.cloud.google.com/), crie um projeto e ative a **Gemini Notebook API** (`notebook.googleapis.com`).
2. Em **Google Auth Platform**, configure a tela de consentimento, adicione o escopo `https://www.googleapis.com/auth/notebook` em **Data Access** e, se o app estiver em modo de teste, inclua seu e-mail como usuário de teste.
3. Em **Clients**, crie um **OAuth Client ID** do tipo **Aplicativo da Web** com as origens JavaScript autorizadas `https://natoawayrj.github.io` e `http://localhost:8765`.
4. No StudySync, clique em **Configurar**, cole o Client ID e autorize com a conta Google dona dos cadernos.

Observações:

- A API está em Public Preview e só aceita **contas Google pessoais** (Workspace ainda não).
- Tipos aceitos: páginas web públicas, vídeos do YouTube e texto/Markdown de até 1 MB. PDF, outros binários e links do Drive ainda não são suportados pela API e devem ser adicionados direto no caderno.
- O login vale cerca de 1 hora; sem conexão ou sem login, o material fica como **Pendente** e é enviado ao reconectar.
- O Client ID fica salvo apenas no navegador e o token de acesso fica só em memória.
- A importação da pasta do agente envia só o texto dos tópicos (`topico.md`), respeitando o limite de 20 envios por minuto; `livro.pdf`, `saiba-mais/*.pdf` e imagens precisam ser arrastados direto no caderno. O material é de uso pessoal e não entra no repositório: é lido do disco no momento da importação.
- A API não remove fontes: **Remover da lista** apaga o item apenas no StudySync.

Referência: [documentação da Gemini Notebook API](https://developers.google.com/notebook/docs).

---

## 7. Backup e Sincronização

Como o armazenamento é 100% local no navegador, utilize as opções **Exportar JSON** e **Importar JSON** na aba **Plano de Estudos** caso deseje transferir ou sincronizar seu progresso entre dispositivos (por exemplo, PC e celular).

---

## 8. Uso e Direitos

Projeto mantido para **uso e estudo pessoal** por [natoawayrj](https://github.com/natoawayrj).
