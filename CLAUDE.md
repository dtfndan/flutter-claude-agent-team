# Flutter + Firebase Agency — Sistema Maestro de Agentes

Convierte una sesión de Claude Code en una **agencia de producto** completa para
proyectos Flutter + Firebase: del onboarding al lanzamiento, pasando por UX,
arquitectura, backend, implementación, QA, auditoría, deploy, DNS, AdMob,
`app-ads.txt` y ASO.

> Inspirado en la arquitectura de "Claude Code Game Studios", adaptada a un
> pipeline móvil Flutter con monetización y publicación.

## Stack de referencia

- **SDK**: Flutter (stable más reciente) + Dart
- **Estado**: [ELEGIR: Riverpod / Bloc] — ver `docs/architecture/adr-*.md`
- **Backend**: Firebase (Auth, Firestore, Storage, Functions, App Check)
- **Monetización**: Google AdMob + `app-ads.txt` en dominio raíz
- **CI/CD**: [ELEGIR: GitHub Actions / Codemagic]
- **Lenguaje de servidor**: Cloud Functions en TypeScript/Node.js (LTS)

## Estructura del proyecto

@.claude/docs/directory-structure.md

## Preferencias técnicas

@.claude/docs/technical-preferences.md

## Reglas de coordinación entre agentes

@.claude/docs/coordination-rules.md

## Directriz Crítica: Versiones y actualizaciones

@.claude/docs/version-policy.md

## Estándares de código

@.claude/docs/coding-standards.md

## Gestión de contexto

@.claude/docs/context-management.md

## Archivos de estado vivos

- **`PLAN.md`** — documento donde los agentes registran arquitectura, esquemas,
  decisiones y pendientes (secciones fijas: UX/UI, Arquitectura, Backend, QA,
  Auditoría, Deploy, Growth).
- **`STATE.md`** — fase actual del proyecto. Se actualiza al iniciar/terminar
  cada skill.
- **`production/session-state/active.md`** — estado vivo entre sesiones
  (recuperado por el hook `session-start.sh`).

Antes de responder a cualquier comando, **lee `PLAN.md` y `STATE.md`** para
tener contexto. Al finalizar, **persiste los cambios** en dichos archivos.

## Protocolo de Colaboración

**Colaboración dirigida por el usuario, no ejecución autónoma.**
Cada tarea sigue: **Pregunta → Opciones → Decisión → Borrador → Aprobación**

- Los agentes DEBEN preguntar "¿Escribo esto en `[ruta]`?" antes de usar Write/Edit
- Los agentes DEBEN mostrar borradores o resúmenes antes de pedir aprobación
- Cambios multi-archivo requieren aprobación explícita del conjunto
- Ningún commit sin instrucción del usuario

> **¿Primera sesión?** Si no hay Flutter configurado o `PLAN.md` está vacío,
> ejecuta `/start` para un onboarding guiado.

## Slash commands principales

Escribe `/` en Claude Code para ver todas las skills instaladas. Flujo recomendado:

1. `/start` — onboarding y detección de entorno
2. `/setup-flutter` — verificar/actualizar SDK Flutter + Dart
3. `/design` → `/design-system` → `/ux-review` — UX/UI
4. `/arch` → `/architecture-decision` → `/pick-state-management` — arquitectura
5. `/backend` → `/firestore-schema` → `/firestore-rules` → `/auth-setup` → `/functions-scaffold` — Firebase
6. `/code` → `/feature-scaffold` → `/code-review` — implementación
7. `/qa` → `/widget-test` → `/integration-test` — testing
8. `/audit` → `/deps-audit` → `/security-audit` — auditoría
9. `/deploy` → `/build-android` → `/build-ios` → `/ci-setup` → `/dns-setup` → `/release-checklist` — release
10. `/growth` → `/aso` → `/admob` → `/app-ads-verify` → `/promo-video` — growth

`/help` te dice en qué paso estás y qué hacer a continuación.

## Personalización

Este es un **template modificable**:

- Añade/elimina agentes en `.claude/agents/`
- Ajusta los prompts de los agentes
- Modifica o añade skills en `.claude/skills/`
- Añade reglas path-scoped en `.claude/rules/`
- Ajusta hooks en `.claude/hooks/`
- Edita permisos en `.claude/settings.json`

El usuario puede invocar cualquier comando en cualquier orden; el Orquestador
mantiene la coherencia y actualiza `STATE.md` + `PLAN.md`.
