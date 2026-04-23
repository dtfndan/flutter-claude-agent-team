---
paths:
  - ".github/workflows/**"
  - "codemagic.yaml"
  - ".gitlab-ci.yml"
---

# CI/CD Rules

- Pinning de versiones del runner y herramientas (`actions/checkout@v4`, `subosito/flutter-action@v2` con SHA o versión fija).
- Secrets via el provider (GitHub Secrets, Codemagic encrypted). Nunca en el YAML.
- Cache de `pub` y `gradle` explícito para builds rápidos.
- Jobs mínimos en el flujo principal: `analyze` → `test` → `build` → `deploy` (gated).
- El job `deploy` requiere aprobación manual o tag (`v*`).
- Matriz cuando haya valor (iOS + Android en paralelo). Evitar matrices que dupliquen tiempo sin beneficio.

## Prohibiciones

- ❌ `run: echo ${{ secrets.FOO }}` — nunca imprimas secrets.
- ❌ Subir APK/IPA firmados como artifact público.
- ❌ Deploys automáticos a producción sin revisión humana.
