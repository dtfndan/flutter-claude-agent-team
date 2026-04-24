---
name: firestore-schema
description: "Diseña el esquema de colecciones de Firestore. Define documentos, campos, tipos, relaciones, índices y estrategias de paginación."
---

# /firestore-schema — Esquema de Firestore

Diseña la base de datos. Tu trabajo:

1. **Leer** `PLAN.md` secciones `## UX/UI` y `## Arquitectura`.
2. **Delegar** al agente `firestore-specialist`
   (ver `.claude/agents/firestore-specialist.md`).
3. **Preguntar** al usuario:
   - ¿Qué entidades maneja la app? (usuarios, productos, mensajes...).
   - ¿Qué queries necesita? (listados, búsqueda, filtros).
   - ¿Datos en tiempo real necesarios?
   - ¿Volumen esperado? (cientos, miles, millones de documentos).
4. **Diseñar** usando la plantilla
   `.claude/docs/templates/firestore-schema.md`:
   - **Colecciones** con path completo.
   - **Campos** por documento: nombre, tipo, requerido, default.
   - **Sub-colecciones** vs campos embebidos (trade-offs).
   - **Relaciones** (referencias por ID vs denormalización).
   - **Índices compuestos** para queries con múltiples campos.
   - **Estrategia de paginación** (cursor-based con `startAfter`).
5. **Validar** contra buenas prácticas Firestore:
   - Documentos ≤ 1MB.
   - Writes por documento ≤ 1/segundo.
   - Evitar fan-out en colecciones enormes.
   - Denormalizar para queries frecuentes.
6. **Al terminar**: Escribir en `PLAN.md` sección `## Backend`.

## Protocolo

Mostrar diagrama textual completo antes de escribir. Señalar trade-offs
de cada decisión de modelado.
