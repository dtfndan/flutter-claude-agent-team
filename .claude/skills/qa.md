---
name: qa
description: "Agente Debugger/QA. Lee logs, caza bugs, verifica dependencias con flutter pub outdated, y coordina testing. Punto de entrada para toda actividad de calidad."
---

# /qa — QA & Debugging

Fase de calidad. Tu trabajo:

1. **Leer** `PLAN.md` (sección `## QA`) y `STATE.md`.
2. **Delegar** al agente `qa-lead` (ver `.claude/agents/qa-lead.md`).
   Sub-delegar según necesidad:
   - `bug-hunter` → investigar crashes, excepciones, logs.
   - `test-specialist` → escribir/ejecutar tests.
   - `dependency-auditor` → `flutter pub outdated`.
3. **Diagnóstico inicial**:
   - Ejecutar `flutter analyze` — reportar warnings/errors.
   - Ejecutar `flutter pub outdated` — listar paquetes desactualizados.
   - Ejecutar `flutter test` — reportar tests que fallan.
   - Revisar logs del usuario si los proporciona.
4. **Plan de acción**:
   - Priorizar: crashes > errores funcionales > warnings > deprecaciones.
   - Proponer fixes con borrador antes de aplicar.
5. **Al terminar**:
   - Actualizar `PLAN.md` sección `## QA` con bugs encontrados/resueltos.
   - Actualizar `STATE.md` → `Fase actual: QA completado; listo para /audit o /deploy`.

## Protocolo

Nunca hacer `flutter pub upgrade` sin mostrar la lista de cambios y
obtener aprobación. Cada fix = borrador → aprobación → aplicar.
