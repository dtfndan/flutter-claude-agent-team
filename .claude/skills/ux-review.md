---
name: ux-review
description: "Revisa la experiencia de usuario de pantallas existentes. Evalúa flujos, estados, accesibilidad, consistencia y usabilidad."
---

# /ux-review — Revisión UX

Revisa UX de pantallas implementadas. Tu trabajo:

1. **Leer** `PLAN.md` sección `## UX/UI` (flujos originales).
2. **Delegar** al agente `ux-lead` y sub-delegar a
   `accessibility-specialist`.
3. **Preguntar** al usuario:
   - ¿Qué pantallas/flujos revisar?
   - ¿Hay feedback de usuarios reales?
4. **Evaluar** contra criterios:
   - **Flujo**: ¿el usuario llega al objetivo en ≤3 pasos?
   - **Estados**: ¿tiene loading, empty, error, success?
   - **Feedback visual**: ¿botones responden al tap? ¿hay indicadores
     de progreso?
   - **Consistencia**: ¿usa los tokens del design system? ¿navegación
     coherente?
   - **Accesibilidad**:
     - Contraste ≥ 4.5:1 (AA).
     - Tamaños táctiles ≥ 44dp.
     - Semantics labels para screen readers.
     - Navegación por teclado/switch.
   - **Responsive**: ¿funciona en tablet, pantalla pequeña?
   - **Performance percibida**: ¿transiciones suaves? ¿sin jank?
5. **Producir** reporte con recomendaciones priorizadas.
6. **Al terminar**: Registrar en `PLAN.md` sección `## UX/UI`.

## Protocolo

Solo revisión y recomendaciones. Para aplicar cambios, usar `/code`.
