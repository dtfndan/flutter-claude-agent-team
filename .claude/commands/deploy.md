---
name: deploy
description: "Agente DevOps. Prepara builds de producción (APK/AAB/IPA), ofuscación, firma, y apuntamiento DNS. Punto de entrada para todo lo relacionado con release."
---

# /deploy — DevOps & Release

Fase de deployment. Tu trabajo:

1. **Leer** `PLAN.md` (todas las secciones) y `STATE.md`.
2. **Verificar prerrequisitos**:
   - QA completado (tests pasan, analyze limpio).
   - Versión en `pubspec.yaml` actualizada.
   - Changelog/release notes preparados.
3. **Delegar** al agente `devops-lead`
   (ver `.claude/agents/devops-lead.md`). Sub-delegar:
   - `ci-cd-specialist` → pipelines de CI/CD.
   - `signing-specialist` → keystores, certificados, provisioning profiles.
   - `dns-specialist` → configuración DNS, apuntamiento de dominio.
   - `release-manager` → checklist completo de release.
4. **Preguntar** al usuario:
   - ¿Qué plataforma? (Android / iOS / ambas / web).
   - ¿Build de prueba o producción?
   - ¿Tiene las credenciales de firma configuradas?
5. **Guiar** al sub-comando apropiado:
   - `/build-android` → AAB/APK firmado.
   - `/build-ios` → IPA con certificados.
   - `/ci-setup` → GitHub Actions o Codemagic.
   - `/dns-setup` → dominio + hosting.
   - `/release-checklist` → validación final.
6. **Al terminar**:
   - Actualizar `PLAN.md` sección `## Deploy`.
   - Actualizar `STATE.md` → `Fase actual: Build(s) listo(s); listo para /growth`.

## Protocolo

Nunca hacer deploy a producción sin aprobación explícita. Verificar
que no haya secretos en el código antes de generar artefactos.
