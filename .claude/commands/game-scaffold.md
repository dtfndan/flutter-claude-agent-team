---
name: game-scaffold
description: "Genera la estructura base de un juego Flame: FlameGame, primer World, CameraComponent, overlays, constantes de assets y configuración de pubspec.yaml. Requiere haber ejecutado /game primero."
argument-hint: "[nombre del juego en snake_case]"
---

# /game-scaffold — Scaffold de juego Flame

Eres el **flame-developer**, coordinado por el **flame-lead**. Genera el esqueleto del juego.

## Paso 0 — Verificar prerequisitos

1. Lee `PLAN.md > ## Juego`. Si la sección no existe o está vacía, detente y pide al usuario ejecutar `/game` primero.
2. Extrae: nombre del juego, paquetes necesarios, escenas planificadas, sistema de física.
3. Si el usuario pasó un argumento, úsalo como nombre del juego (`snake_case`). Si no, pregunta.

## Paso 1 — Mostrar borrador del árbol de archivos

Antes de escribir nada, muestra al usuario la lista de archivos que vas a crear:

```
pubspec.yaml                    (añadir dependencias Flame)
assets/audio/bgm/               (si tiene BGM)
assets/audio/sfx/               (si tiene SFX)
assets/images/                  (sprites)
lib/game/
├── <game_name>_game.dart
├── components/
│   └── .gitkeep
├── scenes/
│   └── gameplay_world.dart
├── overlays/
│   ├── main_menu_overlay.dart
│   ├── pause_overlay.dart
│   └── game_over_overlay.dart
└── utils/
    ├── assets.dart
    └── game_config.dart
lib/features/game/
└── presentation/
    └── pages/game_page.dart    (GameWidget dentro de la app)
```

Pregunta: **"¿Creo estos archivos?"**

## Paso 2 — Generar archivos (solo con aprobación)

### `lib/game/utils/game_config.dart`
```dart
abstract final class GameConfig {
  static const double targetFps = 60;
  static const Vector2 referenceSize = Vector2(390, 844); // iPhone 14
  static const int initialLives = 3;
}
```

### `lib/game/utils/assets.dart`
```dart
abstract final class Assets {
  // Images
  static const String playerSprite = 'player/player.png';

  // Audio
  static const String bgmTheme = 'audio/bgm/theme.mp3';
  static const String sfxJump  = 'audio/sfx/jump.wav';
}
```

### `lib/game/<game_name>_game.dart`
```dart
class <GameName>Game extends FlameGame
    with HasCollisionDetection, // quitar si usa Forge2D
         TapCallbacks {

  <GameName>Game() : super(
    camera: CameraComponent.withFixedResolution(
      width: GameConfig.referenceSize.x,
      height: GameConfig.referenceSize.y,
    ),
  );

  @override
  Future<void> onLoad() async {
    await images.loadAllImages();
    world = GameplayWorld();
    overlays.addEntry('MainMenu',   (ctx, game) => MainMenuOverlay(game: game as <GameName>Game));
    overlays.addEntry('Pause',      (ctx, game) => PauseOverlay(game: game as <GameName>Game));
    overlays.addEntry('GameOver',   (ctx, game) => GameOverOverlay(game: game as <GameName>Game));
    overlays.add('MainMenu');
  }
}
```

### `lib/game/scenes/gameplay_world.dart`
```dart
class GameplayWorld extends World with HasGameRef<<GameName>Game> {
  @override
  Future<void> onLoad() async {
    // Añade componentes del nivel aquí
  }
}
```

### Overlays (estructura mínima para cada uno)
```dart
class MainMenuOverlay extends StatelessWidget {
  const MainMenuOverlay({super.key, required this.game});
  final <GameName>Game game;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          game.overlays.remove('MainMenu');
          // iniciar partida
        },
        child: const Text('Jugar'),
      ),
    );
  }
}
```

### `lib/features/game/presentation/pages/game_page.dart`
```dart
class GamePage extends StatefulWidget {
  const GamePage({super.key});
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late final <GameName>Game _game;

  @override
  void initState() {
    super.initState();
    _game = <GameName>Game();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: _game,
        overlayBuilderMap: _game.overlays.buildMap(),
      ),
    );
  }
}
```

## Paso 3 — Actualizar pubspec.yaml

Añade las dependencias de Flame detectadas en `PLAN.md > ## Juego`. Siempre verifica la versión más reciente en pub.dev antes de escribir:

```yaml
dependencies:
  flame: ^<latest>
  flame_audio: ^<latest>       # si tiene audio
  flame_forge2d: ^<latest>     # si usa física Forge2D
  flame_tiled: ^<latest>       # si usa mapas Tiled
  flame_riverpod: ^<latest>    # si el proyecto usa Riverpod

flutter:
  assets:
    - assets/images/
    - assets/audio/bgm/
    - assets/audio/sfx/
```

Pregunta aprobación antes de modificar `pubspec.yaml`.

## Paso 4 — Ejecutar `flutter pub get`

Con aprobación del usuario:
```bash
flutter pub get
```

## Paso 5 — Cierre

Actualiza `STATE.md`:
```
Fase actual: Scaffold de juego generado; listo para /flame-component o desarrollo manual
```

Escribe en `PLAN.md > ## Juego`:
```
### Scaffold generado
- Fecha: <fecha>
- Archivos creados: [lista]
- Siguiente paso: implementar primer componente con /flame-component
```

Recomienda: **"Usa `/flame-component` para crear el primer componente del juego (p. ej., el jugador)."**
