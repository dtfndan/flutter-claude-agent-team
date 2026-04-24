# Flutter Claude Agent Team

Convierte una sesión de Claude Code en una **agencia de producto Flutter + Firebase**:
onboarding, UX/UI, arquitectura, backend, desarrollo, QA, auditoría, deploy,
dominios, AdMob, `app-ads.txt` y ASO — coordinados por más de 20 agentes y 30
slash commands.

Inspirado en [Claude Code Game Studios](https://github.com/Donchitos/Claude-Code-Game-Studios),
adaptado a un pipeline móvil con Firebase y monetización.

---

## ¿Por qué existe?

Hacer una app Flutter + Firebase en solitario con IA es potente, pero una
conversación plana no tiene estructura. Nadie te detiene cuando hardcodeas
claves, saltas el diseño UX, olvidas tests, dejas reglas de Firestore
permisivas, o publicas sin validar `app-ads.txt`.

Este template le da a tu sesión de Claude Code la forma de un equipo real:
directores que cuidan la visión, leads por dominio, y especialistas que hacen
el trabajo fino. Cada agente tiene responsabilidades, rutas de escalado y
"puertas" de calidad.

Sigues decidiendo tú todo. La diferencia es que ahora tienes un equipo que
hace las preguntas correctas y mantiene el proyecto ordenado desde la idea
hasta la tienda.

---

## Qué incluye

| Categoría | Cuenta | Descripción |
|-----------|--------|-------------|
| **Agentes** | 25+ | Directores, leads y especialistas en UX, arquitectura, Firebase, Flutter, QA, DevOps, growth |
| **Skills** | 30+ | Slash commands (`/start`, `/design`, `/backend`, `/code`, `/qa`, `/deploy`, `/growth`, `/help`, ...) |
| **Hooks** | 11 | Validaciones automáticas de commits, pushes, deps, assets; notificaciones; recuperación de contexto |
| **Rules** | 10 | Estándares de código path-scoped (domain/data/presentation, firestore.rules, functions, tests, CI) |
| **Templates** | 7 | Plantillas de feature-spec, ADR, esquema Firestore, sprint-plan, bug-report, ficha ASO, flujo UX |

---

## Jerarquía del equipo

```
Tier 1 — Directores
  orquestador    software-architect    release-manager

Tier 2 — Leads
  ux-lead        firebase-lead         flutter-dev-lead
  qa-lead        devops-lead           aso-lead

Tier 3 — Especialistas
  ui-designer            accessibility-specialist    state-management-specialist
  firestore-specialist   auth-specialist             functions-specialist
  storage-specialist     security-rules-specialist   feature-developer
  platform-specialist    test-specialist             bug-hunter
  ci-cd-specialist       signing-specialist          dns-specialist
  code-auditor           security-auditor            dependency-auditor
  admob-specialist       app-ads-specialist          video-marketing-specialist
  onboarding-specialist
```

---

## Requisitos previos

- [Git](https://git-scm.com/)
- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) (`npm install -g @anthropic-ai/claude-code`)
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (stable más reciente)
- [Node.js](https://nodejs.org/) LTS (para Cloud Functions)
- [Firebase CLI](https://firebase.google.com/docs/cli) (`npm i -g firebase-tools`)
- **Recomendado**: `jq` (validación de JSON en hooks), Android Studio y/o Xcode

Los hooks fallan silenciosamente si faltan herramientas opcionales — nada se rompe.

---

## Puesta en marcha

1. **Clonar como plantilla**:
   ```bash
   git clone https://github.com/dtfndan/flutter-claude-agent-team.git mi-app
   cd mi-app
   ```

2. **Abrir Claude Code**:
   ```bash
   claude
   ```

3. **Ejecutar `/start`** — el sistema detecta tu estado (sin idea / idea vaga /
   concepto claro / trabajo existente) y te guía al flujo correcto sin
   asumir nada.

   O salta directo a lo que necesites:
   - `/setup-flutter` — verificar e instalar Flutter + Dart si faltan
   - `/design` — definir flujos, pantallas, tokens de diseño
   - `/backend` — esquema de Firestore y reglas
   - `/help` — "¿qué hago ahora?"

---

## Flujo recomendado

```
Onboarding ─► UX/UI ─► Arquitectura ─► Backend ─► Código ─► QA
                                                              │
Growth ◄── Deploy ◄── Auditoría ◄──────────────────────────── ┘
```

En detalle:

| Fase            | Skills clave                                                        |
|-----------------|---------------------------------------------------------------------|
| Onboarding      | `/start` · `/setup-flutter` · `/help`                               |
| UX/UI           | `/design` · `/design-system` · `/ux-review`                         |
| Arquitectura    | `/arch` · `/architecture-decision` · `/pick-state-management` · `/deps-update` |
| Backend         | `/backend` · `/firestore-schema` · `/firestore-rules` · `/auth-setup` · `/functions-scaffold` |
| Código          | `/code` · `/feature-scaffold` · `/code-review`                      |
| QA              | `/qa` · `/widget-test` · `/integration-test`                        |
| Auditoría       | `/audit` · `/deps-audit` · `/security-audit`                        |
| Deploy          | `/deploy` · `/build-android` · `/build-ios` · `/ci-setup` · `/dns-setup` · `/release-checklist` |
| Growth          | `/growth` · `/aso` · `/admob` · `/app-ads-verify` · `/promo-video`  |

---

## Estructura del proyecto

```
CLAUDE.md                # Configuración maestra (referencia .claude/docs/)
PLAN.md                  # Documento vivo: UX, arquitectura, backend, QA, ...
STATE.md                 # Fase actual del proyecto
README.md                # Este archivo

.claude/
  settings.json          # Permisos + wiring de hooks
  statusline.sh          # Status line (fase, flutter, branch, sprint)
  agents/*.md            # Definiciones de agentes
  skills/<skill>/SKILL.md   # Cada slash command
  hooks/*.sh             # Scripts de eventos (SessionStart, PreToolUse, ...)
  rules/*.md             # Estándares path-scoped (lib/**, functions/**, ...)
  docs/
    workflow-catalog.yaml   # Fases y pasos para /help
    templates/              # Plantillas de feature-spec, ADR, sprint, bug, ...
    *.md                    # Docs compartidas referenciadas por CLAUDE.md

lib/                     # Código Flutter (feature-first)
  features/<feature>/
    data/  domain/  presentation/
android/  ios/  web/     # Configs por plataforma
functions/               # Cloud Functions (TypeScript)
test/                    # Unit + widget tests
integration_test/        # Tests E2E
docs/                    # ADRs, diseños, documentación técnica
production/              # sprints/ · milestones/ · session-state/
```

---

## Cómo funciona

### Coordinación entre agentes

1. **Delegación vertical** — directores → leads → especialistas
2. **Consulta horizontal** — agentes del mismo tier pueden consultarse, pero
   no deciden fuera de su dominio
3. **Escalado de conflictos** — suben al padre común (`orquestador` para
   conflictos cross-dominio, `software-architect` para técnicos)
4. **Propagación de cambios** — el `orquestador` coordina cambios
   multi-departamento
5. **Fronteras de dominio** — los agentes no tocan archivos fuera de su
   dominio sin delegación explícita

### Colaborativo, no autónomo

Cada agente sigue el protocolo:

1. **Pregunta** — antes de proponer, pide contexto
2. **Opciones** — 2-4 alternativas con pros/contras
3. **Decides tú** — siempre
4. **Borrador** — enseña el cambio antes de escribir
5. **Aprobación** — nada se commitea sin OK

### Seguridad automática

| Hook                         | Disparo                | Qué hace |
|------------------------------|------------------------|----------|
| `session-start.sh`           | Inicio de sesión       | Lee `STATE.md`, muestra branch, sprint, TODOs |
| `detect-gaps.sh`             | Inicio de sesión       | Detecta proyectos nuevos y sugiere `/start` |
| `validate-commit.sh`         | PreToolUse (Bash)      | Bloquea commits con secrets o claves hardcoded |
| `validate-push.sh`           | PreToolUse (Bash)      | Avisa al hacer push a `main` / `master` |
| `validate-flutter-deps.sh`   | PostToolUse            | Advierte si se hardcodean versiones en `pubspec.yaml` |
| `notify.sh`                  | Notification           | Toast en Windows / notify en Linux/macOS |
| `pre-compact.sh`             | Antes de compactar     | Guarda estado en `active.md` |
| `post-compact.sh`            | Después de compactar   | Recuerda a Claude restaurar contexto |
| `session-stop.sh`            | Cierre de sesión       | Archiva estado activo y log de agentes |
| `log-agent.sh`               | Subagent spawned       | Audit trail |
| `log-agent-stop.sh`          | Subagent stops         | Cierra audit trail |

### Permisos

`settings.json` auto-aprueba operaciones seguras (`flutter test`, `git status`,
`firebase emulators:start`) y bloquea las peligrosas (`rm -rf`, force push,
leer `.env`, leer `google-services.json`, deploys a producción).

### Reglas path-scoped

| Path                                       | Hace cumplir |
|--------------------------------------------|--------------|
| `lib/features/**/presentation/**`          | Sin estado de negocio, i18n, a11y |
| `lib/features/**/domain/**`                | Puro Dart, sin Flutter, sin I/O |
| `lib/features/**/data/**`                  | Parseo y I/O, sin reglas de negocio |
| `lib/core/**`                              | Sin deps de features, API estable |
| `**/firestore.rules` · `**/storage.rules`  | Principio de mínimo privilegio |
| `functions/**`                             | TypeScript estricto, validación zod, secretos en Secret Manager |
| `test/**` · `integration_test/**`          | Naming, setUp/tearDown, sin magic numbers |
| `android/**`                               | Gradle, firma, permisos mínimos |
| `ios/**`                                   | Info.plist, entitlements, ATS |
| `.github/workflows/**`                     | Secrets, matrices, jobs mínimos |

---

## Soporte multiplataforma

- **Android** — build AAB/APK, firma, ProGuard, `google-services.json` seguro
- **iOS** — IPA, certificados, `GoogleService-Info.plist`, capabilities
- **Web** (opcional) — build, hosting, `app-ads.txt` servido en el dominio

---

## Personalización

Es un **template**, no un framework cerrado:

- Añade/quita agentes (`lib/features/<tu-dominio>/` → crea un `<dominio>-specialist.md`)
- Edita los prompts de los agentes
- Crea comandos nuevos copiando un archivo `.claude/commands/<ejemplo>.md`
- Añade rules path-scoped a tu estructura
- Ajusta los hooks de validación
- Cambia la intensidad de review: edita `production/review-mode.txt`
  (`full`, `lean`, `solo`)

---

## Plataforma

Probado en **Windows 11** con Git Bash. Los hooks usan patrones POSIX y
funcionan también en macOS y Linux. En Windows sin Git Bash, ejecuta
`claude` dentro de WSL.

---

## Licencia

MIT. Haz fork, modifica y publica tu propia variante.
