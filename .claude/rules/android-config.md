---
paths:
  - "android/**"
---

# Android Config Rules

- `android/app/build.gradle(.kts)` debe tener `minifyEnabled true` y `shrinkResources true` en release.
- `minSdk` documentado en `PLAN.md > Deploy` con justificación.
- `targetSdk` = último estable soportado por Flutter.
- `versionCode` y `versionName` sincronizados con `pubspec.yaml`. Considera un script que derive uno del otro.
- Firma de release: keystore **fuera del repo**, ruta en `android/key.properties` ignorado por git.
- `AndroidManifest.xml`: sólo los permisos estrictamente necesarios. Cada permiso tiene justificación en `PLAN.md`.
- AdMob: `AD_MANAGER_APP_ID` viene de `google-services.json` + `<meta-data>` — nunca hardcoded en strings.

## Prohibiciones

- ❌ `google-services.json` committeado (está en `.gitignore`).
- ❌ `android:debuggable="true"` en release.
- ❌ Permisos peligrosos (cámara, ubicación, contactos) sin prompt en runtime y política de privacidad actualizada.
