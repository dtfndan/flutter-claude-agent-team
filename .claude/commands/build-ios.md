---
name: build-ios
description: "Genera IPA para iOS. Configura certificados, provisioning profiles, entitlements y capacidades de Xcode."
---

# /build-ios — Build iOS

Genera artefacto iOS de producción. Tu trabajo:

1. **Leer** `PLAN.md` sección `## Deploy`.
2. **Delegar** al agente `signing-specialist` y `platform-specialist`.
3. **Verificar**:
   - macOS disponible (si no, informar limitaciones).
   - `ios/Runner.xcworkspace` abre correctamente.
   - `GoogleService-Info.plist` presente en `ios/Runner/`.
   - Bundle identifier configurado.
   - Certificados y provisioning profiles instalados.
   - `Info.plist` tiene permisos necesarios (cámara, fotos, etc.).
4. **Preguntar** al usuario:
   - ¿Build para TestFlight o App Store?
   - ¿Capabilities necesarias? (Push Notifications, Sign in with Apple, etc.)
   - ¿Tiene cuenta de Apple Developer activa?
5. **Ejecutar** (con aprobación):
   ```
   flutter build ios --release
   ```
   Luego guiar para archivar en Xcode y subir vía Transporter o
   `xcodebuild -exportArchive`.
6. **Post-build**:
   - Verificar que entitlements coincidan con App ID.
   - Recordar configurar App Store Connect (screenshots, descripción).
7. **Al terminar**: Registrar en `PLAN.md` sección `## Deploy`.

## Protocolo

No leer certificados ni provisioning profiles. Guiar al usuario paso
a paso si es su primera publicación iOS.
