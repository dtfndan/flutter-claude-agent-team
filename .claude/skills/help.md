---
name: help
description: "Muestra en qué fase está el proyecto y sugiere el siguiente paso. Lee STATE.md y PLAN.md para dar orientación contextual."
---

# /help — ¿Qué hago ahora?

Orientación contextual. Tu trabajo:

1. **Leer** `STATE.md` para saber la fase actual.
2. **Leer** `PLAN.md` para saber qué secciones están completas y cuáles
   tienen pendientes.
3. **Consultar** `.claude/docs/workflow-catalog.yaml` para el flujo
   recomendado.
4. **Mostrar** al usuario:

   ### Estado actual
   - Fase: `[contenido de STATE.md]`
   - Branch: `[git branch actual]`
   - Última actividad: resumen de la última sección modificada de PLAN.md.

   ### Progreso
   ```
   [x] Onboarding     → completado / pendiente
   [ ] UX/UI          → completado / pendiente
   [ ] Arquitectura   → completado / pendiente
   [ ] Backend        → completado / pendiente
   [ ] Código         → completado / pendiente
   [ ] QA             → completado / pendiente
   [ ] Auditoría      → completado / pendiente
   [ ] Deploy         → completado / pendiente
   [ ] Growth         → completado / pendiente
   ```

   ### Siguiente paso recomendado
   - Según la fase actual, sugerir el comando más apropiado.
   - Si hay decisiones pendientes en `PLAN.md`, priorizarlas.

   ### Comandos disponibles
   - Lista rápida de los comandos principales con descripción de una
     línea.

5. **No modificar** ningún archivo — solo informar.

## Protocolo

Solo lectura. Si el usuario elige un comando, ejecutarlo.
