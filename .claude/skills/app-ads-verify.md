---
name: app-ads-verify
description: "Verifica que app-ads.txt esté correctamente configurado y accesible en el dominio raíz. Valida sintaxis, publisher IDs y propagación."
---

# /app-ads-verify — Verificación app-ads.txt

Verifica la configuración de `app-ads.txt`. Tu trabajo:

1. **Delegar** al agente `app-ads-specialist`
   (ver `.claude/agents/app-ads-specialist.md`).
2. **Verificar** que el usuario tiene:
   - Dominio web configurado (ver `/dns-setup`).
   - Publisher ID de AdMob (formato: `pub-XXXXXXXXXXXXXXXX`).
3. **Generar** el archivo `app-ads.txt`:
   ```
   google.com, pub-XXXXXXXXXXXXXXXX, DIRECT, f08c47fec0942fa0
   ```
   (Reemplazar con el publisher ID real del usuario).
4. **Verificar accesibilidad**:
   - `curl https://<dominio>/app-ads.txt` → debe retornar 200.
   - Contenido debe ser texto plano, no HTML.
   - Sin BOM, sin caracteres extra.
5. **Verificar en tiendas**:
   - Google Play Console → Panel de monetización → estado de
     `app-ads.txt`.
   - Recordar que la propagación puede tardar 24-48 horas.
6. **Verificar mediation** (si aplica):
   - Agregar líneas para cada ad network mediada.
   - Formato: `<dominio>, <publisher-id>, <tipo>, <tag-id>`.
7. **Al terminar**: Registrar en `PLAN.md` sección `## Growth`.

## Protocolo

Confirmar publisher ID con el usuario antes de generar el archivo.
Nunca inventar IDs.
