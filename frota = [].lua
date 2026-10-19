frota = []


def normalizar(texto):
    texto = texto.strip().lower()
    return texto


def ler_ano():
    while True:
        try:
            ano = int(input("Ano do caminhão: "))

            if ano < 0:
                print("Digite um ano válido.")
            else:
                return ano

        except ValueError:
            print("Digite apenas números para o ano.")


def normalizar_estado(estado):
    estado = normalizar(estado)

    if estado == "sao paulo" or estado == "sp":
        return "SP"
    elif estado == "parana" or estado == "pr":
        return "PR"
    elif estado == "minas gerais" or estado == "mg":
        return "MG"
    elif estado == "rio de janeiro" or estado == "rj":
        return "RJ"
    elif estado == "santa catarina" or estado == "sc":
        return "SC"
    elif estado == "rio grande do sul" or estado == "rs":
        return "RS"
    elif estado == "bahia" or estado == "ba":
        return "BA"
    elif estado == "goias" or estado == "go":
        return "GO"
    else:
        return estado.upper()


def cadastrar_caminhao():
    print()
    print("CADASTRAR CAMINHÃO")

    placa = input("Digite a placa: ")
    modelo = input("Digite o modelo: ")
    motorista = input("Digite o motorista: ")
    cidade = input("Digite a cidade: ")
    estado = input("Digite o estado: ")
    carga = input("Qual o tipo de carga: ")
    ano = ler_ano()

    placa = placa.strip().upper()
    modelo = modelo.strip()
    motorista = motorista.strip()
    cidade = cidade.strip()
    estado = normalizar_estado(estado)
    carga = carga.strip()

    placa_existe = False

    for caminhao in frota:
        if caminhao["placa"] == placa:
            placa_existe = True
            break

    if placa_existe:
        print()
        print("Essa placa já está cadastrada.")
        return

    caminhao = {
        "placa": placa,
        "modelo": modelo,
        "motorista": motorista,
        "cidade": cidade,
        "estado": estado,
        "carga": carga,
        "ano": ano
    }

    frota.append(caminhao)

    print()
    print("Caminhão cadastrado com sucesso!")


def listar_caminhoes():
    print()
    print("LISTA DE CAMINHÕES")

    if len(frota) == 0:
        print("Nenhum caminhão cadastrado.")
        return

    for numero in range(len(frota)):
        caminhao = frota[numero]

        print()
        print("Caminhão", numero + 1)
        print("Placa:", caminhao["placa"])
        print("Modelo:", caminhao["modelo"])
        print("Motorista:", caminhao["motorista"])
        print("Cidade:", caminhao["cidade"])
        print("Estado:", caminhao["estado"])
        print("Carga:", caminhao["carga"])
        print("Ano:", caminhao["ano"])


def procurar_placa():
    print()
    print("PESQUISAR PLACA")

    placa = input("Digite a placa: ")
    placa = placa.strip().upper()

    encontrou = False

    for caminhao in frota:
        if caminhao["placa"] == placa:
            print()
            print("Caminhão encontrado!")
            print("Placa:", caminhao["placa"])
            print("Modelo:", caminhao["modelo"])
            print("Motorista:", caminhao["motorista"])
            print("Cidade:", caminhao["cidade"])
            print("Estado:", caminhao["estado"])
            print("Carga:", caminhao["carga"])
            print("Ano:", caminhao["ano"])

            encontrou = True
            break

    if not encontrou:
        print("Nenhum caminhão encontrado.")


def procurar_motorista():
    print()
    print("PESQUISAR MOTORISTA")

    motorista = input("Digite o nome do motorista: ")
    motorista = normalizar(motorista)

    encontrou = False

    for caminhao in frota:
        if normalizar(caminhao["motorista"]) == motorista:
            print()
            print("Caminhão encontrado!")
            print("Placa:", caminhao["placa"])
            print("Modelo:", caminhao["modelo"])
            print("Motorista:", caminhao["motorista"])
            print("Cidade:", caminhao["cidade"])
            print("Estado:", caminhao["estado"])
            print("Carga:", caminhao["carga"])
            print("Ano:", caminhao["ano"])

            encontrou = True

    if not encontrou:
        print("Nenhum caminhão encontrado para esse motorista.")


def procurar_cidade():
    print()
    print("PESQUISAR CIDADE")

    cidade = input("Digite o nome da cidade: ")
    cidade = normalizar(cidade)

    encontrou = False

    for caminhao in frota:
        if normalizar(caminhao["cidade"]) == cidade:
            print()
            print("Caminhão encontrado!")
            print("Placa:", caminhao["placa"])
            print("Modelo:", caminhao["modelo"])
            print("Motorista:", caminhao["motorista"])
            print("Cidade:", caminhao["cidade"])
            print("Estado:", caminhao["estado"])
            print("Carga:", caminhao["carga"])
            print("Ano:", caminhao["ano"])

            encontrou = True

    if not encontrou:
        print("Nenhum caminhão encontrado nessa cidade.")


def procurar_estado():
    print()
    print("PESQUISAR ESTADO")

    estado = input("Digite o estado: ")
    estado = normalizar_estado(estado)

    encontrou = False

    for caminhao in frota:
        if caminhao["estado"] == estado:
            print()
            print("Caminhão encontrado!")
            print("Placa:", caminhao["placa"])
            print("Modelo:", caminhao["modelo"])
            print("Motorista:", caminhao["motorista"])
            print("Cidade:", caminhao["cidade"])
            print("Estado:", caminhao["estado"])
            print("Carga:", caminhao["carga"])
            print("Ano:", caminhao["ano"])

            encontrou = True

    if not encontrou:
        print("Nenhum caminhão encontrado nesse estado.")


def procurar_carga():
    print()
    print("PESQUISAR CARGA")

    carga = input("Digite o tipo de carga: ")
    carga = normalizar(carga)

    encontrou = False

    for caminhao in frota:
        if normalizar(caminhao["carga"]) == carga:
            print()
            print("Caminhão encontrado!")
            print("Placa:", caminhao["placa"])
            print("Modelo:", caminhao["modelo"])
            print("Motorista:", caminhao["motorista"])
            print("Cidade:", caminhao["cidade"])
            print("Estado:", caminhao["estado"])
            print("Carga:", caminhao["carga"])
            print("Ano:", caminhao["ano"])

            encontrou = True

    if not encontrou:
        print("Nenhum caminhão encontrado com essa carga.")


def alterar_caminhao():
    print()
    print("ALTERAR CAMINHÃO")

    placa = input("Digite a placa do caminhão: ")
    placa = placa.strip().upper()

    caminhao_encontrado = None

    for caminhao in frota:
        if caminhao["placa"] == placa:
            caminhao_encontrado = caminhao
            break

    if caminhao_encontrado is None:
        print("Nenhum caminhão encontrado.")
        return

    print()
    print("Caminhão encontrado!")
    print("Deixe o campo vazio para não alterar.")

    novo_modelo = input("Novo modelo: ")
    novo_motorista = input("Novo motorista: ")
    nova_cidade = input("Nova cidade: ")
    novo_estado = input("Novo estado: ")
    nova_carga = input("Nova carga: ")
    novo_ano = input("Novo ano: ")

    if novo_modelo != "":
        caminhao_encontrado["modelo"] = novo_modelo.strip()

    if novo_motorista != "":
        caminhao_encontrado["motorista"] = novo_motorista.strip()

    if nova_cidade != "":
        caminhao_encontrado["cidade"] = nova_cidade.strip()

    if novo_estado != "":
        caminhao_encontrado["estado"] = normalizar_estado(novo_estado)

    if nova_carga != "":
        caminhao_encontrado["carga"] = nova_carga.strip()

    if novo_ano != "":
        try:
            novo_ano = int(novo_ano)

            if novo_ano > 0:
                caminhao_encontrado["ano"] = novo_ano
            else:
                print("Digite um ano válido.")

        except ValueError:
            print("Digite apenas números para o ano!")

    print()
    print("Caminhão alterado com sucesso!")


def remover_caminhao():
    print()
    print("REMOVER CAMINHÃO")

    placa = input("Digite a placa do caminhão: ")
    placa = placa.strip().upper()

    caminhao_encontrado = None

    for caminhao in frota:
        if caminhao["placa"] == placa:
            caminhao_encontrado = caminhao
            break

    if caminhao_encontrado is None:
        print("Nenhum caminhão encontrado.")
        return

    print()
    print("Caminhão encontrado!")
    print("Placa:", caminhao_encontrado["placa"])
    print("Modelo:", caminhao_encontrado["modelo"])
    print("Motorista:", caminhao_encontrado["motorista"])
    print("Cidade:", caminhao_encontrado["cidade"])
    print("Estado:", caminhao_encontrado["estado"])

    confirmacao = input("Deseja realmente remover? (S/N): ")
    confirmacao = confirmacao.strip().upper()

    if confirmacao == "S":
        frota.remove(caminhao_encontrado)
        print("Caminhão removido com sucesso!")

    elif confirmacao == "N":
        print("Remoção cancelada.")

    else:
        print("Opção inválida. O caminhão não foi removido.")


def estatisticas():
    print()
    print("ESTATÍSTICAS DA FROTA")

    if len(frota) == 0:
        print("Nenhum caminhão cadastrado.")
        return

    total = len(frota)
    quantidade_sp = 0
    quantidade_pr = 0
    quantidade_mg = 0
    quantidade_rj = 0
    outros = 0

    for caminhao in frota:
        estado = caminhao["estado"]

        if estado == "SP":
            quantidade_sp += 1

        elif estado == "PR":
            quantidade_pr += 1

        elif estado == "MG":
            quantidade_mg += 1

        elif estado == "RJ":
            quantidade_rj += 1

        else:
            outros += 1

    print("Total de caminhões:", total)
    print("Caminhões de SP:", quantidade_sp)
    print("Caminhões de PR:", quantidade_pr)
    print("Caminhões de MG:", quantidade_mg)
    print("Caminhões de RJ:", quantidade_rj)
    print("Caminhões de outros estados:", outros)


while True:
    print()
    print("================================")
    print("       SISTEMA DE FROTA")
    print("================================")
    print("1 - Cadastrar caminhão")
    print("2 - Listar caminhões")
    print("3 - Pesquisar por placa")
    print("4 - Pesquisar por motorista")
    print("5 - Pesquisar por cidade")
    print("6 - Pesquisar por estado")
    print("7 - Pesquisar por carga")
    print("8 - Alterar caminhão")
    print("9 - Remover caminhão")
    print("10 - Estatísticas")
    print("0 - Sair")
    print()

    opcao = input("Escolha uma opção: ")

    if opcao == "1":
        cadastrar_caminhao()

    elif opcao == "2":
        listar_caminhoes()

    elif opcao == "3":
        procurar_placa()

    elif opcao == "4":
        procurar_motorista()

    elif opcao == "5":
        procurar_cidade()

    elif opcao == "6":
        procurar_estado()

    elif opcao == "7":
        procurar_carga()

    elif opcao == "8":
        alterar_caminhao()

    elif opcao == "9":
        remover_caminhao()

    elif opcao == "10":
        estatisticas()

    elif opcao == "0":
        print("Programa encerrado.")
        break

    else:
        print("Opção inválida.")