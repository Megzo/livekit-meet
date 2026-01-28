# AGENTS

This file is guidance for agentic coding tools working in this repo.
Follow existing project patterns and prefer minimal, focused changes.

## Project summary

- Next.js (App Router) + TypeScript + React 18.
- LiveKit Components + livekit-client/server SDKs.
- Package manager: pnpm (see package.json).

## Setup

- Install deps: `pnpm install`
- Env: copy `.env.example` to `.env.local` and fill required values.
- Dev server: `pnpm dev` (http://localhost:3000).

## Build / lint / test commands

- Dev: `pnpm dev`
- Build: `pnpm build`
- Start production: `pnpm start`
- Lint: `pnpm lint`
- Lint fix: `pnpm lint:fix`
- Format check: `pnpm format:check`
- Format write: `pnpm format:write`
- Tests (all): `pnpm test` (runs `vitest run`)

### Run a single test

- By file: `pnpm test -- lib/getLiveKitURL.test.ts`
- By test name: `pnpm test -- -t "handles URLs with paths"`
- By file + name: `pnpm test -- lib/getLiveKitURL.test.ts -t "inserts the region"`

## Code structure

- App Router pages live under `app/`.
- API routes use `app/api/**/route.ts` and return `NextResponse`.
- Shared logic is under `lib/`.
- CSS modules live in `styles/` and are imported from components.
- Path alias: `@/*` maps to repo root (see tsconfig paths).

## TypeScript + React style

- TS is `strict: true`; keep types tight and avoid `any`.
- Use `type` imports for types (see `type VideoCodec`).
- Prefer explicit component prop types in function signatures.
- Keep `use client` as the first line in client components.
- Use hooks for side-effects and memoization (`useEffect`, `useMemo`, `useCallback`).
- Avoid unnecessary re-renders: memoize objects passed to SDK constructors.

## Imports

- Prefer the `@/` alias for internal modules.
- Keep external packages grouped separately from internal modules.
- CSS imports typically come first when needed (see `app/layout.tsx`).
- Use `import type { ... }` for type-only imports.

## Formatting

- Prettier is used; follow its defaults (2-space indent, single quotes).
- Keep lines readable; wrap long JSX props across lines.
- Use trailing commas where Prettier adds them.

## Naming conventions

- Components: `PascalCase`.
- Hooks: `useX`.
- Variables/functions: `camelCase`.
- Constants: `SCREAMING_SNAKE_CASE` for env-like constants.
- Files: `camelCase` for utilities, `PascalCase` for React components when needed.

## Error handling

- API routes: validate inputs early and return `NextResponse` with status.
- Use `try/catch` around server handlers and return a 500 on errors.
- Client components: log errors to console and show simple alerts if needed.
- Avoid swallowing errors silently.

## LiveKit + app-specific patterns

- `Room` and options are created with `useMemo` and reused.
- E2EE setup uses `useSetupE2EE` and `ExternalE2EEKeyProvider`.
- Connection details are fetched from `/api/connection-details` by default.
- Use `data-lk-theme="default"` when rendering LiveKit UI containers.

## CSS conventions

- Global styles are in `styles/globals.css`.
- Component styles use CSS modules (e.g., `styles/Home.module.css`).
- Avoid inline styles unless local and very small.

## Environment variables

- Public vars are prefixed with `NEXT_PUBLIC_`.
- Server-only vars are read in API routes from `process.env`.
- Do not hardcode secrets in code or tests.

## Testing guidance

- Tests use Vitest (`vitest run`).
- Place tests near code (e.g., `lib/getLiveKitURL.test.ts`).
- Keep tests deterministic and avoid network calls.

## Cursor/Copilot rules

- No `.cursor/rules/`, `.cursorrules`, or `.github/copilot-instructions.md` were found.

## Notes for agents

- Do not change Docker or deployment files unless asked.
- Keep changes minimal and aligned with existing patterns.
- This fork contains footer changes; preserve those when editing UI.
