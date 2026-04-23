---
name: integration-test
description: "Crea tests de integración (E2E) para flujos completos. Configura el driver, navega entre pantallas y valida flujos reales."
---

# /integration-test — Tests de Integración

Crea tests E2E. Tu trabajo:

1. **Leer** `PLAN.md` (secciones UX/UI para flujos y QA para cobertura).
2. **Delegar** al agente `test-specialist`.
3. **Verificar** setup:
   - `integration_test/` existe con `app_test.dart`.
   - Dependencia `integration_test` en `dev_dependencies`.
   - `flutter_test` presente.
4. **Preguntar** al usuario:
   - ¿Qué flujo testear? (login, onboarding, CRUD, compra...).
   - ¿Dispositivo/emulador disponible?
5. **Generar** tests en `integration_test/`:
   - Un archivo por flujo: `<flujo>_test.dart`.
   - Usar `IntegrationTestWidgetsFlutterBinding.ensureInitialized()`.
   - Navegar con `tester.tap()`, `tester.enterText()`, `tester.pumpAndSettle()`.
   - Verificar con `find.text()`, `find.byType()`, `find.byKey()`.
   - Incluir `setUp` para estado inicial limpio.
6. **Ejecutar**: `flutter test integration_test/<flujo>_test.dart`.
7. **Al terminar**:
   - Registrar en `PLAN.md` sección `## QA`.

## Protocolo

Tests de integración son lentos — confirmar con el usuario antes de
ejecutar. Mostrar borrador del test antes de escribirlo.
