---
paths:
  - "lib/**/*.dart"
---

# Dart / Flutter Code Rules

- Respeta **Feature-First**: cada feature vive en `lib/features/<feature>/{data,domain,presentation}`.
- Código común va en `lib/core/` (utilidades, constantes, theme, extensions, errors).
- Nada de `print`: usa un `Logger` inyectado.
- Nada de singletons globales con estado mutable. Usa inyección de dependencias (Riverpod/Bloc + `get_it` si se justifica).
- Usa `const` siempre que sea posible.
- Usa `late final` en lugar de `late` mutable.
- Los imports siguen el orden: `dart:` → `package:` → relativos. `dart format` es la fuente de verdad.
- Un archivo = una responsabilidad pública. Si hay 3+ clases públicas grandes, divide.

## Prohibiciones

- ❌ Valores mágicos (números, strings) fuera de `lib/core/constants.dart` o del theme.
- ❌ Claves de API, IDs de AdMob, URLs de backend directamente en el código — van en `--dart-define` o `env.dart` no versionado.
- ❌ `dynamic` fuera de fronteras (JSON, native channels). Tipa todo lo demás.
- ❌ `catch (e)` sin re-lanzar o mapear a una excepción del dominio.
