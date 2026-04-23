# Gestión de contexto

Cómo los agentes mantienen coherencia entre intervenciones y sesiones sin
saturar la ventana de contexto.

## Fuentes de verdad

| Archivo | Responsable | Qué guarda |
|---|---|---|
| `CLAUDE.md` | Humano/orquestador | System prompt maestro, no cambia por feature. |
| `PLAN.md` | Leads (cada uno en su sección) | Arquitectura, esquemas, decisiones, pendientes. |
| `STATE.md` | Cualquier skill | Una línea con la fase actual. |
| `docs/adr/` | software-architect / leads | Decisiones estructurales (una por archivo). |
| `production/session-state/active.md` | Orquestador | Estado vivo entre sesiones: tarea abierta, bloqueos, último agente que intervino. |

## Protocolo al entrar en una skill

1. **Leer** `STATE.md` (una línea).
2. **Leer** la sección relevante de `PLAN.md` (no el archivo entero si no
   hace falta).
3. Si el hook `session-start.sh` ha cargado
   `production/session-state/active.md`, respetarlo.
4. Declarar la intención al usuario en una línea antes de actuar.

## Protocolo al salir de una skill

1. **Actualizar** `STATE.md` → nueva fase o `Esperando <siguiente skill>`.
2. **Escribir** en la sección propia de `PLAN.md`: decisión tomada,
   pendientes, handoff explícito (`@<lead>` si otro lead debe intervenir).
3. Si la intervención deja trabajo a medias, **persistir** resumen en
   `production/session-state/active.md`.

## Cuándo comprimir

- `PLAN.md` > 300 líneas por sección → comprimir mediante resumen y mover
  el histórico a `production/session-state/archive-<fecha>.md`.
- Conversaciones > 80% de ventana → escribir estado a
  `production/session-state/active.md` y avisar al usuario antes de que
  el sistema comprima automáticamente.

## Qué NO poner en `PLAN.md`

- Logs crudos, stack traces largos (resumen sí, detalle a runbook).
- Diffs de código (va en commits/PRs).
- Datos sensibles (tokens, cuentas, URLs privadas).

## Relación con memoria persistente

- Información del **usuario** (perfil, preferencias, feedback) → memoria
  nativa de Claude Code (`memory/`).
- Información del **proyecto actual** → `PLAN.md` + `STATE.md`.
- Información **entre sesiones del mismo proyecto** →
  `production/session-state/active.md`.

## Handoffs entre agentes

El agente saliente escribe en su sección de `PLAN.md`:

```
### Handoff → @<lead-destino> (<fecha>)
- Contexto: ...
- Decisión ya tomada: ...
- Pendiente de ti: ...
- Bloqueos: ...
```

El agente entrante lee su sección y esa entrada de handoff antes de
actuar.
