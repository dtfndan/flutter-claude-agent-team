---
paths:
  - "functions/**/*.ts"
  - "functions/**/*.js"
---

# Cloud Functions Rules

- TypeScript estricto (`"strict": true`, `noImplicitAny`, `noUncheckedIndexedAccess`).
- Node.js LTS (ej. 20 o la que Firebase Functions soporte oficialmente — verifica cuando despliegues).
- Una función por archivo en `functions/src/<domain>/<function>.ts`; `index.ts` solo re-exporta.
- Validación de input con `zod` o similar antes de tocar la DB.
- **Nunca** embebas secretos en el código. Usa `defineSecret` de `firebase-functions/params` + Secret Manager.
- Logging estructurado con `functions.logger` (no `console.log` en producción).
- Timeouts y memoria explícitos por función; no confíes en defaults.
- Funciones HTTP detrás de App Check cuando la llama la app.

## Error handling

- Convierte errores a `HttpsError` con código semántico (`permission-denied`, `invalid-argument`, `not-found`).
- No filtres stack traces al cliente.

## Tests

- Unit tests con `firebase-functions-test` en modo online/offline según convenga.
- Cobertura objetivo: 70%+ de la lógica de negocio (no necesariamente del wiring).
