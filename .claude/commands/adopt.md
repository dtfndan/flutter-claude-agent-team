---
name: adopt
description: "Toma el control de un proyecto Flutter existente. Escanea estructura, dependencias, arquitectura, Firebase, tests y CI/CD. Puebla PLAN.md con el estado real y propone un plan de remediación priorizado."
argument-hint: "[ruta del proyecto — omitir si ya estás en la raíz]"
---

# /adopt — Adoptar proyecto Flutter existente

Eres el **orquestador** asistido por `software-architect` y `auditor`. Tu trabajo es entender el proyecto tal como está hoy y dejar la agencia lista para trabajar sobre él.

**Protocolo: escanea primero, escribe después.** No modifiques ningún archivo del proyecto durante el escaneo. Solo escribe en `PLAN.md` y `STATE.md` al final, con aprobación.

---

## Fase 1 — Verificar que hay un proyecto Flutter

```bash
ls pubspec.yaml 2>/dev/null && echo "FOUND" || echo "NOT_FOUND"
```

Si no hay `pubspec.yaml`, detente y pide al usuario que navegue a la raíz del proyecto o use `/start` para uno nuevo.

---

## Fase 2 — Escaneo en capas (ejecutar en paralelo donde sea posible)

### 2a. Identidad del proyecto

```bash
# Nombre, descripción, versión
grep -E "^name:|^description:|^version:|^environment:" pubspec.yaml | head -10

# SDK constraint
grep -A2 "environment:" pubspec.yaml
```

### 2b. Dependencias

```bash
# Todas las dependencias directas
cat pubspec.yaml

# Desactualizadas (solo si flutter pub get ya corrió)
flutter pub outdated 2>/dev/null | head -40
```

Detectar y registrar:
- ¿Qué gestor de estado usa? Buscar: `riverpod`, `flutter_bloc`, `provider`, `get`, `mobx`, `signals`
- ¿Tiene Firebase? Buscar: `firebase_core`, `cloud_firestore`, `firebase_auth`
- ¿Tiene Flame? Buscar: `flame`
- ¿Tiene AdMob? Buscar: `google_mobile_ads`
- Paquetes con versiones pinadas exactas (sin `^`) — violación de version-policy

### 2c. Estructura de código

```bash
# Árbol de lib/ (2 niveles)
find lib -maxdepth 3 -type d | sort

# Conteo de archivos Dart por carpeta
find lib -name "*.dart" | sed 's|/[^/]*$||' | sort | uniq -c | sort -rn | head -20

# Detectar patrones de arquitectura
# Feature-First: lib/features/
find lib -maxdepth 2 -name "features" -type d

# Capas Clean: domain/ data/ presentation/
find lib -type d \( -name "domain" -o -name "data" -o -name "presentation" \) | head -20

# Patrones no-canónicos (screens, models globales, services sueltos)
find lib -maxdepth 2 -type d \( -name "screens" -o -name "pages" -o -name "models" -o -name "services" -o -name "controllers" \) | head -20
```

### 2d. Tests

```bash
# Conteo de tests
find test -name "*_test.dart" 2>/dev/null | wc -l
find integration_test -name "*_test.dart" 2>/dev/null | wc -l

# Tests vacíos o con solo placeholders
grep -rl "// TODO\|test('TODO\|expect(true, true)" test/ 2>/dev/null | wc -l

# Cobertura de features (¿cuántas features tienen test mirror?)
find lib/features -maxdepth 1 -type d 2>/dev/null | while read f; do
  feature=$(basename "$f")
  count=$(find test -path "*$feature*" -name "*_test.dart" 2>/dev/null | wc -l)
  echo "$feature: $count tests"
done
```

### 2e. Firebase

```bash
ls firebase.json firestore.rules storage.rules firestore.indexes.json 2>/dev/null
cat firebase.json 2>/dev/null
# Detectar proyecto Firebase activo
firebase use 2>/dev/null | head -3
```

Detectar:
- ¿Está configurado App Check?
- ¿Están las reglas de Firestore/Storage versionadas?
- ¿Hay `google-services.json` / `GoogleService-Info.plist`?

### 2f. CI/CD

```bash
# GitHub Actions
find .github/workflows -name "*.yml" -o -name "*.yaml" 2>/dev/null | head -10

# Codemagic
ls codemagic.yaml 2>/dev/null

# Jobs detectados en workflows
grep -h "name:" .github/workflows/*.yml 2>/dev/null | head -20
```

### 2g. Firma y plataformas

```bash
# Android
ls android/key.properties 2>/dev/null && echo "key.properties: FOUND (no leer contenido)" || echo "key.properties: MISSING"
grep -E "minSdkVersion|targetSdkVersion|compileSdkVersion|applicationId|versionCode|versionName" \
  android/app/build.gradle android/app/build.gradle.kts 2>/dev/null

# iOS
grep -E "PRODUCT_BUNDLE_IDENTIFIER|MARKETING_VERSION|CURRENT_PROJECT_VERSION|IPHONEOS_DEPLOYMENT_TARGET" \
  ios/Runner.xcodeproj/project.pbxproj 2>/dev/null | sort -u | head -10

# Plataformas activas
ls android/ ios/ web/ macos/ linux/ windows/ 2>/dev/null | grep -v "^$"
```

### 2h. Calidad de código

```bash
# analyze (sin instalar nada — ya está en el PATH)
flutter analyze --no-pub 2>&1 | tail -5

# TODOs y FIXMEs
grep -rE "TODO|FIXME" lib/ 2>/dev/null | wc -l

# dynamic sin justificación
grep -rn "\bdynamic\b" lib/ 2>/dev/null | grep -v "_test.dart" | grep -v "// justif" | wc -l

# Strings hardcoded en widgets (señal de falta de l10n)
grep -rn '"[A-Z][a-z]' lib/ 2>/dev/null | grep -v "_test.dart" | wc -l
```

### 2i. Juego (Flame) — solo si se detectó `flame` en dependencias

```bash
find lib -type d \( -name "game" -o -name "components" -o -name "scenes" \) 2>/dev/null
find lib -name "*_game.dart" -o -name "*_component.dart" 2>/dev/null | head -20
```

---

## Fase 3 — Construir el diagnóstico

Con toda la información recopilada, elabora un informe en este formato. Sé específico con números y rutas reales — no genérico.

```
╔══════════════════════════════════════════════════╗
║           DIAGNÓSTICO DEL PROYECTO               ║
╚══════════════════════════════════════════════════╝

Proyecto:    <nombre> v<versión>
Flutter SDK: <constraint del pubspec> (instalado: <versión actual>)
Plataformas: <android / ios / web / ...>

━━━ ARQUITECTURA ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Patrón detectado: Feature-First ✓ / Monolítico / Híbrido / Sin patrón claro
Capas Clean: domain ✓/✗  data ✓/✗  presentation ✓/✗
Features identificadas: <lista>
Gestor de estado: <paquete>
Problemas: <archivos fuera de lugar, global models, etc.>

━━━ DEPENDENCIAS ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Total: <n> directas, <m> desactualizadas
Firebase: <lista de paquetes y versiones>
AdMob: <versión o "no detectado">
Flame: <versión o "no detectado">
Versiones pinadas sin ^: <lista o "ninguna">
Paquetes a revisar: <outliers — abandonados, incompatibles>

━━━ FIREBASE ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Proyecto configurado: ✓/✗
firebase.json: ✓/✗
Reglas versionadas: firestore.rules ✓/✗  storage.rules ✓/✗
App Check: ✓/✗
Emuladores declarados: ✓/✗

━━━ TESTS ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Unit/widget tests: <n>
Integration tests: <n>
Features sin test: <lista>
Cobertura estimada: baja (<5 tests) / media / buena

━━━ CI/CD ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Plataforma: GitHub Actions / Codemagic / Ninguno
Jobs: <lista de nombres>
Build automatizado: ✓/✗
Deploy automatizado: ✓/✗

━━━ FIRMA ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Android: key.properties ✓/✗
iOS: signing configurado ✓/✗ (Automatic / Manual)

━━━ CALIDAD ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
flutter analyze: <n errores> / <m warnings>
TODOs/FIXMEs: <n>
`dynamic` sin justificar: <n>
Strings hardcoded en UI: ~<n>

━━━ JUEGO (FLAME) ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[incluir solo si Flame detectado]
FlameGame: ✓/✗  Worlds: <n>  Componentes: <n>

━━━ PLAN DE REMEDIACIÓN (PRIORIZADO) ━━━━━━━━━━━━

CRÍTICO (bloquea release):
  1. <acción concreta> → comando sugerido
  ...

IMPORTANTE (deuda técnica alta):
  1. <acción concreta> → comando sugerido
  ...

MEJORA (buenas prácticas):
  1. <acción concreta> → comando sugerido
  ...

YA BIEN HECHO:
  - <lista de lo que sí está correcto>
```

---

## Fase 4 — Actualizar archivos de estado (con aprobación)

Pregunta al usuario: **"¿Escribo este diagnóstico en `PLAN.md` y actualizo `STATE.md`?"**

Si aprueba:

### Escribir en PLAN.md

Rellena cada sección con los datos reales encontrados. Usa los marcadores `_Vacío.` solo donde no haya información. Donde haya código real, describe lo que encontraste.

- `## Arquitectura` → patrón detectado, features, gestor de estado, deuda.
- `## Backend` → configuración Firebase actual.
- `## Implementación` → features identificadas y su estado.
- `## QA` → cobertura actual, tests faltantes.
- `## Auditoría` → findings de analyze + deps desactualizadas.
- `## Deploy` → CI/CD y firma actuales.
- `## Juego` → si Flame detectado.
- `## Decisiones pendientes` → abre ítems para cada punto CRÍTICO del plan.

### Escribir STATE.md

Determina la fase correcta según la madurez:

| Condición | STATE.md |
|-----------|----------|
| Solo `pubspec.yaml`, sin `lib/` real | `Fase actual: Proyecto vacío adoptado; ejecuta /setup-flutter` |
| Tiene código pero sin arquitectura clara | `Fase actual: Proyecto adoptado; refactorización de arquitectura pendiente — /arch` |
| Arquitectura presente, sin tests | `Fase actual: Proyecto adoptado; cobertura de tests crítica — /qa` |
| Arquitectura + tests, sin CI | `Fase actual: Proyecto adoptado; CI/CD pendiente — /ci-setup` |
| Todo razonablemente completo | `Fase actual: Proyecto adoptado; auditoría pre-release — /audit` |

---

## Reglas

- **Lee, no toques.** Durante el escaneo no modifiques ningún archivo del proyecto.
- No ejecutes `flutter pub get`, `flutter upgrade`, ni instales nada sin pedirlo explícitamente.
- Si `flutter analyze` tarda más de 30 segundos, cancela con `Ctrl+C` y reporta "no ejecutado" — el usuario puede ejecutarlo aparte.
- No reportes el contenido de `key.properties`, `.env`, `google-services.json`, ni `GoogleService-Info.plist`.
- Si el proyecto tiene más de 200 archivos Dart, usa `find` + `wc -l` para conteos; no leas cada archivo.
- Sé específico con los paths reales encontrados — no inventes ni uses ejemplos genéricos.
