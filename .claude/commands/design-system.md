---
name: design-system
description: "Define el sistema de diseño del proyecto: colores, tipografía, espaciado, radios, sombras, componentes base y tema de Material 3."
---

# /design-system — Sistema de Diseño

Define los tokens y componentes base de diseño. Tu trabajo:

1. **Leer** `PLAN.md` sección `## UX/UI`.
2. **Delegar** al agente `ui-designer`
   (ver `.claude/agents/ui-designer.md`).
3. **Preguntar** al usuario:
   - ¿Tiene brand guidelines existentes? (logo, colores, tipografía).
   - ¿Modo oscuro? (solo claro / solo oscuro / ambos).
   - ¿Material 3 o diseño custom?
   - ¿Referentes de diseño? (apps que le gusten).
4. **Definir tokens**:
   - **Colores**: primario, secundario, terciario, error, superficie,
     fondo. Formato `ColorScheme` de Material 3.
   - **Tipografía**: familia(s), escalas (`TextTheme`), pesos.
   - **Espaciado**: escala (4, 8, 12, 16, 24, 32, 48...).
   - **Radios**: pequeño, mediano, grande.
   - **Elevación/Sombras**: niveles.
   - **Iconografía**: set de iconos elegido.
5. **Generar** código:
   - `lib/core/theme/app_theme.dart` → `ThemeData` light + dark.
   - `lib/core/theme/app_colors.dart` → constantes de color.
   - `lib/core/theme/app_text_styles.dart` → estilos de texto.
   - `lib/core/theme/app_spacing.dart` → constantes de espaciado.
6. **Al terminar**: Escribir tokens en `PLAN.md` sección `## UX/UI`.

## Protocolo

Mostrar la paleta y ejemplos como borrador. Código solo después de
aprobación del usuario.
