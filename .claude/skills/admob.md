---
name: admob
description: "Integración de Google AdMob. Configura banner, interstitial, rewarded ads, mediation y consent dialogs (UMP)."
---

# /admob — Google AdMob

Configura monetización con ads. Tu trabajo:

1. **Leer** `PLAN.md` secciones `## Growth` y `## Arquitectura`.
2. **Delegar** al agente `admob-specialist`
   (ver `.claude/agents/admob-specialist.md`).
3. **Verificar versiones** (Directriz Crítica):
   - Consultar pub.dev para la última versión de `google_mobile_ads`.
   - Asegurar compatibilidad con la versión de Flutter.
4. **Preguntar** al usuario:
   - ¿Tiene cuenta de AdMob activa?
   - ¿Qué formatos? (banner, interstitial, rewarded, native).
   - ¿Mediation? (unity, applovin, etc.).
   - ¿App ID y ad unit IDs disponibles?
5. **Implementar**:
   - Dependencia `google_mobile_ads` en `pubspec.yaml`.
   - Inicialización en `main.dart` o servicio dedicado.
   - `AndroidManifest.xml`: `com.google.android.gms.ads.APPLICATION_ID`.
   - `Info.plist`: `GADApplicationIdentifier`.
   - **UMP (User Messaging Platform)**: consent dialog para GDPR/CCPA.
   - Ad widgets encapsulados en `lib/core/ads/`.
   - IDs de test durante desarrollo, producción al publicar.
6. **Al terminar**: Registrar en `PLAN.md` sección `## Growth`.

## Protocolo

Usar IDs de test SIEMPRE durante desarrollo. Nunca hardcodear IDs de
producción en el código — usar config remota o env. Verificar que
consent se muestre antes de cargar ads.
