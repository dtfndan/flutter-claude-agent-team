---
name: pick-state-management
description: "Guía la elección del gestor de estado (Riverpod vs Bloc vs otro). Compara opciones con pros/contras y documenta la decisión como ADR."
---

# /pick-state-management — Elegir Gestor de Estado

Decide el gestor de estado del proyecto. Tu trabajo:

1. **Leer** `PLAN.md` sección `## Arquitectura`.
2. **Delegar** al agente `state-management-specialist`
   (ver `.claude/agents/state-management-specialist.md`).
3. **Preguntar** al usuario:
   - ¿Experiencia previa con algún gestor? (Riverpod, Bloc, Provider, GetX...).
   - ¿Complejidad del proyecto? (simple/medio/complejo).
   - ¿Equipo? (solo / 2-3 personas / equipo grande).
   - ¿Preferencia por generación de código (build_runner)?
4. **Comparar opciones principales**:

   | Criterio | Riverpod | Bloc |
   |---|---|---|
   | Curva de aprendizaje | Media | Media-Alta |
   | Boilerplate | Bajo (con codegen) | Medio (Events+States) |
   | Testabilidad | Excelente | Excelente |
   | Escalabilidad | Alta | Muy alta |
   | DevTools | Riverpod Inspector | Bloc Observer |
   | Comunidad | Creciente | Muy grande |

5. **Aplicar Directriz Crítica de Versiones**: consultar pub.dev para
   la última versión del paquete elegido.
6. **Documentar** como ADR (`docs/adr/adr-001-state-management.md`)
   invocando `/architecture-decision`.
7. **Al terminar**: Actualizar `PLAN.md` sección `## Arquitectura`.

## Protocolo

Presentar comparación objetiva. El usuario decide. No imponer.
