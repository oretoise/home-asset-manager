# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A full-stack home asset management app — a better-designed alternative to Homebox. React SPA frontend + FastAPI backend, both independently runnable.

## Dev Commands

### Frontend (`ui/`)

```bash
npm run dev       # Vite dev server at http://localhost:5173
npm run build     # tsc -b + vite build → dist/
npm run lint      # ESLint (flat config)
npm run preview   # Preview production build
```

### Backend (`api/`)

```bash
fastapi run main.py   # Dev server at http://localhost:8000
```

No tests configured in either project yet.

## Architecture

**Two separate processes:** Vite dev server (frontend) + FastAPI (backend). No root-level orchestration — run each from its own directory.

**Frontend** uses [TanStack Router](ui/src/routes/) for file-based routing. Adding a file to `src/routes/` auto-generates [routeTree.gen.ts](ui/src/routeTree.gen.ts) — never edit that file manually. Route code-splitting is enabled automatically.

**Styling** is Tailwind v4 (configured via the Vite plugin, no separate config file). Theme colors are CSS custom properties in [index.css](ui/src/index.css) using `@theme inline` blocks. Dark/light mode is persisted to localStorage via [ThemeProvider](ui/src/components/theme-provider.tsx). Use `cn()` from [lib/utils.ts](ui/src/lib/utils.ts) for class merging.

**shadcn/ui** components live in [src/components/ui/](ui/src/components/ui/). Use the `@/*` alias to import from `src/` (e.g., `@/components/ui/button`).

**Backend** is minimal FastAPI in [api/main.py](api/main.py). No database or ORM wired up yet.

## Tooling Notes

- Frontend: Node 24 via `mise`, `npm` for packages
- Backend: Python 3.14 via `mise` + `.python-version`, `uv` for packages (`uv.lock` is the source of truth)
- TypeScript: strict mode with `noUnusedLocals` and `noUnusedParameters` — unused imports will fail the build
