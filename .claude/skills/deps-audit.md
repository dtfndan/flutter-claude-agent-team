---
name: deps-audit
description: "Audita todas las dependencias del proyecto. Detecta versiones desactualizadas, deprecated, y vulnerabilidades conocidas."
---

# /deps-audit — Auditoría de Dependencias

Revisa la salud de las dependencias. Tu trabajo:

1. **Delegar** al agente `dependency-auditor`
   (ver `.claude/agents/dependency-auditor.md`).
2. **Ejecutar**:
   - `flutter pub outdated` → tabla de versiones (current vs resolvable vs latest).
   - `flutter pub deps` → árbol de dependencias.
   - Revisar `pubspec.lock` por paquetes con advisories.
3. **Para cada paquete desactualizado**, clasificar:
   - **Major update**: requiere migración (breaking changes).
   - **Minor/Patch**: actualización directa.
   - **Deprecated**: buscar alternativa.
4. **Consultar** pub.dev para cada paquete con update major:
   - Leer changelog de breaking changes.
   - Evaluar esfuerzo de migración.
5. **Producir plan de actualización**:
   - Orden de actualización (dependencias transversales primero).
   - Para cada update: cambio en `pubspec.yaml` + migraciones necesarias.
   - Estimación de riesgo (bajo/medio/alto).
6. **Al terminar**: Registrar en `PLAN.md` sección `## Auditoría`.

## Protocolo

Nunca hacer `flutter pub upgrade` automáticamente. Mostrar el plan
completo para aprobación del usuario antes de cada cambio.
