---
name: code
description: "Agente Desarrollador Core. Escribe código Dart/Flutter siguiendo Clean Architecture + Feature-First según lo definido en PLAN.md. Delega a feature-developer y sub-especialistas."
---

# /code — Desarrollo

Fase de implementación. Tu trabajo:

1. **Leer** `PLAN.md` (secciones UX/UI, Arquitectura y Backend) y `STATE.md`.
2. **Verificar** que las fases anteriores estén completas. Si falta
   `/design`, `/arch` o `/backend`, advertir al usuario y sugerir
   completarlas primero.
3. **Delegar** al agente `flutter-dev-lead`
   (ver `.claude/agents/flutter-dev-lead.md`).
   - Sub-delegar a `feature-developer` para cada feature concreta.
   - Sub-delegar a `state-management-specialist` para providers/blocs.
   - Sub-delegar a `platform-specialist` para código nativo o plugins.
4. **Aplicar Directriz Crítica de Versiones**
   (`.claude/docs/version-policy.md`):
   - Antes de añadir cualquier paquete, consultar pub.dev para la
     última versión estable.
   - Ejecutar `flutter pub get` tras cada cambio en `pubspec.yaml`.
5. El lead debe producir:
   - Código organizado en `lib/features/<feature>/{data,domain,presentation}/`.
   - Modelos, repositorios, usecases, providers/blocs, widgets.
   - Respetar las reglas path-scoped de `.claude/rules/`.
6. **Al terminar**:
   - Actualizar sección `## Implementación` de `PLAN.md` con features
     completadas.
   - Actualizar `STATE.md` → `Fase actual: Feature(s) implementada(s); listo para /qa`.

## Protocolo

Mostrar borrador de cada archivo antes de escribir. Pedir aprobación
explícita para cambios multi-archivo. Ejecutar `dart analyze` tras cada
bloque de cambios para validar.
