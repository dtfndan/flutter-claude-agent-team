---
paths:
  - "test/**"
  - "integration_test/**"
  - "functions/test/**"
---

# Testing Standards

- Nombres de archivo: `<subject>_test.dart` o `<subject>.test.ts`.
- Cada `test()`/`testWidgets()` describe un caso en presente: `"returns Failure when network is down"`.
- Usa `setUp`/`tearDown` para aislar estado. Nada de estado global compartido entre tests.
- Mocks con `mocktail` (Dart) o `jest.mock` (TS). Evita `mockito` en código nuevo.
- Fixtures en `test/fixtures/` o `integration_test/fixtures/`, no inlined.

## Pirámide

- **Unit (domain/, use cases, utils)**: la mayoría. Sin Flutter, sin Firebase.
- **Widget (presentation/)**: cubre los 4 estados (loading, empty, error, data).
- **Integration**: smoke tests de flujos críticos (login, onboarding, compra).
- **Firestore rules**: un test por rama `allow`.

## Prohibiciones

- ❌ `expect(actual, anything)` — no es un test.
- ❌ `await Future.delayed(Duration(seconds: 3))` para esperar que algo pase — usa `pump*` o `await untilCalled`.
- ❌ Credenciales reales en tests. Usa el emulador de Firebase.
