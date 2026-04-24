---
name: code-review
description: "Revisa código existente contra los estándares del proyecto. Detecta violaciones de arquitectura, code smells, problemas de rendimiento y dependencias mal usadas."
---

# /code-review — Revisión de Código

Revisa código Flutter/Dart del proyecto. Tu trabajo:

1. **Leer** `.claude/docs/coding-standards.md` y las rules aplicables.
2. **Preguntar** al usuario qué revisar:
   - Un archivo o carpeta específica.
   - Los últimos N commits (`git diff HEAD~N`).
   - Toda una feature.
3. **Delegar** revisión al agente `code-auditor`
   (ver `.claude/agents/code-auditor.md`).
4. Revisar contra estos criterios:
   - **Arquitectura**: ¿respeta las fronteras de capa (domain sin Flutter, data sin reglas de negocio, presentation sin estado directo)?
   - **Naming**: ¿sigue convenciones de Dart (snake_case archivos, PascalCase clases, camelCase variables)?
   - **Estado**: ¿usa el gestor de estado elegido correctamente?
   - **Errores**: ¿manejo de errores con Either/Result o try-catch apropiado?
   - **Performance**: ¿widgets const, keys correctas, evita rebuilds innecesarios?
   - **Seguridad**: ¿no hay secretos hardcodeados, no hay prints de datos sensibles?
   - **Versiones**: ¿dependencias en su última versión estable?
5. **Producir** un reporte:
   - 🔴 Crítico (bloquea merge)
   - 🟡 Sugerencia (mejora calidad)
   - 🟢 Bien hecho (refuerzo positivo)
6. **Al terminar**: Registrar resumen en `PLAN.md` sección `## QA`.

## Protocolo

Solo reportar, no modificar código directamente. Si el usuario pide
arreglar algo, ejecutar `/code` con las correcciones.
