# Flutter Claude Agent Team

Convierte una sesión de Claude Code en una **agencia de producto Flutter + Firebase**:
onboarding, UX/UI, arquitectura, backend, desarrollo, juegos (Flame), QA, auditoría,
deploy, dominios, AdMob, `app-ads.txt` y ASO — coordinados por 36 agentes y 39 slash
commands.

Funciona tanto para **proyectos nuevos** (desde la idea) como para **proyectos en curso**
(adopta un repo existente, diagnostica su estado y traza el plan de remediación).

---

## ¿Por qué existe?

Hacer una app Flutter + Firebase en solitario con IA es potente, pero una conversación
plana no tiene estructura. Nadie te detiene cuando hardcodeas claves, saltas el diseño
UX, olvidas tests, dejas reglas de Firestore permisivas, o publicas sin validar
`app-ads.txt`.

Este template le da a tu sesión de Claude Code la forma de un equipo real: directores
que cuidan la visión, leads por dominio, y especialistas que hacen el trabajo fino. Cada
agente tiene responsabilidades, rutas de escalado y "puertas" de calidad.

Sigues decidiendo tú todo. La diferencia es que ahora tienes un equipo que hace las
preguntas correctas y mantiene el proyecto ordenado desde la idea hasta la tienda.

---

## Qué incluye

| Categoría      | Cuenta | Descripción |
| -------------- | ------ | ----------- |
| **Agentes**    | 36     | Directores, leads y especialistas en UX, arquitectura, Firebase, Flutter, Flame (juegos), QA, DevOps, growth |
| **Comandos**   | 39     | Slash commands (`/start`, `/adopt`, `/design`, `/backend`, `/code`, `/game`, `/qa`, `/deploy`, `/growth`, ...) |
| **Hooks**      | 12     | Validaciones automáticas de commits, pushes, deps; notificaciones; recuperación de contexto entre sesiones |
| **Rules**      | 11     | Estándares de código path-scoped (domain/data/presentation, firestore.rules, functions, tests, CI) |
| **Templates**  | 7      | ADR, feature-spec, esquema Firestore, sprint-plan, bug-report, ficha ASO, flujo UX |

---

## Jerarquía del equipo

```
Tier 1 — Directores
  orquestador    software-architect    release-manager

Tier 2 — Leads
  ux-lead           firebase-lead         flutter-dev-lead
  flame-lead*       qa-lead               devops-lead
  aso-lead

Tier 3 — Especialistas
  ui-designer              accessibility-specialist    state-management-specialist
  firestore-specialist     auth-specialist             functions-specialist
  storage-specialist       security-rules-specialist   feature-developer
  platform-specialist      test-specialist             bug-hunter
  ci-cd-specialist         signing-specialist          dns-specialist
  code-auditor             security-auditor            dependency-auditor
  admob-specialist         app-ads-specialist          video-marketing-specialist
  onboarding-specialist    flame-developer*            flame-physics-specialist*
  flame-audio-specialist*
```

`*` Se activan solo cuando el proyecto incluye un juego con Flame.

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

## Proyecto nuevo — puesta en marcha

1. **Clonar como plantilla**:

   ```bash
   git clone https://github.com/dtfndan/flutter-claude-agent-team.git mi-app
   cd mi-app
   ```

2. **Abrir Claude Code**:

   ```bash
   claude
   ```

3. **Ejecutar `/start`** — detecta tu entorno (Flutter, Firebase CLI, Node),
   pregunta tu experiencia y plataformas objetivo, y deja todo listo para el
   primer comando real.

   O salta directo a lo que necesites:

   ```
   /setup-flutter   verificar e instalar Flutter + Dart si faltan
   /design          definir flujos, pantallas, tokens de diseño
   /arch            elegir Clean Architecture + gestor de estado
   /backend         esquema Firestore y reglas de seguridad
   /help            "¿qué hago ahora?" — muestra el progreso del pipeline
   ```

---

## Proyecto existente — adoptar un repo en curso

Si ya tienes código Flutter y quieres que la agencia lo tome bajo su gestión:

1. **Abre Claude Code en la raíz del proyecto existente**:

   ```bash
   cd mi-proyecto-flutter
   claude
   ```

2. **Copia los archivos de la agencia** (sin pisar tu código):

   ```bash
   # Solo copias la carpeta .claude/ y los archivos de estado raíz
   cp -r /ruta/flutter-claude-agent-team/.claude .
   cp /ruta/flutter-claude-agent-team/CLAUDE.md .
   cp /ruta/flutter-claude-agent-team/PLAN.md .
   cp /ruta/flutter-claude-agent-team/STATE.md .
   mkdir -p production/session-state production/sprints docs/adr docs/ux docs/runbooks
   ```

3. **Ejecuta `/adopt`** — escanea el proyecto y produce un diagnóstico completo:

   ```
   /adopt
   ```

   El comando analiza 9 capas en paralelo:

   | Capa | Qué detecta |
   |------|------------|
   | Identidad | nombre, versión, SDK constraint |
   | Dependencias | gestor de estado, Firebase, Flame, AdMob, versiones mal pinadas |
   | Arquitectura | ¿Feature-First + Clean? ¿hay `screens/`/`models/` globales? |
   | Tests | conteo por feature, features sin espejo en `test/` |
   | Firebase | `firebase.json`, reglas versionadas, App Check |
   | CI/CD | GitHub Actions / Codemagic, jobs activos |
   | Firma | `key.properties` Android, signing iOS |
   | Calidad | `flutter analyze`, TODOs, `dynamic`, strings hardcoded |
   | Flame | estructura de juego si el paquete está presente |

4. **Revisa el diagnóstico** — `/adopt` muestra una tabla con secciones
   **CRÍTICO / IMPORTANTE / MEJORA / YA BIEN HECHO** y el comando sugerido
   para cada punto.

5. **Aprueba** que se escriban `PLAN.md` y `STATE.md` con el estado real
   encontrado — la agencia queda lista para continuar desde donde estás.

6. **Sigue el plan de remediación** con los comandos sugeridos:

   ```
   /audit           auditoría general de código y dependencias
   /deps-audit      dependencias desactualizadas
   /security-audit  secretos, reglas, permisos
   /arch            refactorizar hacia Clean Architecture si hace falta
   /qa              añadir tests donde faltan
   /ci-setup        configurar pipeline si no hay
   ```

### Ejemplo de salida de `/adopt`

```
╔══════════════════════════════════════════════════╗
║           DIAGNÓSTICO DEL PROYECTO               ║
╚══════════════════════════════════════════════════╝

Proyecto:    my_shop v1.2.4
Flutter SDK: >=3.0.0 (instalado: 3.41.2)
Plataformas: android, ios

━━━ ARQUITECTURA ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Patrón detectado: Híbrido (lib/screens/ + lib/features/ mezclados)
Capas Clean: domain ✗  data ✗  presentation ✓ (parcial)
Features: auth, cart, catalog, checkout, profile
Gestor de estado: provider 6.0.5 (desactualizado, considerar Riverpod)

━━━ DEPENDENCIAS ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Total: 18 directas, 7 desactualizadas
Firebase: core 3.6.0 ✓, auth 4.19.0 ✓, firestore 4.17.0 ✓
Versiones pinadas sin ^: dio: 5.4.0, shared_preferences: 2.2.0

━━━ TESTS ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Unit/widget tests: 4
Integration tests: 0
Features sin test: auth, cart, catalog, checkout, profile

━━━ PLAN DE REMEDIACIÓN ━━━━━━━━━━━━━━━━━━━━━━━━━

CRÍTICO:
  1. 4 tests para 5 features → /qa
  2. 7 dependencias desactualizadas → /deps-update

IMPORTANTE:
  1. Arquitectura híbrida → /arch (migrar screens/ a feature-first)
  2. Sin integración tests → /integration-test

YA BIEN HECHO:
  - Firebase actualizado y configurado
  - CI con GitHub Actions funcionando
  - key.properties presente (no versionado)
```

---

## Flujo completo

```
Nuevo:    /start ──► /design ──► /arch ──► /backend ──► /code ──► /qa
Existente: /adopt ──────────────────────────────────────────────► /qa
                                                                    │
          /game* ──► /game-scaffold ──► /flame-component*           │
                                                                    ▼
                          /audit ──► /deploy ──► /growth ◄──────── ┘
```

`*` Solo si el proyecto incluye un juego con Flame.

| Fase         | Comandos clave |
| ------------ | -------------- |
| Onboarding   | `/start` · `/adopt` · `/setup-flutter` · `/help` |
| UX/UI        | `/design` · `/design-system` · `/ux-review` |
| Arquitectura | `/arch` · `/architecture-decision` · `/pick-state-management` · `/deps-update` |
| Backend      | `/backend` · `/firestore-schema` · `/firestore-rules` · `/auth-setup` · `/functions-scaffold` |
| Código       | `/code` · `/feature-scaffold` · `/code-review` |
| Juego (Flame)| `/game` · `/game-scaffold` · `/flame-component` |
| QA           | `/qa` · `/widget-test` · `/integration-test` |
| Auditoría    | `/audit` · `/deps-audit` · `/security-audit` |
| Deploy       | `/deploy` · `/build-android` · `/build-ios` · `/ci-setup` · `/dns-setup` · `/release-checklist` |
| Growth       | `/growth` · `/aso` · `/admob` · `/app-ads-verify` · `/promo-video` |

---

## Estructura del proyecto

```
CLAUDE.md                # Configuración maestra
PLAN.md                  # Documento vivo: UX, arquitectura, backend, QA, ...
STATE.md                 # Fase actual (una línea)
README.md                # Este archivo

.claude/
  settings.json          # Permisos + wiring de hooks
  statusline.sh          # Status line (fase, flutter, branch)
  agents/                # 36 definiciones de agentes (.md con frontmatter)
  commands/              # 39 slash commands (.md con frontmatter)
  hooks/                 # Scripts de eventos (SessionStart, PreToolUse, ...)
  rules/                 # Estándares path-scoped (lib/**, functions/**, ...)
  docs/                  # Docs compartidas referenciadas por CLAUDE.md

lib/                     # Código Flutter (feature-first)
  features/<feature>/
    data/  domain/  presentation/
  game/                  # Solo si hay juego Flame
    <game>_game.dart
    components/  scenes/  overlays/  utils/

android/  ios/  web/     # Configs por plataforma
functions/               # Cloud Functions (TypeScript)
test/                    # Unit + widget tests (mirror de lib/)
integration_test/        # Tests E2E
docs/
  adr/                   # Architecture Decision Records
  ux/                    # Flujos y wireframes en texto
  runbooks/              # Playbooks operativos
production/
  session-state/         # Estado vivo entre sesiones
  sprints/               # Notas de sprint
  milestones/            # Hitos del proyecto
```

---

## Cómo funciona

### Coordinación entre agentes

1. **Delegación vertical** — directores → leads → especialistas
2. **Consulta horizontal** — agentes del mismo tier pueden consultarse, pero
   no deciden fuera de su dominio
3. **Escalado de conflictos** — suben al padre común (`orquestador` para
   conflictos cross-dominio, `software-architect` para técnicos)
4. **Handshake vía `PLAN.md`** — cada lead escribe solo en su sección;
   las peticiones cross-dominio van a `## Decisiones pendientes`

### Colaborativo, no autónomo

Cada agente sigue el protocolo:

1. **Pregunta** — antes de proponer, pide contexto
2. **Opciones** — 2-4 alternativas con pros/contras
3. **Decides tú** — siempre
4. **Borrador** — enseña el cambio antes de escribir
5. **Aprobación** — nada se commitea sin OK

### Seguridad automática

| Hook | Disparo | Qué hace |
| ---- | ------- | -------- |
| `session-start.sh` | Inicio de sesión | Lee `STATE.md`, muestra branch, TODOs |
| `detect-gaps.sh` | Inicio de sesión | Detecta proyectos vacíos y sugiere `/start` o `/adopt` |
| `validate-commit.sh` | PreToolUse (Bash) | Bloquea commits con secrets o API keys hardcoded |
| `validate-push.sh` | PreToolUse (Bash) | Avisa al hacer push a `main`/`master`; bloquea force push |
| `validate-flutter-deps.sh` | PostToolUse (Write/Edit) | Advierte si se hardcodean versiones en `pubspec.yaml` |
| `validate-skill-change.sh` | PostToolUse (Write/Edit) | Recuerda testear comandos editados |
| `verify-dart.sh`           | PostToolUse (Write/Edit) | Corre `dart analyze` en el archivo Dart recién modificado; reporta errores y warnings para que Claude se autocorrija |
| `notify.sh` | Notification | Toast en Windows / notify en Linux/macOS |
| `pre-compact.sh` | Antes de compactar | Guarda estado en `active.md` |
| `post-compact.sh` | Después de compactar | Recuerda a Claude restaurar contexto |
| `session-stop.sh` | Cierre de sesión | Archiva estado activo y log de agentes |
| `log-agent.sh` | Subagent spawned | Audit trail de subagentes |
| `log-agent-stop.sh` | Subagent stops | Cierra audit trail |

### Permisos

`settings.json` auto-aprueba operaciones seguras (`flutter test`, `git status`,
`firebase emulators:start`) y bloquea las peligrosas (`rm -rf`, force push, leer
`.env`, leer `google-services.json`, deploys directos a producción).

---

## Soporte multiplataforma

- **Android** — build AAB/APK, firma, ProGuard, `google-services.json` seguro
- **iOS** — IPA, certificados, `GoogleService-Info.plist`, capabilities
- **Web** (opcional) — build, hosting, `app-ads.txt` servido en el dominio

---

## Personalización

Es un **template**, no un framework cerrado:

- Añade/quita agentes en `.claude/agents/`
- Edita los prompts de los agentes
- Crea comandos nuevos copiando un archivo `.claude/commands/<ejemplo>.md`
- Añade rules path-scoped en `.claude/rules/`
- Ajusta los hooks de validación en `.claude/hooks/`
- Edita permisos en `.claude/settings.json`
- Cambia la intensidad de review: edita `production/review-mode.txt`
  (`full`, `lean`, `solo`)

---

## Plataforma

Probado en **Windows 11** con Git Bash. Los hooks usan patrones POSIX y funcionan
también en macOS y Linux. En Windows sin Git Bash, ejecuta `claude` dentro de WSL.

---

## Licencia

MIT. Haz fork, modifica y publica tu propia variante.
