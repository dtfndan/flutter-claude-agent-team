---
name: backend
description: "Agente Firebase. Diseña esquemas Firestore/Storage, reglas de seguridad, Cloud Functions, Auth, App Check. Usa siempre las versiones más recientes de Firebase CLI y paquetes FlutterFire."
---

# /backend — Firebase

Fase de backend. Tu trabajo:

1. **Leer** secciones `## UX/UI` y `## Arquitectura` de `PLAN.md`.
2. **Verificar versiones** (Directriz Crítica):
   - `firebase --version` → si no es la última, `npm i -g firebase-tools`.
   - Paquetes FlutterFire (`firebase_core`, `firebase_auth`,
     `cloud_firestore`, `firebase_storage`, `cloud_functions`,
     `firebase_app_check`) en su última matriz compatible.
3. **Delegar** al agente `firebase-lead`
   (ver `.claude/agents/firebase-lead.md`). Sub-delega según lo que haga
   falta:
   - `firestore-specialist` → colecciones, índices, queries, paginación.
   - `auth-specialist` → providers, flujos, reautenticación.
   - `storage-specialist` → estructura de buckets, URLs firmadas.
   - `functions-specialist` → triggers, callables, scheduled,
     Secret Manager.
   - `security-rules-specialist` → reglas Firestore + Storage con
     mínimo privilegio, validadas contra emuladores.
4. El lead debe producir:
   - Diagrama textual de colecciones y sus relaciones.
   - Reglas de seguridad (`firestore.rules`, `storage.rules`) con
     tests en emulador.
   - Contratos de Cloud Functions (callables con zod, triggers
     documentados).
   - Plan de índices compuestos (`firestore.indexes.json`).
   - Estrategia de App Check (Play Integrity + DeviceCheck/App Attest).
5. **Al terminar**:
   - Escribir en la sección `## Backend` de `PLAN.md`.
   - Actualizar `STATE.md` → `Fase actual: Backend definido; listo para /code`.

## Protocolo

Nunca desplegar reglas sin prueba en emulador. Nunca meter secretos en
código. Pedir aprobación antes de cada cambio de archivo.
