if __name__ == "__main__":
    def retornar():
      return 15, 30
    print(retornar())

    # siempre se define como lambda si se desea hacer esto, esto es una función anonima de una sola linea , donde
    #lambda es la palabra reservada, duplicar, es el nombre de la función (que se asigna) x es el parametro, lo que está 
    #despues de los dos puntos es lo que hace la función
    
    duplicar = lambda x:x*2
    print(duplicar(15))