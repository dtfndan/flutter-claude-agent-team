---
name: feature-scaffold
description: "Crea la estructura de carpetas y archivos base para una nueva feature siguiendo Clean Architecture + Feature-First."
---

# /feature-scaffold — Scaffolding de Feature

Crea el esqueleto de una feature nueva. Tu trabajo:

1. **Leer** `PLAN.md` sección `## Arquitectura` para conocer las
   convenciones de capas y el gestor de estado elegido.
2. **Preguntar** al usuario:
   - Nombre de la feature (snake_case).
   - ¿Qué capas necesita? (data/domain/presentation o subset).
   - ¿Tiene entidades propias en Firestore?
   - ¿Necesita navegación propia (rutas)?
3. **Generar** la estructura usando la plantilla
   `.claude/docs/templates/feature-spec.md`:

   ```
   lib/features/<nombre>/
     data/
       datasources/
       models/
       repositories/
     domain/
       entities/
       repositories/
       usecases/
     presentation/
       screens/
       widgets/
       providers/  (o blocs/)
   ```

4. **Crear** archivos stub con:
   - Barrel exports (`<capa>.dart`).
   - Clases abstractas de repositorio en `domain/repositories/`.
   - Implementaciones en `data/repositories/`.
5. **Al terminar**:
   - Listar archivos creados al usuario.
   - Registrar la feature en `PLAN.md` sección `## Implementación`.

## Protocolo

Mostrar la estructura completa antes de crear archivos. Confirmar con el
usuario. No crear lógica de negocio — solo esqueleto.
