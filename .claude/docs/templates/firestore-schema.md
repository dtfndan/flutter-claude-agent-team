# Esquema de Firestore — [Nombre del Proyecto]

## Colecciones

### `users`
**Path**: `/users/{userId}`

| Campo | Tipo | Requerido | Default | Descripción |
|---|---|---|---|---|
| `uid` | `string` | ✅ | — | UID de Firebase Auth |
| `email` | `string` | ✅ | — | Email del usuario |
| `displayName` | `string` | ❌ | `""` | Nombre visible |
| `photoUrl` | `string` | ❌ | `null` | URL de avatar |
| `createdAt` | `timestamp` | ✅ | `serverTimestamp()` | Fecha de creación |
| `updatedAt` | `timestamp` | ✅ | `serverTimestamp()` | Última actualización |

**Sub-colecciones**:
- `/users/{userId}/settings` — Preferencias del usuario

---

### `[coleccion]`
**Path**: `/[coleccion]/{docId}`

| Campo | Tipo | Requerido | Default | Descripción |
|---|---|---|---|---|
| `[campo]` | `[tipo]` | ✅/❌ | `[default]` | [descripción] |

**Sub-colecciones**:
- [Si tiene]

---

## Relaciones

```
users (1) ──── (N) [coleccion]
  └── userId referencia
```

## Índices Compuestos

| Colección | Campos | Orden | Uso |
|---|---|---|---|
| `[col]` | `campo1` ASC, `campo2` DESC | Query | [Descripción del query] |

## Estrategia de Paginación

- **Método**: Cursor-based con `startAfter()`.
- **Page size**: [N] documentos.
- **Order by**: `[campo]` descending.

## Notas
- [Consideraciones de escalabilidad]
- [Decisiones de denormalización]
- [Límites conocidos]
