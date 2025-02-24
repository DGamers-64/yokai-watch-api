# Endpoints
- `/ykw2/`: Devuelve información sobre los endpoints posibles con YW2.
- `/ykw2/yokai/`: Devuelve una lista de todos los Yo-Kai registrados en YW2.
- `/ykw2/inventario/`: Devuelve una lista de los bolsillos del inventario navegables en YW2.
- `/ykw2/inventario/comida/`: Devuelve la lista de comidas que hay en YW2.
- `/ykw2/inventario/objeto/`: Devuelve la lista de objetos que hay en YW2.
- `/ykw2/inventario/equipamiento/`: Devuelve la lista de equipamiento que hay en YW2.

# URL Param
- `?lang=[(es),en]`: Cambia el idioma de los datos recibidos. (TODO)
- `?format=[(json),xml,html]`: Cambia el formato en que se reciben los datos. (TODO)
- `?offset=[(1),int]`: Cuando se devuelve una lista indica desde que indice (empezando por 1) se devolverá. Se puede combinar sin problema con `?limit`.
- `?limit=[(100),int]`: Cuando se devuelve una lista indica cuantos elementos devolverá. Se puede combinar sin problema con `?offset`.
- `?filter=[(1=1)]`: Sistema de filtros que intenta imitar al WHERE de MySql. Puedes usar varios parámetros separados con `&filter=`, declarando cuantos quieras. Puedes usar los operadores clásicos de `=`, `<`, `>`, `<=` y `>=`, además de `:` como REGEXP. En este último parámetro el valor a validar debe de estar encerrado entre `"`. Ejemplo: Si queremos obtener de un endpoint que devuelve varias tuplas, solamente aquellos cuyo nombre comienza por A y que además su id es menor que 10, debemos de escribir `?filter=nombre:"^A"&filter=id<10`.