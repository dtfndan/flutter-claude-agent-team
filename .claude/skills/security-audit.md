---
name: security-audit
description: "Auditoría de seguridad. Revisa secretos, permisos, reglas de Firestore/Storage, configuración de red y prácticas de autenticación."
---

# /security-audit — Auditoría de Seguridad

Revisa la postura de seguridad del proyecto. Tu trabajo:

1. **Delegar** al agente `security-auditor`
   (ver `.claude/agents/security-auditor.md`).
2. **Revisar** (sin leer archivos sensibles):
   ### Secretos
   - Buscar strings sospechosos en código: API keys, passwords, tokens.
   - Verificar que `.gitignore` incluye: `.env`, `*.keystore`, `*.jks`,
     `google-services.json`, `GoogleService-Info.plist`, `key.properties`.
   - Verificar que no hay secretos en historial de git.

   ### Firebase
   - `firestore.rules`: buscar `allow read, write: if true` o reglas
     sin autenticación.
   - `storage.rules`: lo mismo.
   - App Check habilitado.
   - Reglas validadas contra emulador.

   ### Android
   - `android/app/src/main/AndroidManifest.xml`: permisos mínimos.
   - ProGuard/R8 habilitado en release.
   - `android:debuggable` es false en release.
   - `android:usesCleartextTraffic` es false.

   ### iOS
   - ATS (App Transport Security) no deshabilitado globalmente.
   - Entitlements mínimos.

   ### Código
   - No hay `print()` de datos sensibles.
   - Tokens almacenados en secure storage (no SharedPreferences).
   - Validación de input del usuario.

3. **Producir** reporte con severidad y recomendaciones.
4. **Al terminar**: Registrar en `PLAN.md` sección `## Auditoría`.

## Protocolo

No leer archivos en la deny list de `settings.json`. Reportar solo,
no modificar.
