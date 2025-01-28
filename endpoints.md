# Endpoints
- `/ykw2/`: Devuelve información sobre los endpoints posibles con YW2.
- `/ykw2/yokai/`: Devuelve una lista de todos los Yo-Kai registrados en YW2.
- `/ykw2/inventario/`: Devuelve una lista de los bolsillos del inventario navegables en YW2.
- `/ykw2/inventario/comida/`: Devuelve la lista de comidas que hay en YW2.
- `/ykw2/inventario/objeto/`: Devuelve la lista de objetos que hay en YW2.
- `/ykw2/inventario/equipamiento/`: Devuelve la lista de equipamiento que hay en YW2.

# URL Querys
- `?lang=[(es),en]`: Cambia el idioma de los datos recibidos. (TODO)
- `?format=[(json),xml,html]`: Cambia el formato en que se reciben los datos. (TODO)
- `?offset=[(1),int]`: Cuando se devuelve una lista indica desde que indice (empezando por 1) se devolverá. Se puede combinar sin problema con `?limit`.
- `?limit=[(100),int]`: Cuando se devuelve una lista indica cuantos elementos devolverá. Se puede combinar sin problema con `?offset`.