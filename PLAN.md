# PLAN.md — Estado vivo del proyecto

> Documento de coordinación entre agentes. Cada lead escribe **solo** en su
> sección. Conflictos cross-dominio se registran en `## Decisiones pendientes`
> con `@lead-objetivo`. Ver `.claude/docs/coordination-rules.md`.

---

## UX/UI
<!-- Responsable: ux-lead (delega a ui-designer, accessibility-specialist) -->

_Vacío. Ejecuta `/design` para empezar._

### Flujos de usuario
<!-- Lista de flujos: login, onboarding, feature principal, etc. -->

### Mapa de pantallas
<!-- Árbol de rutas/pantallas -->

### Estados por pantalla
<!-- loading / error / empty / success -->

### Design tokens
<!-- Colores, tipografía, espaciado, radios, sombras (ver design-system.md) -->

### Accesibilidad
<!-- Contraste, tamaños táctiles, TalkBack/VoiceOver, navegación teclado -->

---

## Arquitectura
<!-- Responsable: software-architect (delega a state-management-specialist) -->

_Vacío. Ejecuta `/arch` o `/pick-state-management` para empezar._

### Stack elegido
<!-- Flutter vX.Y.Z stable, Dart vX.Y.Z, Riverpod/Bloc (ADR-001), etc. -->

### Estructura de capas
<!-- domain/data/presentation, dependencias permitidas -->

### Paquetes transversales
<!-- Paquetes usados por >1 feature con su versión -->

### ADRs
<!-- Referencias a docs/adr/adr-XXX-*.md -->

---

## Backend
<!-- Responsable: firebase-lead (delega a firestore/auth/storage/functions/rules specialists) -->

_Vacío. Ejecuta `/backend` para empezar._

### Esquema Firestore
<!-- Colecciones, subcolecciones, campos clave, índices -->

### Reglas Firestore + Storage
<!-- Resumen; detalle en firestore.rules / storage.rules -->

### Auth
<!-- Providers activos, políticas de reautenticación -->

### Cloud Functions
<!-- Triggers, callables, scheduled, HTTPS; secretos usados -->

### App Check
<!-- Play Integrity + DeviceCheck/App Attest, debug tokens -->

---

## Implementación
<!-- Responsable: flutter-dev-lead (delega a feature-developer, platform-specialist) -->

_Vacío. Ejecuta `/code` o `/feature-scaffold` para empezar._

### Features completadas
<!-- Lista de lib/features/<nombre> con estado (done / in-progress / blocked) -->

### Features en curso
<!-- Con responsable y bloqueos -->

### Deuda técnica conocida
<!-- TODOs/FIXMEs que deben atenderse antes de release -->

---

## QA
<!-- Responsable: qa-lead (delega a test-specialist, bug-hunter) -->

_Vacío. Ejecuta `/qa` para empezar._

### Cobertura actual
<!-- Por capa: domain / data / presentation -->

### Tests de integración
<!-- Flujos E2E implementados -->

### Bugs abiertos
<!-- ID, severidad, descripción corta, responsable -->

---

## Auditoría
<!-- Responsable: auditor (delega a code-auditor, security-auditor, dependency-auditor) -->

_Vacío. Ejecuta `/audit` antes de cada release._

### Última auditoría
<!-- Fecha, auditor, resumen de findings -->

### Dependencias a actualizar
<!-- Ver /deps-audit -->

### Violaciones de arquitectura
<!-- Lista con ubicación y plan de remediación -->

---

## Deploy
<!-- Responsable: devops-lead (delega a ci-cd/signing/dns/release specialists) -->

_Vacío. Ejecuta `/deploy` o `/ci-setup` para empezar._

### CI/CD
<!-- Plataforma (GitHub Actions / Codemagic), jobs activos, ADR-002 -->

### Firma
<!-- Android: Play App Signing + upload key | iOS: Automatic / match -->

### Dominio + DNS
<!-- Dominio, hosting, registros activos, estado de propagación -->

### Últimos builds
<!-- versionCode/versionName, fecha, canal (internal/beta/production) -->

---

## Growth
<!-- Responsable: aso-lead (delega a admob, app-ads, video-marketing specialists) -->

_Vacío. Ejecuta `/growth` o `/aso` para empezar._

### Ficha de tienda
<!-- Play Store + App Store: título, short/long description, keywords -->

### AdMob
<!-- App IDs, unidades, mediación, UMP -->

### app-ads.txt
<!-- Dominio raíz, última verificación -->

### Video marketing
<!-- Store preview, trailer, vertical para redes -->

---

## Decisiones pendientes
<!-- Responsable: orquestador (árbitro). Cualquier lead puede abrir ítems aquí. -->

_Vacío. Abrir ítem con formato:_

```
### [FECHA] @<lead-destino> — <título corto>
- Contexto: ...
- Opciones: ...
- Bloquea a: ...
- Deadline: ...
```
