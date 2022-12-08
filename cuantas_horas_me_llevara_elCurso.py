def planificarCurso():
    # bienvenida de color celeste y negrita y cerrar el color
    print("\033[1;36m\n\nBienvenido al planificador de cursos\033[0m")
    # pedir el numero de horas del curso
    horasCurso = int(input("Horas del curso a la semana: "))
    horasCurso = horasCurso * 16
    # pedir el numero de horas que se puede estudiar al dia
    max_horas = int(input("Horas que se puede estudiar al dia: "))
    # cuantas sugerencias de cursos desea de color amarillo y negrita y cerrar el color
    sugerencias = int(input("\033[1;33mCuantas sugerencias desea?\033[0m "))
    # hacer las sugrencias de la cantidad de dias que le tomara el curso segun las horas que varian de n sugerencias
    dias = horasCurso // max_horas
    horas = horasCurso % max_horas
    # imprimir de color verde y negrita el nombre del curso y el numero de dias que le tomara el curso y cerrar el color
    print("\033[1;32m\n[*] Si estudias", max_horas, "horas al dia, te tomara", dias, "dias y", horas, "horas\033[0m")
    max_horas -= 1
    for i in range(sugerencias-1):
        # hacer la division de las horas del curso entre las horas que se puede estudiar al dia
        dias = horasCurso // max_horas
        # hacer la division de las horas del curso entre las horas que se puede estudiar al dia
        horas = horasCurso % max_horas
        # imprimir el nombre del curso y el numero de dias que le tomara el curso
        print("    Si estudias", max_horas, "horas al dia, te tomara", dias, "dias y", horas, "horas")
        # hacer que las horas que se puede estudiar al dia aumente en 1
        max_horas = max_horas - 1
planificarCurso()