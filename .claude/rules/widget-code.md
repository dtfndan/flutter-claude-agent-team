---
paths:
  - "lib/features/**/presentation/**"
  - "lib/core/widgets/**"
---

# Presentation / Widgets Rules

- La capa `presentation/` NO contiene lógica de negocio. Solo UI, estado local y llamadas a controllers/notifiers.
- Los widgets consumen estado vía Riverpod/Bloc/Provider — nunca lo instancian manualmente en un `initState`.
- Todo widget complejo se compone de sub-widgets pequeños y `const` cuando sea posible.
- Usa `Semantics` y `Tooltip` para accesibilidad. Cumple WCAG AA de contraste.
- Strings visibles al usuario pasan por i18n (`AppLocalizations`) — nunca hard-coded.
- Respeta el tema (light/dark): jamás `Colors.red` crudo; usa tokens del theme.
- Maneja **siempre** los estados: cargando, vacío, error, datos. Jamás pantalla en blanco.
- Tests: cada pantalla principal tiene al menos un `widget_test` que cubre los 4 estados.

## Prohibiciones

- ❌ Llamadas directas a `FirebaseFirestore.instance`, `FirebaseAuth.instance`, `http.get` desde un widget.
- ❌ Persistencia directa en `SharedPreferences` desde la UI.
- ❌ `setState` dentro de `build`.
- ❌ `MediaQuery.of(context).size` para layouts que deberían usar `LayoutBuilder`.
