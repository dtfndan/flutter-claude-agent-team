---
name: widget-test
description: "Crea widget tests para pantallas y componentes Flutter. Configura mocks, pumps widgets y verifica rendering, interacciones y estados."
---

# /widget-test — Widget Tests

Crea tests de widgets. Tu trabajo:

1. **Leer** `PLAN.md` y el código de la feature a testear.
2. **Delegar** al agente `test-specialist`
   (ver `.claude/agents/test-specialist.md`).
3. **Preguntar** al usuario:
   - ¿Qué widget/screen testear?
   - ¿Priorizar happy path, edge cases o ambos?
4. **Generar** tests siguiendo `.claude/rules/tests.md`:
   - Naming: `<widget>_test.dart` en `test/features/<feature>/`.
   - Estructura: `group()` por comportamiento, `testWidgets()` por caso.
   - Mock de dependencias (repositorios, providers).
   - `setUp()` y `tearDown()` limpios.
   - Sin magic numbers — usar constantes con nombre.
5. **Ejecutar**: `flutter test test/features/<feature>/` para validar.
6. **Reportar** cobertura si está habilitada
   (`flutter test --coverage`).
7. **Al terminar**:
   - Registrar tests creados en `PLAN.md` sección `## QA`.

## Protocolo

Mostrar el test completo como borrador antes de escribir el archivo.
No testear implementación interna — testear comportamiento visible.
