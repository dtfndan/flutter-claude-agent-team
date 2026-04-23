# Reglas de coordinación entre agentes

Cómo se pasan el testigo los 31 agentes para que el proyecto avance sin
conflictos.

## Jerarquía

- **Orquestador (`orquestador`)**: árbitro cross-dominio. Decide qué lead
  interviene, actualiza `PLAN.md` y `STATE.md`, resuelve conflictos.
- **Leads** (uno por dominio): responsables de su área, delegan detalle a
  especialistas.
  - `ux-lead` → `ui-designer`, `accessibility-specialist`
  - `software-architect` → `state-management-specialist`
  - `firebase-lead` → `firestore-specialist`, `auth-specialist`,
    `storage-specialist`, `functions-specialist`,
    `security-rules-specialist`
  - `flutter-dev-lead` → `feature-developer`, `platform-specialist`
  - `qa-lead` → `test-specialist`, `bug-hunter`
  - `auditor` → `code-auditor`, `security-auditor`, `dependency-auditor`
  - `devops-lead` → `ci-cd-specialist`, `signing-specialist`,
    `dns-specialist`, `release-manager`
  - `aso-lead` → `admob-specialist`, `app-ads-specialist`,
    `video-marketing-specialist`
- **Onboarding-specialist**: camino paralelo para entrada de usuarios nuevos.

## Handshake vía `PLAN.md`

`PLAN.md` tiene secciones fijas. Cada lead **solo** escribe en la suya:

```
## UX/UI              ← ux-lead
## Arquitectura       ← software-architect
## Backend            ← firebase-lead
## Implementación     ← flutter-dev-lead
## QA                 ← qa-lead
## Auditoría          ← auditor
## Deploy             ← devops-lead
## Growth             ← aso-lead
## Decisiones pendientes ← orquestador (árbitro)
```

- Cuando un lead necesita input de otro dominio, abre un ítem en
  **"Decisiones pendientes"** con `@lead-objetivo`.
- El orquestador revisa esa sección al inicio de cada intervención.

## Flujo canónico de un feature nuevo

1. **`ux-lead`** publica flujos/estados en `## UX/UI` y abre ítems para
   arquitectura si hay impacto de datos.
2. **`software-architect`** registra la estructura de capas y dependencias
   nuevas en `## Arquitectura`.
3. **`firebase-lead`** define esquema, reglas y functions necesarias en
   `## Backend`.
4. **`flutter-dev-lead`** implementa; delega features a `feature-developer`
   y plataforma nativa a `platform-specialist`.
5. **`qa-lead`** escribe tests y valida.
6. **`auditor`** revisa antes de cualquier release.
7. **`devops-lead`** prepara build/firma/release.
8. **`aso-lead`** actualiza ficha y monetización.

## Reglas duras

- **Ningún agente modifica la sección de otro lead** en `PLAN.md`. Escribe
  una petición en "Decisiones pendientes".
- **Ningún agente pinea versiones**; ver `version-policy.md`.
- **Antes de Write/Edit**: preguntar al usuario (protocolo de colaboración
  en `CLAUDE.md`).
- **ADR obligatorio** para: cambio de gestor de estado, nuevo paquete con
  ámbito transversal, cambio de CI, cambio de plataforma soportada.
- **`STATE.md`** se actualiza al iniciar y al terminar cada skill, en una
  sola línea.

## Resolución de conflictos

1. Si dos leads quieren actuar sobre el mismo área → el orquestador decide
   y registra el motivo en `## Decisiones pendientes`.
2. Si un especialista necesita romper una regla → abrir ADR; solo el
   orquestador o el software-architect aprueban.
3. Si hay bloqueo por falta de input del usuario → pausar y preguntar; no
   inventar.
