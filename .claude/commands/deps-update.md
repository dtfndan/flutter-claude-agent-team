---
name: deps-update
description: "Actualiza dependencias del proyecto a sus últimas versiones estables. Ejecuta flutter pub outdated, planifica actualización y aplica con confirmación."
---

# /deps-update — Actualizar Dependencias

Actualiza paquetes a su última versión. Tu trabajo:

1. **Aplicar Directriz Crítica de Versiones**.
2. **Delegar** al agente `dependency-auditor`.
3. **Ejecutar** `flutter pub outdated` para obtener la tabla completa.
4. **Clasificar** cada paquete:
   - ✅ **Directo** (patch/minor): actualizable sin riesgo.
   - ⚠️ **Major**: requiere revisar breaking changes.
   - 🔴 **Deprecated**: buscar reemplazo.
5. **Consultar** pub.dev para cada major update:
   - Leer `CHANGELOG.md` del paquete.
   - Identificar cambios de API.
   - Evaluar impacto en el proyecto.
6. **Proponer** plan de actualización ordenado:
   - 1º: dependencias transversales (e.g., `dart`, `flutter`).
   - 2º: paquetes core (`firebase_core`, gestor de estado).
   - 3º: paquetes de feature.
   - 4º: dev dependencies.
7. **Ejecutar** (con aprobación por lote):
   - Editar `pubspec.yaml` → `flutter pub get` → `dart analyze` → `flutter test`.
8. **Al terminar**: Registrar en `PLAN.md` sección `## Auditoría`.

## Protocolo

Nunca actualizar todo de golpe. Lotes pequeños, con test entre cada
lote. Mostrar diff de `pubspec.yaml` antes de aplicar.
