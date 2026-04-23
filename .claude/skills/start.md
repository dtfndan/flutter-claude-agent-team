---
name: start
description: "Onboarding inicial. Saluda al usuario, detecta su experiencia, el entorno (Flutter, Dart, Firebase CLI, Node, Git) y guía paso a paso hasta dejar todo listo para el primer comando real."
---

# /start — Onboarding

Punto de entrada para cualquier sesión nueva. Tu trabajo:

1. **Leer** `STATE.md` y `PLAN.md` primero. Si ya hay fase avanzada,
   preguntar antes de reiniciar el onboarding.
2. **Delegar** al agente `onboarding-specialist` (ver
   `.claude/agents/onboarding-specialist.md`).
3. El agente debe:
   - Saludar y preguntar experiencia con Flutter (ninguna/básica/avanzada).
   - Preguntar SO (Windows/macOS/Linux) y plataformas objetivo.
   - Ejecutar diagnóstico: `flutter --version`, `dart --version`,
     `firebase --version`, `node --version`, `git --version`.
   - Aplicar la **Directriz Crítica de Versiones** (`.claude/docs/version-policy.md`):
     forzar actualización a stable más reciente donde sea posible.
   - Dar instrucciones personalizadas según SO.
   - Instalar/actualizar lo que falte (con aprobación del usuario antes
     de cada `Bash` de instalación).
4. **Al terminar**:
   - Actualizar `STATE.md` → `Fase actual: Onboarding completado; listo para /design o /arch`.
   - Registrar en `PLAN.md` sección nueva o existente con el perfil del
     usuario y el entorno verificado.

## Protocolo

Sigue el protocolo general de `CLAUDE.md`: Pregunta → Opciones →
Decisión → Borrador → Aprobación. No instales nada sin confirmación.
