---
paths:
  - "lib/features/**/data/**"
---

# Data Layer Rules

La capa `data/` implementa los contratos del `domain/`. Es la única que habla con Firebase, REST, SQLite, SharedPreferences, etc.

- Estructura: `data/datasources/` (remote/local), `data/models/` (DTOs con `fromJson`/`toJson`), `data/repositories/` (implementación del contrato).
- Los modelos DTO extienden o mapean a entidades del dominio — no son lo mismo.
- Los `RemoteDataSource` exponen métodos que devuelven modelos DTO. Lanzan excepciones tipadas (`ServerException`, `UnauthenticatedException`).
- Los repositorios atrapan esas excepciones y las traducen a `Failure` del dominio.
- Reintentos, caché y `connectivity` viven aquí — jamás en la capa de presentación.
- Las consultas a Firestore **se definen una vez** (constantes de colección/índice); nada de strings dispersos.

## Prohibiciones

- ❌ Lógica de negocio en la data layer (validaciones semánticas, reglas de precios, etc. — eso va en `domain/` o `core/`).
- ❌ Usar `FirebaseFirestore.instance` de forma directa: inyéctalo.
- ❌ Exponer DTOs fuera de `data/` — la capa superior solo conoce entidades del dominio.
