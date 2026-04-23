---
name: release-checklist
description: "Checklist completo de pre-lanzamiento. Valida builds, firma, metadata de tiendas, privacidad, app-ads.txt, analytics y más."
---

# /release-checklist — Checklist de Release

Validación final antes de publicar. Tu trabajo:

1. **Leer** `PLAN.md` completo y `STATE.md`.
2. **Delegar** al agente `release-manager`
   (ver `.claude/agents/release-manager.md`).
3. **Verificar** cada ítem:

   ### Build & Firma
   - [ ] `flutter analyze` → 0 errores
   - [ ] `flutter test` → todos pasan
   - [ ] AAB/APK firmado correctamente
   - [ ] IPA archivado y validado (si iOS)
   - [ ] Versión y build number incrementados
   - [ ] Ofuscación habilitada
   - [ ] Symbols guardados para crashlytics

   ### Seguridad
   - [ ] No hay secretos en el código (`validate-commit.sh`)
   - [ ] `firestore.rules` con mínimo privilegio
   - [ ] App Check habilitado
   - [ ] Rate limiting en Cloud Functions

   ### Tiendas
   - [ ] Screenshots preparados (todos los tamaños)
   - [ ] Descripción y keywords (ver `/aso`)
   - [ ] Política de privacidad URL
   - [ ] Clasificación de contenido completada

   ### Monetización
   - [ ] AdMob IDs de producción (no test)
   - [ ] `app-ads.txt` accesible en dominio raíz
   - [ ] Consent dialog (GDPR/CCPA) implementado

   ### Infraestructura
   - [ ] DNS configurado y propagado
   - [ ] Firebase en proyecto de producción (no dev)
   - [ ] Backups de Firestore configurados

4. **Reportar** ítems pendientes con prioridad.
5. **Al terminar**: Actualizar `STATE.md` → `Fase actual: Release checklist completo`.

## Protocolo

No aprobar release con ítems críticos pendientes. Ser exhaustivo.
