# Flujo UX — [Nombre del Flujo]

## Objetivo
[¿Qué logra el usuario al completar este flujo?]

## Persona
[¿Quién usa este flujo? Nivel de experiencia, contexto]

## Trigger
[¿Qué inicia este flujo? Tap en botón, deep link, notificación, etc.]

## Pantallas

### 1. [NombreScreen]
**Ruta**: `/ruta`
**Tipo**: [Modal | Push | Tab | Drawer]

**Contenido**:
- [Elemento 1: descripción]
- [Elemento 2: descripción]
- [CTA principal: acción]

**Estados**:
| Estado | Qué muestra |
|---|---|
| Loading | [Skeleton / Spinner / Shimmer] |
| Empty | [Ilustración + texto + CTA] |
| Error | [Mensaje + Retry] |
| Success | [Contenido normal] |

**Interacciones**:
- Tap [elemento] → navega a [pantalla]
- Swipe [dirección] → [acción]
- Long press [elemento] → [acción]

---

### 2. [NombreScreen]
**Ruta**: `/ruta`
(repetir estructura)

---

## Diagrama de flujo
```
[Pantalla 1] ──tap──► [Pantalla 2] ──submit──► [Pantalla 3]
                          │                         │
                        cancel                   success
                          │                         │
                          ▼                         ▼
                      [Volver]               [Pantalla final]
```

## Edge Cases
| Caso | Comportamiento |
|---|---|
| Sin conexión | [Qué pasa] |
| Sesión expirada | [Qué pasa] |
| Input inválido | [Qué pasa] |
| Permiso denegado | [Qué pasa] |

## Accesibilidad
- [ ] Contraste AA (≥4.5:1) en todos los textos
- [ ] Tamaños táctiles ≥ 44dp
- [ ] Semantics labels en elementos interactivos
- [ ] Orden de foco lógico
- [ ] Anuncios para screen reader en cambios de estado

## Métricas
- [Métrica 1: qué medir y por qué]
- [Métrica 2: qué medir y por qué]
