---
name: dns-setup
description: "Configura dominio, DNS y hosting. Necesario para app-ads.txt, enlaces universales y web hosting."
---

# /dns-setup — Configuración DNS

Configura dominio y DNS. Tu trabajo:

1. **Leer** `PLAN.md` secciones `## Deploy` y `## Growth`.
2. **Delegar** al agente `dns-specialist`
   (ver `.claude/agents/dns-specialist.md`).
3. **Preguntar** al usuario:
   - ¿Tiene dominio propio? ¿Cuál?
   - ¿Proveedor de DNS? (Cloudflare, Google Domains, Namecheap, etc.)
   - ¿Necesita hosting web? (para `app-ads.txt`, landing, deep links).
   - ¿Firebase Hosting o proveedor externo?
4. **Guiar configuración**:
   - **Firebase Hosting**: `firebase init hosting`, configurar `firebase.json`.
   - **Dominio personalizado**: registros DNS (A, CNAME, TXT para verificación).
   - **SSL**: verificar que esté activo (Let's Encrypt / Cloudflare).
   - **app-ads.txt**: hospedar en la raíz del dominio (`https://dominio.com/app-ads.txt`).
   - **Deep Links / Universal Links**:
     - Android: `assetlinks.json` en `/.well-known/`.
     - iOS: `apple-app-site-association` en `/.well-known/`.
5. **Verificar**: que el dominio resuelve correctamente y HTTPS funciona.
6. **Al terminar**: Registrar en `PLAN.md` sección `## Deploy`.

## Protocolo

Nunca modificar registros DNS sin aprobación explícita. Mostrar los
registros que se deben crear antes de cualquier acción.
