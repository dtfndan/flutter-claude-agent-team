---
name: architecture-decision
description: "Documenta una Architecture Decision Record (ADR). Registra el contexto, opciones evaluadas, decisión tomada y consecuencias."
---

# /architecture-decision — ADR

Crea o actualiza un Architecture Decision Record. Tu trabajo:

1. **Leer** `PLAN.md` sección `## Arquitectura` y ADRs existentes en
   `docs/adr/`.
2. **Delegar** al agente `software-architect`.
3. **Preguntar** al usuario:
   - ¿Qué decisión hay que documentar?
   - ¿Cuál es el contexto/problema?
   - ¿Qué opciones se han considerado?
4. **Generar** ADR usando la plantilla `.claude/docs/templates/adr.md`:
   ```
   # ADR-NNN: [Título]

   ## Estado
   [Propuesto | Aceptado | Deprecado | Sustituido por ADR-XXX]

   ## Contexto
   [Problema, restricciones, fuerzas en juego]

   ## Opciones Consideradas
   1. [Opción A] — pros / contras
   2. [Opción B] — pros / contras
   3. [Opción C] — pros / contras

   ## Decisión
   [Opción elegida y por qué]

   ## Consecuencias
   - Positivas: ...
   - Negativas: ...
   - Neutras: ...
   ```
5. **Escribir** en `docs/adr/adr-NNN-<título>.md` (auto-numerar).
6. **Al terminar**: Referenciar ADR en `PLAN.md` sección
   `## Arquitectura`.

## Protocolo

Mostrar borrador completo del ADR antes de escribir. El usuario decide
si aceptar, modificar o descartar.
