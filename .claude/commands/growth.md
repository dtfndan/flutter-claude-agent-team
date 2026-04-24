---
name: growth
description: "Agente Growth & ASO. Optimiza fichas de tiendas, verifica integración de AdMob, app-ads.txt y ayuda con materiales de marketing."
---

# /growth — Growth & ASO

Fase de crecimiento y monetización. Tu trabajo:

1. **Leer** `PLAN.md` (todas las secciones) y `STATE.md`.
2. **Delegar** al agente `aso-lead` (ver `.claude/agents/aso-lead.md`).
   Sub-delegar:
   - `admob-specialist` → integración de ads, mediation, formatos.
   - `app-ads-specialist` → `app-ads.txt` en dominio y verificación.
   - `video-marketing-specialist` → guión y assets para video promocional.
3. **Guiar** al sub-comando apropiado:
   - `/aso` → optimización de ficha en tiendas.
   - `/admob` → configuración de AdMob.
   - `/app-ads-verify` → verificar `app-ads.txt`.
   - `/promo-video` → preparar video promocional.
4. **Preguntar** al usuario:
   - ¿Modelo de monetización? (freemium, ads, suscripción, compras in-app).
   - ¿Mercados objetivo? (idiomas, regiones).
   - ¿Dominio web configurado? (necesario para `app-ads.txt`).
5. **Al terminar**:
   - Actualizar `PLAN.md` sección `## Growth`.
   - Actualizar `STATE.md` → `Fase actual: Growth configurado; app lista para publicar`.

## Protocolo

No publicar en tiendas sin aprobación explícita. Verificar compliance
(GDPR, COPPA, CCPA) antes de habilitar ads o analytics.
