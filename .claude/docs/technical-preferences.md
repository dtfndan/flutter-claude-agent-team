# Preferencias técnicas

Stack de referencia fijo para todos los proyectos que use esta agencia. Los
agentes deben respetarlo salvo ADR explícito que justifique desviación.

## SDK y lenguaje

- **Flutter**: canal `stable`, versión más reciente (verificable con
  `flutter --version` y `flutter upgrade`). Prohibido pinear versiones
  antiguas en `pubspec.yaml` sin ADR.
- **Dart**: el que llega con la Flutter stable en uso.
- **Null-safety**: obligatoria. Sin `dynamic` salvo justificación.

## Estado

- **Opciones**: Riverpod o Bloc.
- La decisión se toma con `/pick-state-management` y se registra en
  `docs/adr/adr-001-state-management.md`.
- Una vez elegida, **no se mezclan** paradigmas en la misma feature.

## Backend (Firebase)

- **Auth**: Firebase Auth — providers según producto (email/password, Google,
  Apple si hay iOS, anónimo cuando haga falta).
- **Base de datos**: Firestore (default). RTDB solo para presencia o alta
  frecuencia con ADR.
- **Storage**: Firebase Storage con reglas de mínimo privilegio.
- **Funciones**: Cloud Functions v2 en **TypeScript** sobre Node.js LTS
  (actualmente 20). Compiladas con `tsc`, desplegadas con `firebase deploy`.
- **App Check**: obligatorio en producción (Play Integrity + DeviceCheck/App
  Attest). Debug tokens solo en entornos de dev.
- **CLI Firebase**: versión más reciente global (`npm i -g firebase-tools`).

## Monetización

- **AdMob**: banner, interstitial y rewarded según diseño. Test IDs en dev,
  IDs reales solo en release builds firmados.
- **UMP (User Messaging Platform)**: consentimiento GDPR/CCPA obligatorio
  antes de cargar anuncios personalizados.
- **`app-ads.txt`**: alojado en el dominio raíz del proyecto; línea generada
  por AdMob, verificada tanto en Play Console como en App Store Connect.

## CI/CD

- **Opciones**: GitHub Actions o Codemagic.
- La decisión se registra en `docs/adr/adr-002-cicd.md`.
- Jobs mínimos: `analyze` (`flutter analyze`), `test` (unit + widget),
  `build` (android/ios en matriz), `deploy` (Firebase App Distribution o
  tiendas, con aprobación manual en producción).

## Dependencias

- Consultar pub.dev antes de añadir un paquete nuevo.
- Preferir paquetes mantenidos por google/flutter/dart-lang, o con
  popularidad/likes altos y último release < 6 meses.
- **Ver `version-policy.md`** para la política detallada de versiones.

## Firma y distribución

- **Android**: Play App Signing (Google gestiona la clave de firma). Upload
  key local en `android/key.properties` (no versionada).
- **iOS**: Automatic Signing con Apple ID del equipo, certificados Dist
  generados por Xcode o `fastlane match`.
- **Distribución interna**: Firebase App Distribution para QA previa a
  release.

## Dominio

- Dominio propio (Firebase Hosting, Vercel, Cloudflare Pages o equivalente).
- Sirve `app-ads.txt` y, si aplica, deep links universales (`assetlinks.json`,
  `apple-app-site-association`).

## Seguridad

- Secretos en Secret Manager (Cloud Functions) o GitHub Secrets (CI). Nunca
  en código ni en `.env` versionados.
- Reglas Firestore/Storage validadas con emuladores antes de desplegar.
