# PDF Lab 2.0 — Roleta do Conhecimento

Web App React + Vite + Supabase com autenticação, 72 temas, roleta, cronómetro, diário, XP, estatísticas e histórico sincronizado por utilizador.

## Instalação

1. Instala Node.js 20+.
2. Cria um projecto no Supabase (ou escolhe um projecto teu existente).
3. A base de dados Supabase já foi criada e configurada; não voltes a executar `supabase/schema.sql` (é uma versão antiga).
4. Em Authentication → Providers, activa Email. Para confirmar e-mails, configura o SMTP e o URL do site conforme necessário.
5. As variáveis públicas do projecto estão pré-configuradas em `.env.production` e `.env` (ambas são chaves publicáveis, não secretas). Nunca uses a `service_role` no frontend.
6. Executa `npm install` e `npm run dev`.
7. Para testar o build: `npm run build`.
8. Para publicar, importa o repositório na Vercel ou Netlify, define as mesmas variáveis de ambiente e faz deploy. Configura os Site URL/Redirect URLs do Supabase para o domínio final.

## Segurança e comportamento

A tabela `learning_sessions` tem Row Level Security; cada utilizador só acede aos seus próprios desafios. O XP é calculado a partir das sessões guardadas. A roleta é aleatória e o cronómetro mede tempo com a página aberta; não é um sistema de prova ou de prevenção de fraude. O manifesto permite a experiência instalável em navegadores compatíveis, mas não inclui ainda service worker/offline completo nem notificações push.

## Evoluções futuras

Biblioteca editorial com curadoria e referências, gravação de vídeo, verificação de aprendizagem, rankings, notificações, modo offline e moderação de conteúdos.

## Publicar na Vercel

Importa este projecto numa conta Vercel, escolhe o framework **Vite**, usa `npm run build` e directório de saída `dist`. Define `VITE_SUPABASE_URL` e `VITE_SUPABASE_PUBLISHABLE_KEY` com os valores do ficheiro `.env.production` se a plataforma os solicitar. Após publicar, adiciona o domínio final em Supabase Authentication → URL Configuration (Site URL e Redirect URLs).

O endereço antigo de Supabase Edge Functions devolve HTML como código e não deve ser usado para abrir a aplicação.
