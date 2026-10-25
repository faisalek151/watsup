# Watsup — WhatsApp CRM

> Self-hostable WhatsApp® CRM — shared inbox, contacts, sales pipelines, broadcasts, interactive flows, and AI agents.

[![License: MIT](https://img.shields.io/badge/License-MIT-10b981.svg)](./LICENSE)
[![Next.js 16](https://img.shields.io/badge/Next.js-16-black?logo=nextdotjs)](https://nextjs.org)
[![Supabase](https://img.shields.io/badge/Supabase-Postgres%20%2B%20Auth-3ecf8e?logo=supabase)](https://supabase.com)

## Modules Included

- **Shared Inbox** — Official WhatsApp Business Cloud API inbox with multi-agent assignment, statuses, internal notes, voice notes, media previews, and quick replies.
- **Contacts & Custom Fields** — Tags, custom contact attributes, CSV import, and phone deduplication.
- **Sales Pipelines** — Kanban deal boards linked to WhatsApp conversations, configured with **INR (`₹`)** as the default currency (configurable per account in Settings).
- **Broadcasts** — Meta-approved message templates, variable personalization, and delivery/read tracking.
- **Automations & Interactive Flows** — No-code rule automations and visual multi-step conversational flows (triggers on inbound messages, keywords, tags, or schedules).
- **AI Agents & Knowledge Base** — Bring-your-own-key (OpenAI, Anthropic, or OpenAI-compatible) reply drafting, auto-reply bot with human handoff, and Postgres/pgvector RAG knowledge base.
- **Real-time Dashboard** — Response times, daily message volume, pipeline value, and cross-module activity feed.
- **Team Accounts & Roles** — Invite links with `owner`, `admin`, `agent`, and `viewer` permissions.
- **Public REST API & MCP Server** — Scoped API keys under `/api/v1` ([`docs/public-api.md`](./docs/public-api.md)) and Model Context Protocol server in [`mcp-server/`](./mcp-server) ([`docs/mcp.md`](./docs/mcp.md)).

## Quick Start

```bash
git clone https://github.com/faisalek151/watsup.git
cd watsup
npm install
cp .env.local.example .env.local   # fill in Supabase + Meta credentials
npm run dev
```

Open <http://localhost:3000> — you will be redirected to `/login` (or `/dashboard` once signed in).

### Required Environment Variables (`.env.local`)

| Variable | Description |
|---|---|
| `NEXT_PUBLIC_SUPABASE_URL` | Supabase project URL (`Project Settings → API`) |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | Supabase `anon` public key |
| `SUPABASE_SERVICE_ROLE_KEY` | Supabase `service_role` secret key (server-side only) |
| `ENCRYPTION_KEY` | 64-char hex AES-256-GCM key (`node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"`) |
| `META_APP_SECRET` | Meta App Secret (`Meta for Developers → App Settings → Basic`) |

### Database Setup (Supabase)

Apply all SQL migrations in [`supabase/migrations/`](./supabase/migrations) (`001_initial_schema.sql` through `060_default_currency_inr.sql`) against your Supabase Postgres database:

```bash
npx supabase link --project-ref <your-project-ref>
npx supabase db push
```

## Customization Defaults

- **Brand:** `Watsup` across UI navigation, auth flows, metadata, and emerald favicon.
- **Default Theme:** `Emerald` accent (`dark` mode default; light/dark and 5 accents switchable live in **Settings → Appearance**).
- **Default Currency:** `INR` (`₹`) across app formatters, automation deal creation, and database defaults (`060_default_currency_inr.sql`).
- **UI Locales:** `en` (default), `es`, `ko`, `pt` via `NEXT_PUBLIC_APP_LOCALE`.

## Documentation

- [Public REST API (`docs/public-api.md`)](./docs/public-api.md)
- [MCP Server (`docs/mcp.md`)](./docs/mcp.md)
- [Docker Deployment (`docs/docker.md`)](./docs/docker.md)
- [WhatsApp Connection Troubleshooting (`docs/whatsapp-connection-troubleshooting.md`)](./docs/whatsapp-connection-troubleshooting.md)
- [Multi-WABA Setup (`docs/multi-waba.md`)](./docs/multi-waba.md)
- [Auth Emails (`docs/auth-emails.md`)](./docs/auth-emails.md)

## Stack

- **Frontend / Server:** Next.js 16 (App Router), React 19, TypeScript, Tailwind CSS v4
- **Database & Auth:** Supabase (Postgres, Auth, Storage, Realtime, RLS)
- **Messaging:** Meta Cloud API (Official WhatsApp Business API)

## License

[MIT](./LICENSE) — built upon the open-source [wacrm](https://github.com/ArnasDon/wacrm) template.
