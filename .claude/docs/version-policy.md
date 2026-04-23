# Directriz Crítica: Versiones y actualizaciones

> **Regla Inquebrantable.** Todos los agentes están obligados a trabajar
> SIEMPRE con las versiones estables más recientes. No se hardcodean
> versiones antiguas, no se fijan rangos obsoletos, no se ignoran avisos
> de `flutter pub outdated`.

## Verificaciones obligatorias

Se ejecutan al entrar en `/start`, `/arch`, `/audit` y antes de cualquier
build de release.

### Flutter y Dart

```bash
flutter --version           # Canal stable, última versión
dart --version
flutter upgrade             # Si hay versión nueva disponible
flutter doctor -v           # Entorno saludable
```

### Firebase

```bash
firebase --version          # firebase-tools última
npm view firebase-tools version

# Paquetes Flutter de Firebase (ver última versión en pub.dev)
flutter pub outdated | grep firebase_
```

### Node.js (para Cloud Functions)

```bash
node --version              # LTS actual (>= 20)
npm --version
```

### Dependencias del proyecto

```bash
flutter pub outdated        # Reporte completo
flutter pub upgrade         # Aplicar upgrade respetando constraints
flutter pub upgrade --major-versions   # Bump de major (requiere revisión)
```

Para Cloud Functions:

```bash
cd functions && npm outdated
cd functions && npm update
```

## Reglas al añadir dependencias

1. **Antes de escribir un paquete en `pubspec.yaml`**: consultar
   [pub.dev](https://pub.dev) (o vía `flutter pub deps`, `pub.dev` API) y
   usar la **última versión estable publicada**.
2. **Prohibido** copiar versiones de tutoriales antiguos o de proyectos
   anteriores sin verificar.
3. **Rangos recomendados**: `^X.Y.Z` con `X.Y.Z` = última estable, salvo
   que el paquete rompa con cada minor (documentar en el ADR).
4. **Paquetes de Firebase**: `firebase_core`, `firebase_auth`,
   `cloud_firestore`, `firebase_storage`, `cloud_functions`,
   `firebase_app_check` deben ir todos en sus últimas versiones
   compatibles entre sí (la matriz la publica FlutterFire).
5. **Paquetes de AdMob**: `google_mobile_ads` en su última versión.

## Política de actualización

- **Patch/minor** (`x.y.Z` / `x.Y.z`): actualizar libre en cualquier
  sesión del agente `qa` o `audit`, siempre corriendo tests después.
- **Major** (`X.y.z`): requiere ADR corto en `docs/adr/` con:
  - Motivo del bump.
  - Breaking changes relevantes.
  - Plan de migración.
  - Resultado de `flutter analyze` + tests.
- **SDK de Flutter**: se actualiza entre sprints, no a mitad de feature
  a menos que haya un bug crítico resuelto en la nueva versión.

## Señales de bloqueo

- `flutter analyze` con errores nuevos tras un upgrade → revertir y abrir
  investigación.
- Tests rojos en CI tras bump → revertir antes de mergear.
- Paquete abandonado (último release > 12 meses, issues sin respuesta,
  incompatible con última Flutter): proponer reemplazo en ADR.

## Comandos de diagnóstico de referencia

```bash
# Estado general
flutter doctor -v
flutter --version
dart --version

# Paquetes del proyecto
flutter pub get
flutter pub outdated
flutter pub deps --style=tree

# Firebase
firebase --version
firebase projects:list

# Functions
cd functions && npm outdated && cd ..
```

El agente que detecte violación de esta política **debe** detenerse,
informar al usuario y proponer plan de remediación antes de continuar.
