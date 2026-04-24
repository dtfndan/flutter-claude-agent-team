---
name: build-android
description: "Genera APK o AAB firmado para Android. Configura ofuscación, ProGuard/R8, split-per-abi y verifica google-services.json."
---

# /build-android — Build Android

Genera artefacto Android de producción. Tu trabajo:

1. **Leer** `PLAN.md` sección `## Deploy`.
2. **Delegar** al agente `signing-specialist`
   (ver `.claude/agents/signing-specialist.md`).
3. **Verificar**:
   - `android/key.properties` existe (sin leer su contenido — regla deny).
   - `android/app/build.gradle` tiene `signingConfigs.release` configurado.
   - `google-services.json` presente en `android/app/`.
   - `versionCode` y `versionName` en `pubspec.yaml` actualizados.
   - `flutter analyze` sin errores.
4. **Preguntar** al usuario:
   - ¿AAB (Play Store) o APK (distribución directa)?
   - ¿Habilitar ofuscación (`--obfuscate --split-debug-info`)?
   - ¿Target API level?
5. **Ejecutar** (con aprobación):
   ```
   flutter build appbundle --release --obfuscate --split-debug-info=build/symbols/
   ```
   o
   ```
   flutter build apk --release --obfuscate --split-debug-info=build/symbols/
   ```
6. **Post-build**:
   - Verificar tamaño del artefacto.
   - Recordar guardar `build/symbols/` para crashlytics.
   - Sugerir testing en dispositivo real antes de subir a Play Console.
7. **Al terminar**: Registrar en `PLAN.md` sección `## Deploy`.

## Protocolo

No leer `key.properties` ni keystores. Si falla la firma, guiar al
usuario a verificar sus credenciales manualmente.
