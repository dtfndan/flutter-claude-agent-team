---
name: setup-flutter
description: "Verifica e instala/actualiza Flutter SDK, Dart, Firebase CLI y Node.js. Ejecuta flutter doctor y resuelve problemas de entorno."
---

# /setup-flutter — Setup de Entorno

Verifica y configura el entorno de desarrollo. Tu trabajo:

1. **Ejecutar diagnósticos**:
   - `flutter --version` → verificar si está instalado.
   - `dart --version` → verificar versión de Dart.
   - `flutter doctor -v` → diagnóstico completo.
   - `firebase --version` → Firebase CLI.
   - `node --version` → Node.js LTS.
   - `git --version` → Git.
2. **Aplicar Directriz Crítica de Versiones**:
   - Si Flutter no está en la última stable:
     `flutter upgrade` (con aprobación).
   - Si Firebase CLI desactualizado:
     `npm i -g firebase-tools` (con aprobación).
3. **Resolver problemas** de `flutter doctor`:
   - Android: licencias (`flutter doctor --android-licenses`),
     Android Studio, command-line tools.
   - iOS: Xcode, CocoaPods, simuladores.
   - Chrome: verificar para web development.
4. **Verificar** configuración de proyecto (si existe `pubspec.yaml`):
   - `flutter pub get`
   - `flutter analyze`
   - `flutter test` (si hay tests)
5. **Reportar** estado final:
   - ✅ Herramientas OK / ❌ Pendientes.
   - Versiones de todo el stack.
6. **Al terminar**: Actualizar `STATE.md` con el entorno verificado.

## Protocolo

No instalar nada sin aprobación. Explicar qué hace cada comando
antes de ejecutarlo (especialmente si requiere privileges elevados).
