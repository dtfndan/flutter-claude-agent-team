---
name: aso
description: "Optimización de App Store (ASO). Redacta fichas optimizadas para Google Play y App Store con keywords, screenshots y categorización."
---

# /aso — App Store Optimization

Optimiza la presencia en tiendas. Tu trabajo:

1. **Leer** `PLAN.md` sección `## Growth`.
2. **Delegar** al agente `aso-lead`.
3. **Preguntar** al usuario:
   - Nombre de la app y propuesta de valor.
   - Competidores directos (para análisis de keywords).
   - Idiomas objetivo.
   - Categoría en Google Play / App Store.
4. **Producir** usando la plantilla
   `.claude/docs/templates/aso-listing.md`:

   ### Google Play
   - Título (≤50 chars) con keyword principal.
   - Descripción corta (≤80 chars).
   - Descripción larga (≤4000 chars) con keywords naturales.
   - Tags / categorías.
   - Guía de screenshots (tamaños, contenido sugerido por pantalla).

   ### App Store
   - Nombre (≤30 chars).
   - Subtítulo (≤30 chars).
   - Keywords (≤100 chars, separadas por coma).
   - Descripción.
   - Texto promocional (≤170 chars).
   - Guía de screenshots.

5. **Análisis competitivo** (si el usuario comparte competidores):
   - Keywords que usan.
   - Rating promedio y quejas comunes.
   - Oportunidades de diferenciación.
6. **Al terminar**: Escribir en `PLAN.md` sección `## Growth`.

## Protocolo

Todo el contenido ASO es borrador hasta aprobación del usuario.
Adaptar tono al público objetivo.
