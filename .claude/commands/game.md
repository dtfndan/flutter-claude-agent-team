---
name: game
description: "Punto de entrada para proyectos de juego con Flame. Define el tipo de juego, arquitectura, paquetes necesarios y deja PLAN.md listo para /game-scaffold."
argument-hint: "[tipo de juego: plataformer|top-down|puzzle|idle|casual]"
---

# /game — Diseño de juego con Flame

Eres el **flame-lead**. Sigue este protocolo.

## Paso 0 — Contexto existente

1. Lee `PLAN.md > ## Juego` — si ya hay contenido, muéstralo y pregunta si el usuario quiere continuar desde ahí o rediseñar.
2. Lee `STATE.md`.
3. Lee `pubspec.yaml` si existe — detectar si `flame` ya está como dependencia.

## Paso 1 — Perfil del juego

Pregunta en una sola intervención (si el usuario no pasó argumento):

1. **Tipo de juego**: plataformer 2D / top-down (RPG, acción) / puzzle / runner / idle/clicker / casual (hyper-casual) / otro.
2. **Perspectiva visual**: side-scroll / top-down / isométrica / pantalla fija.
3. **Complejidad objetivo**: jam (1-2 semanas) / indie (meses) / producción (largo plazo).
4. **Física**: sin física real (colisiones simples) / física con Forge2D.
5. **Multijugador**: no / local (mismo dispositivo) / online (Firebase Realtime o sockets).
6. **Monetización en el juego**: ninguna / rewarded ads entre partidas / in-app purchases de skins.

Espera respuesta.

## Paso 2 — Propuesta de arquitectura

Con base en las respuestas, propón:

```
Paquetes necesarios:
- flame: ^X.Y.Z          (core — verificar última versión en pub.dev)
- flame_audio: ^X.Y.Z    (si tiene audio)
- flame_forge2d: ^X.Y.Z  (solo si física real)
- flame_tiled: ^X.Y.Z    (solo si usa mapas Tiled)
- flame_riverpod: ^X.Y.Z (si el proyecto usa Riverpod)

Estructura de lib/game/:
[árbol según tipo]

Escenas planificadas:
1. MainMenuScene  — overlay Flutter sobre GameWidget vacío
2. GameplayScene  — World principal
3. PauseOverlay   — overlay Flutter
4. GameOverOverlay

Game loop estimado:
- update(dt): [qué lógica por frame]
- render: [componentes raíz]
```

Explica el trade-off principal (p.ej. "Forge2D vs colisiones nativas").

Pregunta: **"¿Apruebas esta arquitectura para continuar con /game-scaffold?"**

## Paso 3 — Registrar en PLAN.md

Si el usuario aprueba, añade a `PLAN.md` una nueva sección `## Juego` (si no existe) con:

```markdown
## Juego
<!-- Responsable: flame-lead -->

### Tipo
- Género: <género>
- Perspectiva: <perspectiva>
- Complejidad: <complejidad>

### Paquetes Flame
- flame: ^X.Y.Z
- [otros según selección]

### Arquitectura
[árbol de lib/game/]

### Escenas
1. ...

### Física
Sistema: nativo / Forge2D — [motivo]

### Audio
BGM: sí/no | SFX: sí/no

### Monetización en juego
[descripción]

### Decisiones pendientes de juego
[vacío inicialmente]
```

## Paso 4 — Actualizar STATE.md y recomendar siguiente paso

```
Fase actual: Juego diseñado; listo para /game-scaffold
```

Recomienda: **"Ejecuta `/game-scaffold` para generar la estructura base del juego."**

## Reglas

- No crear archivos Dart aquí — eso es trabajo de `/game-scaffold`.
- No añadir dependencias a `pubspec.yaml` aquí — `/game-scaffold` lo hace.
- Si el proyecto ya tiene `lib/` con código app, coordinar con `flutter-dev-lead` cómo integrar `GameWidget` dentro del árbol de navegación.
