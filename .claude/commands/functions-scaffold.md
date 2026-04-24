---
name: functions-scaffold
description: "Crea Cloud Functions (TypeScript). Genera scaffolding para triggers, callables, scheduled functions con validación zod y Secret Manager."
---

# /functions-scaffold — Cloud Functions

Crea o extiende Cloud Functions. Tu trabajo:

1. **Leer** `PLAN.md` sección `## Backend`.
2. **Delegar** al agente `functions-specialist`
   (ver `.claude/agents/functions-specialist.md`).
3. **Verificar**:
   - `functions/` existe con `package.json` y `tsconfig.json`.
   - Si no, inicializar: `firebase init functions` (TypeScript).
   - Node.js LTS instalado.
   - Aplicar Directriz Crítica: `npm outdated` en `functions/`.
4. **Preguntar** al usuario:
   - ¿Qué tipo de function? (trigger, callable, scheduled, HTTP).
   - ¿Qué evento/colección?
   - ¿Qué lógica de negocio?
5. **Generar** siguiendo `.claude/rules/cloud-functions.md`:
   - **TypeScript estricto** (`strict: true` en tsconfig).
   - **Validación con zod** para inputs de callables.
   - **Secretos** en Secret Manager (nunca en código o env).
   - **Logging** estructurado con `functions.logger`.
   - **Error handling** con `HttpsError` codes apropiados.
   - **Idempotencia** en triggers (event deduplication).
6. **Estructura**:
   ```
   functions/
     src/
       index.ts          # exports
       triggers/          # Firestore, Auth triggers
       callables/         # onCall functions
       scheduled/         # cron jobs
       utils/             # helpers compartidos
     package.json
     tsconfig.json
   ```
7. **Al terminar**: Registrar en `PLAN.md` sección `## Backend`.

## Protocolo

Probar en emulador antes de deployer. No deployer a producción sin
aprobación.
