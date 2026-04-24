---
name: auth-setup
description: "Configura Firebase Auth. Elige providers (email, Google, Apple, phone), implementa flujos y maneja reautenticación."
---

# /auth-setup — Firebase Auth

Configura autenticación. Tu trabajo:

1. **Leer** `PLAN.md` secciones `## UX/UI` (flujos de auth) y
   `## Backend`.
2. **Delegar** al agente `auth-specialist`
   (ver `.claude/agents/auth-specialist.md`).
3. **Verificar versiones** (Directriz Crítica):
   - Consultar pub.dev: `firebase_auth`, `google_sign_in`,
     `sign_in_with_apple`.
4. **Preguntar** al usuario:
   - ¿Qué providers? (email/password, Google, Apple, phone, anónimo).
   - ¿Registro con verificación de email?
   - ¿Flujo de "olvidé mi contraseña"?
   - ¿Linking de cuentas (mismo email, diferentes providers)?
   - ¿Eliminación de cuenta (requisito de Apple)?
5. **Implementar**:
   - Configuración de providers en Firebase Console (guía paso a paso).
   - Código en `lib/features/auth/`:
     - `domain/repositories/auth_repository.dart` (interfaz).
     - `data/repositories/auth_repository_impl.dart` (implementación).
     - `domain/usecases/` (sign_in, sign_up, sign_out, reset_password).
     - `presentation/` (login, register, forgot_password screens).
   - Configuración por plataforma:
     - Android: SHA-1/SHA-256 en Firebase Console.
     - iOS: URL schemes, capabilities.
6. **Al terminar**: Registrar en `PLAN.md` sección `## Backend`.

## Protocolo

No almacenar tokens manualmente — Firebase Auth los gestiona.
Re-autenticar antes de operaciones sensibles (delete account,
change email).
