import os

def generarYokai():
    texto = "("
    texto += '"' + input(" Nombre > ") + '",'
    texto += 'CONCAT(@linkMedalla,"' + input(" Número > ") + '",@png),'
    texto += '"' + input(" Tribu > ") + '",'
    texto += '"' + input(" Rango > ") + '",'
    texto += '"' + input(" Bio > ") + '",'
    texto += '"' + input(" Habilidad > ") + '",'
    texto += '"' + input(" Ataque > ") + '",'
    texto += '"' + input(" Técnica > ") + '",'
    texto += '"' + input(" Animáximum > ") + '",'
    texto += '"' + input(" Espiritación > ") + '",'
    texto += '"' + input(" Comida favorita > ") + '",'
    texto += '"' + input(" Comida odiada > ") + '",'
    texto += '"' + input(" Blasters > ") + '",'
    texto += '"' + input(" Drop común > ") + '",'
    texto += input(" Prob común > ")
    texto += '"' + input(" Drop raro > ") + '",'
    texto += input(" Prob raro > ")
    texto += input(" Dinero > ")
    texto += input(" Experiencia > ")
    texto += input(" Huecos objetos > ")
    texto += input(" Fuego > ") + ','
    texto += input(" Hielo > ") + ','
    texto += input(" Tierra > ") + ','
    texto += input(" Rayo > ") + ','
    texto += input(" Agua > ") + ','
    texto += input(" Viento > ")
    texto += "),\n"
    with open(os.path.join(os.path.dirname(__file__), 'creador-yokai-2.txt'),'a',encoding='utf-8') as f:
        f.write(texto)

respuesta = "s"
while respuesta == "s":
    print("------------------------------------------------")
    print(" INSERTANDO NUEVO YO-KAI...")
    print("------------------------------------------------")
    generarYokai()
    print("------------------------------------------------")
    respuesta = input(" ¿Seguimos? (s/n) > ")
print("------------------------------------------------")
print(" SCRIPT FINALIZADO CON ÉXITO")