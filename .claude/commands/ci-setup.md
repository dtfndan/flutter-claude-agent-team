---
name: ci-setup
description: "Configura pipelines de CI/CD con GitHub Actions o Codemagic. Automatiza build, test, analyze y deploy."
---

# /ci-setup — CI/CD

Configura integración y despliegue continuo. Tu trabajo:

1. **Leer** `PLAN.md` sección `## Deploy` y ADR de CI/CD si existe.
2. **Delegar** al agente `ci-cd-specialist`
   (ver `.claude/agents/ci-cd-specialist.md`).
3. **Preguntar** al usuario:
   - ¿GitHub Actions o Codemagic?
   - ¿Qué disparadores? (push a main, PRs, tags).
   - ¿Qué plataformas construir? (Android/iOS/Web).
   - ¿Deploy automático o solo build + test?
4. **Generar** configuración:
   - **GitHub Actions**:
     `.github/workflows/flutter-ci.yml` con jobs:
     - `analyze` → `flutter analyze`
     - `test` → `flutter test`
     - `build-android` → `flutter build appbundle`
     - `build-ios` (si macOS runner) → `flutter build ios`
   - **Codemagic**: `codemagic.yaml` equivalente.
5. **Aplicar reglas** de `.claude/rules/ci-cd.md`:
   - Secretos en GitHub Secrets / Codemagic env vars, nunca en YAML.
   - Matrices de versiones de Flutter.
   - Jobs mínimos necesarios.
   - Cache de pub dependencies.
6. **Al terminar**: Registrar en `PLAN.md` sección `## Deploy`.

## Protocolo

Mostrar YAML completo como borrador. Nunca incluir valores reales de
secretos — usar `${{ secrets.NOMBRE }}` siempre.
