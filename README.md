# StudySync — Plano de Estudos & Gemini Notebook

Aplicação web progressiva (PWA) para organização de rotina de estudos, controle de sessões semanais, temporizador Pomodoro e consulta rápida de resumos integrados aos cadernos do Gemini Notebook.

> **Acesso online (GitHub Pages):** https://natoawayrj.github.io/StudySync/

---

## 1. Objeto e Finalidade do Projeto

Este repositório tem como **objeto exclusivo o estudo pessoal**.  
O **StudySync** foi desenvolvido como ferramenta individual de apoio à aprendizagem, planejamento acadêmico e prática de desenvolvimento web client-side, sem finalidade comercial e sem vínculo institucional.

Todos os dados do usuário (cronograma, sessões concluídas e tempo focado) permanecem armazenados localmente no próprio navegador (`localStorage`), sem envio para servidores externos.

---

## 2. Funcionalidades

- **Painel & Hoje:** visão geral com indicadores de cadernos conectados, sessões concluídas/planejadas na semana, tempo total focado, próxima matéria e gráfico de acompanhamento.
- **Plano de Estudos:** geração e ajuste do cronograma semanal, com suporte a exportação de agenda no formato `.ics` e backup/restauração de dados em `.json`.
- **Cadernos & Resumos:** acesso organizado aos cadernos e resumos de estudo.
- **Temporizador Pomodoro:** cronômetro integrado para registro de sessões de foco.
- **Suporte PWA (Offline):** instalável no computador (Chrome/Edge) e no celular (Android/iOS) por meio de `manifest.json` e Service Worker (`sw.js`).

---

## 3. Tecnologias Utilizadas

- **HTML5** e **JavaScript (Vanilla)**
- **Tailwind CSS** (via CDN)
- **Chart.js** (via CDN)
- **Progressive Web App (PWA):** Web App Manifest e Service Worker
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

## 6. Backup e Sincronização

Como o armazenamento é 100% local no navegador, utilize as opções **Exportar JSON** e **Importar JSON** na aba **Plano de Estudos** caso deseje transferir ou sincronizar seu progresso entre dispositivos (por exemplo, PC e celular).

---

## 7. Uso e Direitos

Projeto mantido para **uso e estudo pessoal** por [natoawayrj](https://github.com/natoawayrj).
