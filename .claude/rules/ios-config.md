---
paths:
  - "ios/**"
---

# iOS Config Rules

- `ios/Runner/Info.plist`: bundle ID coherente con App Store Connect.
- Cada `NS*UsageDescription` existe y tiene un texto claro en el idioma principal.
- ATS (`NSAppTransportSecurity`): sin excepciones, o documentadas en `PLAN.md > Deploy`.
- `GoogleService-Info.plist` está en `.gitignore` y se añade al target desde Xcode tras clonar.
- Capabilities requeridas (Push, Sign in with Apple, In-App Purchase) documentadas.
- AdMob: `GADApplicationIdentifier` en Info.plist coincide con el del panel.
- `CFBundleShortVersionString` y `CFBundleVersion` sincronizados con `pubspec.yaml`.

## Prohibiciones

- ❌ `NSAllowsArbitraryLoads = YES` en release sin justificación en ADR.
- ❌ Certificados o perfiles de provisioning committed.
- ❌ `UIFileSharingEnabled` en apps que no son expresamente de compartir archivos.
