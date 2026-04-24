# Estructura del proyecto

Esqueleto estándar que todos los agentes deben respetar. Se construye la primera
vez con `/setup-flutter` y se mantiene a lo largo del ciclo de vida.

```
./
├── CLAUDE.md                     # System prompt maestro (no tocar sin orquestador)
├── PLAN.md                       # Arquitectura, esquemas, decisiones (editable por agentes)
├── STATE.md                      # Fase actual (una línea)
├── README.md                     # Descripción pública del proyecto
│
├── .claude/                      # Configuración del estudio
│   ├── agents/                   # 31 agentes especialistas (.md con frontmatter)
│   ├── commands/                 # Slash commands (.md con frontmatter)
│   ├── rules/                    # Reglas path-scoped (android-config, dart-code, etc.)
│   ├── hooks/                    # Shell scripts disparados por eventos
│   ├── docs/                     # Docs importados por CLAUDE.md (este archivo incluido)
│   └── settings.json             # Permisos, hooks declarados, statusline
│
├── lib/                          # Código Flutter (feature-first + clean architecture)
│   ├── main.dart
│   ├── app/                      # Bootstrap, routing, DI, theme
│   ├── core/                     # Utilidades compartidas, errores, extensiones
│   ├── features/
│   │   └── <feature>/
│   │       ├── data/             # DataSources, DTOs, repos impl
│   │       ├── domain/           # Entities, use cases, repos (abstract)
│   │       └── presentation/     # Widgets, state (Riverpod/Bloc)
│   └── l10n/                     # Localización ARB
│
├── test/                         # Unit + widget tests (mirror de lib/)
├── integration_test/             # Tests de integración (emuladores Firebase)
│
├── android/                      # Gradle, AndroidManifest, key.properties
├── ios/                          # Xcode, Info.plist, provisioning
│
├── functions/                    # Cloud Functions (TypeScript)
│   ├── src/
│   ├── package.json
│   └── tsconfig.json
│
├── firebase.json                 # Emuladores, hosting, rules paths
├── firestore.rules               # Reglas Firestore
├── firestore.indexes.json        # Índices compuestos
├── storage.rules                 # Reglas Storage
│
├── scripts/                      # Bash/Dart scripts locales (build, clean, deploy)
│
├── docs/
│   ├── adr/                      # Architecture Decision Records (adr-001-*.md …)
│   ├── ux/                       # Flujos, wireframes en texto, design tokens
│   └── runbooks/                 # Playbooks operativos (release, rollback, incident)
│
├── production/
│   ├── session-state/
│   │   └── active.md             # Estado vivo entre sesiones (leído por hook)
│   └── releases/                 # Notas y artefactos por release
│
└── app-ads.txt                   # Plantilla; la versión publicada vive en el dominio raíz
```

## Reglas

- **Feature-First**: cada feature es autocontenida en `lib/features/<feature>/`
  con sus tres capas. Nada de `lib/screens/` ni `lib/models/` globales.
- **Dominio sin dependencias**: `domain/` no puede importar `data/` ni
  `presentation/` ni paquetes Firebase. Solo Dart puro + interfaces.
- **Tests espejo**: `test/features/<feature>/...` reproduce la estructura de
  `lib/features/<feature>/...`.
- **Cloud Functions** vive fuera de `lib/`; su ciclo de vida es independiente
  pero se versiona junto con la app.
- **`docs/adr/`** es obligatorio: cada decisión estructural (estado, paquete
  nuevo, cambio de stack) requiere un ADR numerado.
- **`production/session-state/active.md`** lo mantiene el orquestador; no es
  para uso manual.
