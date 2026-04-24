---
name: help
description: "Muestra en qué fase está el proyecto y sugiere el siguiente paso. Lee STATE.md y PLAN.md para dar orientación contextual."
argument-hint: "[tema opcional]"
---

# /help — ¿Qué hago ahora?

Orientación contextual. **Solo lectura**, no modificar archivos.

## Qué hacer

1. Lee `STATE.md` (una línea — la fase actual).
2. Lee `PLAN.md` y detecta qué secciones están vacías vs. pobladas buscando el marcador `_Vacío.` al inicio de cada sección.
3. Ejecuta `git rev-parse --abbrev-ref HEAD` para el branch.
4. Muestra al usuario el resumen con este formato exacto:

```
### Estado actual
- Fase: <contenido de STATE.md>
- Branch: <branch>

### Progreso del pipeline
[x/ ] Onboarding      — /start
[x/ ] UX/UI           — /design, /design-system, /ux-review
[x/ ] Arquitectura    — /arch, /architecture-decision, /pick-state-management
[x/ ] Backend         — /backend, /firestore-schema, /firestore-rules, /auth-setup, /functions-scaffold
[x/ ] Implementación  — /code, /feature-scaffold, /code-review
[x/ ] QA              — /qa, /widget-test, /integration-test
[x/ ] Auditoría       — /audit, /deps-audit, /security-audit
[x/ ] Deploy          — /deploy, /build-android, /build-ios, /ci-setup, /dns-setup, /release-checklist
[x/ ] Growth          — /growth, /aso, /admob, /app-ads-verify, /promo-video
```

Regla: marca `[x]` si la sección correspondiente de `PLAN.md` NO contiene `_Vacío.`; marca `[ ]` si la contiene.

5. Añade una recomendación en una sola línea con el siguiente comando sugerido (la primera sección vacía del pipeline).
6. Si `PLAN.md` tiene ítems en `## Decisiones pendientes` (algo más que el placeholder vacío), listarlos arriba de la recomendación con su `@<lead>` y priorizarlos.
7. Si el usuario pasó un argumento con un tema (`/help admob`, `/help testing`), en vez de todo lo anterior, muestra solo los comandos de ese dominio y una frase con cómo encaja en el pipeline.

## Qué NO hacer

- No ejecutes otros comandos automáticamente; solo sugiere.
- No toques `PLAN.md`, `STATE.md`, ni `production/`.
- No delegues a un subagente para esto; es barato y síncrono.
