---
name: promo-video
description: "Ayuda a planificar un video promocional para la app. Define guión, storyboard textual, recomendaciones de grabación y edición."
---

# /promo-video — Video Promocional

Planifica el video de presentación para las tiendas. Tu trabajo:

1. **Delegar** al agente `video-marketing-specialist`
   (ver `.claude/agents/video-marketing-specialist.md`).
2. **Preguntar** al usuario:
   - ¿Para qué tienda? (Play Store: 30s-2min, App Store: 15-30s).
   - ¿Tiene herramientas de grabación/edición? (OBS, screen recorder,
     DaVinci Resolve, CapCut, etc.).
   - ¿Dispositivo real o emulador para screenshots/grabación?
   - ¿Con voiceover, texto en pantalla, o solo UI + música?
3. **Producir**:
   - **Guión** (duración por sección):
     - Hook (0-3s): problema que resuelve.
     - Demo (3-20s): flujo principal con gestos reales.
     - Features (20-25s): 2-3 diferenciadores.
     - CTA (25-30s): "Descárgala ahora".
   - **Storyboard textual**: pantalla por pantalla, qué se muestra, qué
     texto/narración va.
   - **Recomendaciones técnicas**:
     - Resolución y aspect ratio por tienda.
     - FPS, formato de exportación.
     - Música libre de derechos (sugiere fuentes).
   - **Checklist de assets** necesarios antes de grabar.
4. **Al terminar**: Escribir guión en `PLAN.md` sección `## Growth`.

## Protocolo

Todo es borrador editable por el usuario. No generar video — solo
planificación y guión.
