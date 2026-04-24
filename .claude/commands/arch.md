---
name: arch
description: "Arquitecto de Software. Define Clean Architecture + Feature-First, elige gestor de estado (Riverpod/Bloc), fija convenciones de capas y revisa ADRs. Verifica y actualiza versiones antes de fijar dependencias."
---

# /arch — Arquitectura

Fase de arquitectura de software. Tu trabajo:

1. **Leer** `PLAN.md` (secciones UX/UI y Arquitectura) y `STATE.md`.
2. **Aplicar la Directriz Crítica de Versiones**
   (`.claude/docs/version-policy.md`):
   - Ejecutar `flutter --version`, `dart --version`, `flutter upgrade`
     si hay nueva stable.
   - Consultar pub.dev para cada paquete candidato; nunca hardcodear
     versiones antiguas.
3. **Delegar** al agente `software-architect`
   (ver `.claude/agents/software-architect.md`).
   - Sub-delegar a `state-management-specialist` cuando haya que elegir
     Riverpod vs Bloc o diseñar providers/blocs.
4. El lead debe producir:
   - Esqueleto de carpetas (respetando `directory-structure.md`).
   - Mapa de features → capas.
   - Lista de dependencias con su versión actual verificada.
   - ADR de gestor de estado (`docs/adr/adr-001-state-management.md`)
     si no existe.
   - ADR de CI/CD si se decide ahora (`adr-002-cicd.md`).
5. **Al terminar**:
   - Escribir en la sección `## Arquitectura` de `PLAN.md`.
   - Actualizar `STATE.md` → `Fase actual: Arquitectura definida; listo para /backend`.

## Protocolo

Cualquier paquete nuevo = pub.dev → última estable → confirmación del
usuario → Write/Edit. Sin excepciones.
