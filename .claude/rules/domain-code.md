---
paths:
  - "lib/features/**/domain/**"
  - "lib/core/usecases/**"
---

# Domain Layer Rules

La capa `domain/` es **puro Dart**. Es el corazón de la app y debe ser reutilizable y testeable sin Flutter ni Firebase.

- ❌ Prohibido `import 'package:flutter/...';`
- ❌ Prohibido `import 'package:cloud_firestore/...';`, `firebase_auth`, `http`, `dio`, `shared_preferences`, etc.
- ✅ Solo `dart:*`, `package:meta`, `package:equatable`, `package:dartz`/`fpdart`, y otras libs puras.
- Contiene: entidades (`Entity`), value objects, use cases (`UseCase`), contratos de repositorio (`abstract class Repository`), fallos de dominio (`Failure`).
- Los use cases tienen UN método público (`call` o `execute`) y reciben dependencias por constructor.
- Los fallos se modelan como tipos, no como `Exception` genéricos (`AuthFailure`, `NetworkFailure`, `ValidationFailure`).
- Cobertura objetivo: 90%+ en unit tests.

## Convenciones

- Entidades inmutables (`@immutable` + `copyWith`).
- Los contratos de repositorio devuelven `Future<Either<Failure, T>>` o `Result<T>`.
- Un use case = un caso de uso de negocio con nombre imperativo (`GetUserProfile`, `SendPasswordReset`).
