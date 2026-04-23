# Estándares de código

Lo que cualquier agente que escriba Dart/TS debe respetar.

## Dart / Flutter

- **Null-safety**: activada siempre. Nada de `!` salvo justificación en
  comentario + test que cubra el caso.
- **`dart format`** antes de entregar. CI falla si el diff no está limpio.
- **`flutter analyze`** sin warnings. Lints base: el paquete
  `flutter_lints` en su última versión.
- **Nombres**:
  - Clases y typedefs → `UpperCamelCase`.
  - Variables, funciones, parámetros → `lowerCamelCase`.
  - Archivos y carpetas → `snake_case`.
  - Enumerados → `UpperCamelCase` para el tipo, `lowerCamelCase` para
    los valores.
- **Imports**: ordenados (`dart:`, paquetes, relativos), separados por
  línea en blanco. Sin imports relativos saltando `lib/` (usar
  `package:<app>/...`).
- **Errores tipados**: no lanzar `Exception` genérico. Crear jerarquía por
  feature (`AuthFailure`, `PaymentFailure`, …) o usar `sealed class`
  Either/Result.
- **Async**: `Future`/`Stream` explícitos; evitar `async` sin `await`.
  `unawaited(...)` cuando sea intencional.
- **`const`** agresivo en widgets que no dependen de estado.
- **Inmutabilidad**: preferir `final` y clases inmutables
  (`freezed`/`equatable`).

## Capas (recordatorio)

- `domain/`: Dart puro. Sin Flutter, sin Firebase, sin dio. Entidades +
  use cases + interfaces de repositorio.
- `data/`: implementa las interfaces; aquí viven Firestore, Storage,
  HTTP, caches.
- `presentation/`: widgets + state (Riverpod/Bloc). No habla con
  `data/` directamente; siempre vía `domain/`.

## TypeScript (Cloud Functions)

- **`strict: true`** en `tsconfig.json`.
- ESLint con `@typescript-eslint` + reglas recomendadas.
- Un archivo por trigger; `index.ts` solo exporta.
- Validar input de callables con zod (o similar) antes de cualquier
  efecto de lado.
- Errores de cliente con `HttpsError` (codes `invalid-argument`,
  `permission-denied`, etc.), nunca strings sueltos.
- Secretos vía Secret Manager, accedidos con `defineSecret`.

## Tests

- Cobertura mínima:
  - `domain/`: 100% use cases, 100% entidades con lógica.
  - `data/`: happy path + errores típicos por repositorio.
  - `presentation/`: widget tests de las pantallas principales y sus
    estados (carga, error, vacío, éxito).
- **Nombres**: `should <comportamiento> when <condición>`.
- **Mocks**: `mocktail` (sin `mockito`/codegen salvo justificación).
- **Firebase en tests**: emuladores (`firebase emulators:start`) para
  reglas y functions; `fake_cloud_firestore` para unit tests livianos.

## Commits

- Estilo Conventional Commits: `feat:`, `fix:`, `chore:`, `refactor:`,
  `test:`, `docs:`, `build:`, `ci:`.
- Cuerpo en imperativo presente: "add", no "added".
- No se commitea nada sin pedirlo el usuario (ver protocolo de
  colaboración).

## Documentación en código

- Cada clase pública del `domain/` con `///` explicando intención.
- Archivos `README.md` por feature solo si hay algo no obvio
  (integración externa, decisión rara).
- ADRs en `docs/adr/`: numerados, formato corto
  (Contexto → Decisión → Consecuencias).
