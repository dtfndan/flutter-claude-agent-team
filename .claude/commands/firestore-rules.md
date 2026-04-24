---
name: firestore-rules
description: "Escribe y valida reglas de seguridad de Firestore. Aplica principio de mínimo privilegio y prueba contra emulador."
---

# /firestore-rules — Reglas de Firestore

Escribe reglas de seguridad. Tu trabajo:

1. **Leer** `PLAN.md` sección `## Backend` (esquema de Firestore).
2. **Delegar** al agente `security-rules-specialist`
   (ver `.claude/agents/security-rules-specialist.md`).
3. **Principios** (ver `.claude/rules/firestore-rules.md`):
   - **Mínimo privilegio**: deny por defecto, allow solo lo necesario.
   - **Autenticación**: `request.auth != null` en toda regla (salvo datos públicos explícitos).
   - **Autorización**: verificar ownership (`request.auth.uid == resource.data.userId`).
   - **Validación**: verificar tipos y rangos en writes (`request.resource.data`).
   - **Rate limiting**: limitar tamaño de documentos y campos.
4. **Generar** `firestore.rules`:
   ```
   rules_version = '2';
   service cloud.firestore {
     match /databases/{database}/documents {
       // Funciones helper
       function isAuthenticated() { return request.auth != null; }
       function isOwner(userId) { return request.auth.uid == userId; }

       // Reglas por colección...
     }
   }
   ```
5. **Probar** en emulador:
   - `firebase emulators:start --only firestore`
   - Tests con requests autenticados y no autenticados.
6. **Al terminar**: Registrar en `PLAN.md` sección `## Backend`.

## Protocolo

Nunca usar `allow read, write: if true` en producción. Mostrar reglas
antes de escribir. Probar en emulador antes de deployer.
