---
paths:
  - "lib/core/**"
---

# Core Layer Rules

`lib/core/` contiene código compartido entre features: theme, utils, constants, error base classes, routing, DI.

- No depende de NINGUNA feature concreta (sin `import 'package:myapp/features/...'`).
- API estable: romper algo en `core/` es un cambio mayor.
- Modulado por tema: `core/theme/`, `core/router/`, `core/di/`, `core/network/`, `core/errors/`, `core/extensions/`.
- Cambios en `core/router/` o `core/di/` **deben pasar por review del `software-architect`**.
- Cualquier nuevo fichero en `core/` necesita una justificación de por qué no vive dentro de una feature.
