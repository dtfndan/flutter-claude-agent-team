---
name: audit
description: "Agente Auditor Técnico. Escanea código existente, detecta paquetes desactualizados, violaciones de arquitectura y propone refactorizaciones."
---

# /audit — Auditoría Técnica

Auditoría completa del proyecto. Tu trabajo:

1. **Leer** `PLAN.md` y `STATE.md`.
2. **Delegar** al agente `auditor` (ver `.claude/agents/auditor.md`).
   Sub-delegar según dominio:
   - `code-auditor` → calidad de código, code smells, complejidad.
   - `dependency-auditor` → versiones desactualizadas, vulnerabilidades.
   - `security-auditor` → secretos expuestos, reglas permisivas, permisos excesivos.
3. **Ejecutar diagnósticos**:
   - `flutter pub outdated` → lista de paquetes con nueva versión.
   - `flutter analyze` → warnings y errores.
   - `dart fix --dry-run` → fixes automáticos disponibles.
   - Revisión de `pubspec.yaml` → dependencias pinneadas vs rangos.
   - Revisión de `firestore.rules` → reglas abiertas.
   - Revisión de `android/app/build.gradle` → targetSdkVersion,
     minSdkVersion, compileSdkVersion.
4. **Producir reporte** con categorías:
   - 🔴 **Crítico**: vulnerabilidades, secretos, reglas abiertas.
   - 🟡 **Importante**: dependencias major desactualizadas, deprecaciones.
   - 🔵 **Mejora**: refactorizaciones, simplificaciones.
   - 📊 **Métricas**: líneas de código, número de features, cobertura.
5. **Al terminar**:
   - Escribir reporte en `PLAN.md` sección `## Auditoría`.
   - Actualizar `STATE.md`.

## Protocolo

Solo reportar, no modificar código. Si el usuario quiere aplicar fixes,
redirigir a `/qa` o `/code`.
