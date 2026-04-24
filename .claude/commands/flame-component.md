---
name: flame-component
description: "Crea un nuevo componente Flame con su estructura base: PositionComponent o BodyComponent, hitbox, animación sprite opcional, input opcional y su widget test. Uso: /flame-component <nombre>"
argument-hint: "<nombre> [tipo: sprite|animated|physics|particle]"
---

# /flame-component — Nuevo componente Flame

Eres el **flame-developer**. Crea un componente completo con su test.

## Paso 0 — Recopilar información

Si el usuario no pasó argumentos suficientes, pregunta en una sola intervención:

1. **Nombre** del componente (PascalCase, p. ej. `Player`, `Enemy`, `Coin`).
2. **Tipo base**:
   - `sprite` — imagen estática (`SpriteComponent`)
   - `animated` — sprite sheet animado (`SpriteAnimationComponent`)
   - `physics` — cuerpo Forge2D (`BodyComponent`)
   - `particle` — sistema de partículas (`ParticleSystemComponent`)
   - `custom` — `PositionComponent` base limpio
3. **Tiene hitbox** para colisiones: sí / no. Forma: rectángulo / círculo / polígono.
4. **Responde a input**: ninguno / tap / drag / ambos.
5. **Comportamientos** (opcionales): gravedad manual / seguir target / patrol / shooting.

## Paso 1 — Mostrar borrador

Muestra el código que vas a generar **antes de escribir**. Adapta según el tipo:

### Ejemplo — tipo `animated` con hitbox y tap:

```dart
// lib/game/components/player/player_component.dart
class PlayerComponent extends PositionComponent
    with HasGameRef<MyGame>, TapCallbacks, CollisionCallbacks {

  PlayerComponent({Vector2? position})
      : super(
          position: position ?? Vector2.zero(),
          size: Vector2(48, 48),
          anchor: Anchor.center,
        );

  late final SpriteAnimationComponent _idleAnimation;
  late final SpriteAnimationComponent _runAnimation;
  SpriteAnimationComponent? _currentAnimation;

  @override
  Future<void> onLoad() async {
    final idleSheet = await game.images.load(Assets.playerIdle);
    _idleAnimation = SpriteAnimationComponent(
      animation: SpriteAnimation.fromFrameData(
        idleSheet,
        SpriteAnimationData.sequenced(amount: 4, stepTime: 0.15, textureSize: Vector2(48, 48)),
      ),
      size: size,
    );
    _currentAnimation = _idleAnimation;
    add(_idleAnimation);
    add(RectangleHitbox());
  }

  @override
  void onTapDown(TapDownEvent event) {
    // reaccionar a tap
  }

  @override
  void onCollisionStart(Set<Vector2> points, PositionComponent other) {
    super.onCollisionStart(points, other);
    if (other is EnemyComponent) {
      // lógica
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    // movimiento, velocidad, etc.
  }
}
```

Pregunta: **"¿Genero este componente y su test?"**

## Paso 2 — Generar componente y test (solo con aprobación)

Crea:
- `lib/game/components/<categoria>/<nombre>_component.dart`
- `test/game/components/<categoria>/<nombre>_component_test.dart`

### Plantilla de test:

```dart
// test/game/components/player/player_component_test.dart
import 'package:flame_test/flame_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PlayerComponent', () {
    testWithGame<MyGame>(
      'should load without error',
      MyGame.new,
      (game) async {
        final player = PlayerComponent();
        await game.ensureAdd(player);
        expect(game.children.whereType<PlayerComponent>(), hasLength(1));
      },
    );

    testWithGame<MyGame>(
      'should have correct initial size',
      MyGame.new,
      (game) async {
        final player = PlayerComponent();
        await game.ensureAdd(player);
        expect(player.size, Vector2(48, 48));
      },
    );
  });
}
```

## Paso 3 — Registrar en PLAN.md

Añade en `PLAN.md > ## Juego` bajo un subsection `### Componentes`:

```
- [x] <NombreComponent> — <descripción de una línea> (<fecha>)
```

## Reglas

- Un componente = un archivo = una clase principal.
- Siempre incluir el test en el mismo PR que el componente.
- Añadir la constante de asset en `utils/assets.dart` si el componente carga imágenes.
- Si el tipo es `physics`, verificar que el juego usa `Forge2DGame` (no `FlameGame`); si no, advertir y preguntar.
