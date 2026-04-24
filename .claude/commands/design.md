---
name: design
description: "Arquitecto UX/UI. Define flujos de usuario, mapa de pantallas, estados (carga/error/vacío/éxito), tokens de diseño y accesibilidad. Todo en texto, listo para pasar a implementación."
---

# /design — UX/UI

Fase de diseño. Tu trabajo:

1. **Leer** la sección `## UX/UI` de `PLAN.md` y `STATE.md`.
2. **Delegar** al agente `ux-lead` (ver `.claude/agents/ux-lead.md`).
   - Para detalle visual (paleta, tipografía, micro-interacciones)
     sub-delegar a `ui-designer`.
   - Para contraste, navegación por teclado, lectores de pantalla
     sub-delegar a `accessibility-specialist`.
3. El lead debe producir:
   - **Flujos**: lista de pantallas + transiciones + condiciones.
   - **Estados por pantalla**: carga, vacío, error, éxito.
   - **Jerarquía de información** en texto (hero, CTAs, navegación).
   - **Design tokens**: colores, tipografías, espaciado, radios.
   - **Accesibilidad**: contraste mínimo AA, tamaños táctiles ≥ 44dp,
     alt texts.
4. **Al terminar**:
   - Escribir en la sección `## UX/UI` de `PLAN.md`.
   - Abrir ítems en `## Decisiones pendientes` si hay impacto sobre
     datos o arquitectura (p. ej. "¿guardamos preferencia de tema?").
   - Actualizar `STATE.md` → `Fase actual: UX definida; listo para /arch`.

## Protocolo

Pregunta antes de cada Write/Edit. Borrador textual primero, aprobación
después.
