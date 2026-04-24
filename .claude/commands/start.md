---
name: start
description: "Onboarding inicial. Saluda al usuario, detecta su experiencia, el entorno (Flutter, Dart, Firebase CLI, Node, Git) y guía paso a paso hasta dejar todo listo para el primer comando real."
argument-hint: ""
---

# /start — Onboarding

Este es el punto de entrada. Eres el **orquestador** hasta que termines esta skill. Sigue este protocolo paso a paso; no delegues a un subagente salvo el último paso de instalación.

## Paso 0 — Reconocer estado previo

1. Lee `STATE.md` (una sola línea).
2. Si dice algo distinto a `Esperando comando inicial (/start)`:
   - Muestra la línea al usuario.
   - Pregunta: **"Veo que la sesión anterior terminó en `<fase>`. ¿Quieres (a) continuar desde ahí, (b) reiniciar el onboarding, o (c) saltar a un comando específico?"**
   - Si elige (a), termina `/start` y recomienda el siguiente comando apropiado según la fase.
   - Si elige (c), termina `/start` y espera su comando.
   - Solo si elige (b), continúa con Paso 1.
3. Si `STATE.md` dice exactamente `Esperando comando inicial (/start)` o está vacío, continúa con Paso 1.

## Paso 1 — Saludo + perfil del usuario

Saluda en español, breve. Pregunta en una sola intervención:

1. **Experiencia con Flutter**: ninguna / básica / intermedia / avanzada.
2. **Sistema operativo**: Windows / macOS / Linux.
3. **Plataformas objetivo**: Android / iOS / ambas / web.
4. **Tipo de app**: producto nuevo / port de otro stack / prototipo / ya tienes código.

Espera respuesta antes de continuar.

## Paso 2 — Diagnóstico de entorno

Ejecuta en paralelo (todos son read-only, ya permitidos en `settings.json`):

```bash
flutter --version
dart --version
firebase --version
node --version
npm --version
git --version
flutter doctor -v
```

Captura las versiones. Compáralas con las mínimas requeridas en `.claude/docs/version-policy.md`:

- **Flutter**: canal `stable`, última versión.
- **Node**: LTS actual (>= 20).
- **Firebase CLI**: última global.
- **Dart**: el que llega con Flutter stable.
- **Git**: cualquiera reciente.

## Paso 3 — Reporte de gaps + plan de remediación

Presenta al usuario una tabla con formato:

```
| Herramienta   | Instalada | Requerida    | Estado |
|---------------|-----------|--------------|--------|
| Flutter       | 3.X.Y     | stable latest| OK / UPGRADE / MISSING |
| Dart          | ...       | ...          | ...    |
| Firebase CLI  | ...       | ...          | ...    |
| Node          | ...       | LTS >= 20    | ...    |
| Git           | ...       | cualquiera   | ...    |
```

Si hay MISSING o UPGRADE pendientes, propon **una sola remediacion consolidada** adaptada al SO del usuario:

- **Windows**: recomendar `winget` o installers oficiales. NO instales en el sistema del usuario sin su aprobacion explicita del Bash especifico.
- **macOS**: recomendar Homebrew.
- **Linux**: snap / apt segun distro.

Pregunta: **"Quieres que ejecute los comandos de instalacion/actualizacion uno a uno (pidiendo aprobacion por cada uno) o prefieres copiarlos y ejecutarlos tu?"**

## Paso 4 — Delegar a onboarding-specialist (solo si hay instalaciones a hacer)

Si el usuario aprueba instalar con tu ayuda, invoca al subagente `onboarding-specialist` con contexto explicito:

- Perfil del usuario (experiencia, SO, plataformas, tipo de app).
- Lista exacta de herramientas a instalar/actualizar con la version objetivo.
- Instruccion: pedir aprobacion antes de cada `Bash` de instalacion.

Si no hay nada que instalar, salta este paso.

## Paso 5 — Cierre

1. Escribe (o reescribe) en `PLAN.md`, dentro de `## Decisiones pendientes` (al final, no tocar otras secciones), un bloque nuevo:

   ```
   ### [YYYY-MM-DD] Perfil del proyecto — @orquestador
   - Usuario: <experiencia>, SO <so>, plataformas <plataformas>.
   - Tipo: <tipo>.
   - Entorno verificado: Flutter X.Y.Z, Dart X.Y.Z, Firebase CLI X.Y.Z, Node X.Y.Z.
   - Siguiente paso sugerido: /design (si no hay diseño) o /arch (si ya hay flujos claros).
   ```

2. Actualiza `STATE.md` con una sola linea:
   ```
   Fase actual: Onboarding completado; listo para /design o /arch
   ```

3. Recomienda al usuario el siguiente comando en una frase:
   - Si el usuario dice "tengo una idea pero no diseno" -> `/design`.
   - Si el usuario dice "ya se como es visualmente, falta decidir arquitectura" -> `/arch`.
   - Si el usuario dice "ya tengo codigo Flutter, quiero auditarlo" -> `/audit`.

## Protocolo de colaboracion (recordatorio)

- Pregunta -> Opciones -> Decision -> Borrador -> Aprobacion.
- **Ningun `Bash` de instalacion sin aprobacion explicita del usuario.**
- No toques `PLAN.md` fuera de `## Decisiones pendientes`.
- No crees `pubspec.yaml`, `lib/`, ni `firebase.json` aqui — eso es trabajo de `/setup-flutter`.
