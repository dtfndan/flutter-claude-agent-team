# Feature Spec Template

## Nombre de la Feature
`[feature_name]`

## Descripción
[Breve descripción de qué hace esta feature y qué problema resuelve]

## Usuario objetivo
[¿Quién usa esta feature y por qué?]

## Flujo de usuario
1. [Paso 1]
2. [Paso 2]
3. [Paso N]

## Pantallas
| Pantalla | Ruta | Descripción |
|---|---|---|
| [NombreScreen] | `/ruta` | [Qué muestra] |

## Estados por pantalla
| Pantalla | Loading | Empty | Error | Success |
|---|---|---|---|---|
| [NombreScreen] | [Qué muestra] | [Qué muestra] | [Qué muestra] | [Qué muestra] |

## Entidades de dominio
```dart
class [Entidad] {
  final String id;
  // ...campos
}
```

## Repositorio
```dart
abstract class [Feature]Repository {
  Future<Either<Failure, List<Entidad>>> getAll();
  Future<Either<Failure, Entidad>> getById(String id);
  // ...métodos
}
```

## Dependencias
- [ ] Paquete 1 (versión)
- [ ] Paquete 2 (versión)

## Criterios de aceptación
- [ ] [Criterio 1]
- [ ] [Criterio 2]
- [ ] [Criterio N]

## Notas técnicas
[Consideraciones de implementación, trade-offs, decisiones de diseño]
