---
paths:
  - "**/firestore.rules"
  - "**/storage.rules"
---

# Firestore / Storage Security Rules

- **Principio de mínimo privilegio**: `allow read, write: if false;` por defecto; habilita solo lo necesario.
- Todo acceso debe comprobar `request.auth != null` salvo recursos públicos documentados.
- Validación de formato y límites en cada `write` (tamaño de strings, tipos, rangos numéricos).
- Nunca confíes en el cliente: valida `resource.data` vs `request.resource.data` explícitamente.
- Separa reglas por colección con `match /coleccion/{doc}` y usa funciones auxiliares al inicio del bloque.
- Tests obligatorios: `@firebase/rules-unit-testing` + fixtures en `test/firestore_rules/`.
- Cada cambio en reglas requiere aprobación del `security-rules-specialist` y una línea en `PLAN.md > Backend > Reglas`.

## Template mínimo

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    function isAuth() { return request.auth != null; }
    function isOwner(uid) { return isAuth() && request.auth.uid == uid; }

    match /users/{uid} {
      allow read: if isOwner(uid);
      allow write: if isOwner(uid)
                   && request.resource.data.keys().hasOnly(['name', 'email', 'updatedAt']);
    }
  }
}
```

## Prohibiciones

- ❌ `allow read, write: if true;` — ni siquiera en desarrollo.
- ❌ Reglas sin timestamp en escritura (`request.time` o `request.resource.data.updatedAt`).
- ❌ Desplegar reglas sin correr `firebase emulators:exec --only firestore`.
