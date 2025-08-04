algoritmo "AutoFacil_Sales_System"

var
    modeloCarro: vetor[1..100] de caractere
    anoCarro: vetor[1..100] de inteiro
    precoCarro: vetor[1..100] de real
    estoqueCarro: vetor[1..100] de inteiro
    totalCarros: inteiro

    nomeCliente: caractere
    cpfCliente: caractere
    emailCliente: caractere

    compraModelo: vetor[1..100] de caractere
    compraPreco: vetor[1..100] de real
    compradorNome: vetor[1..100] de caractere
    compradorCPF: vetor[1..100] de caractere
    totalCompras: inteiro

    anoAtual: inteiro
    opcao: inteiro
    i: inteiro

procedimento registerCar()
var
    modelo: caractere
    ano: inteiro
    preco: real
    qtdEstoque: inteiro
inicio
    escreval("\n== Cadastro de Veículo ==")
    escreva("Modelo: ")
    leia(modelo)

    repita
        escreva("Ano de fabricação (1990 a ", anoAtual, "): ")
        leia(ano)
    ate (ano >= 1990) e (ano <= anoAtual)

    repita
        escreva("Preço (mínimo R$10.000): R$ ")
        leia(preco)
    ate preco >= 10000

    repita
        escreva("Quantidade em estoque: ")
        leia(qtdEstoque)
    ate qtdEstoque >= 0

    totalCarros <- totalCarros + 1
    modeloCarro[totalCarros] <- modelo
    anoCarro[totalCarros] <- ano
    precoCarro[totalCarros] <- preco
    estoqueCarro[totalCarros] <- qtdEstoque

    escreval("Veículo cadastrado com sucesso.\n")
fimprocedimento

procedimento registerClient()
var
    tamCPF: inteiro
inicio
    escreval("\n== Cadastro de Cliente ==")
    escreva("Nome completo: ")
    leia(nomeCliente)

    repita
        escreva("CPF (11 dígitos): ")
        leia(cpfCliente)
        tamCPF <- compr(cpfCliente)
    ate tamCPF = 11

    repita
        escreva("E-mail: ")
        leia(emailCliente)
    ate pos("@", emailCliente) > 0

    escreval("Cliente cadastrado com sucesso.\n")
fimprocedimento

procedimento registrarCompra()
var
    modeloBusca: caractere
    encontrado: booleano
inicio
    escreval("\n== Registro de Compra ==")

    se totalCarros = 0 entao
        escreval("Nenhum carro disponível.\n")
        retorne
    fimse

    escreva("Modelo desejado: ")
    leia(modeloBusca)

    encontrado <- falso
    para i de 1 ate totalCarros faca
        se modeloCarro[i] = modeloBusca entao
            se estoqueCarro[i] > 0 entao
                encontrado <- verdadeiro
                escreval("Modelo: ", modeloCarro[i], " - R$ ", precoCarro[i])
                estoqueCarro[i] <- estoqueCarro[i] - 1

                totalCompras <- totalCompras + 1
                compraModelo[totalCompras] <- modeloCarro[i]
                compraPreco[totalCompras] <- precoCarro[i]
                compradorNome[totalCompras] <- nomeCliente
                compradorCPF[totalCompras] <- cpfCliente

                escreval("Compra registrada com sucesso.\n")
            senao
                escreval("Estoque indisponível.\n")
            fimse
            pare
        fimse
    fimpara

    se nao encontrado entao
        escreval("Modelo não encontrado.\n")
    fimse
fimprocedimento

procedimento gerarRelatorio()
var
    i: inteiro
    totalVendas: real
inicio
    escreval("\n== Relatório de Compras ==")

    se totalCompras = 0 entao
        escreval("Nenhuma compra realizada.\n")
        retorne
    fimse

    totalVendas <- 0
    para i de 1 ate totalCompras faca
        escreval("Cliente: ", compradorNome[i])
        escreval("CPF: ", compradorCPF[i])
        escreval("Modelo: ", compraModelo[i])
        escreval("Valor: R$ ", compraPreco[i]:2:2)
        escreval("-----------------------------")
        totalVendas <- totalVendas + compraPreco[i]
    fimpara

    escreval("Total de vendas: ", totalCompras)
    escreval("Valor total: R$ ", totalVendas:2:2, "\n")
fimprocedimento

inicio
    totalCarros <- 0
    totalCompras <- 0
    anoAtual <- 2025

    repita
        escreval("\n  AFSS - AutoFácil Sales System")
        escreval("1 - Cadastrar Carro")
        escreval("2 - Cadastrar Cliente")
        escreval("3 - Registrar Compra")
        escreval("4 - Relatório Final")
        escreval("5 - Sair")
        escreva("Opção: ")
        leia(opcao)

        escolha opcao
            caso 1
                registerCar()
            caso 2
                registerClient()
            caso 3
                registrarCompra()
            caso 4
                gerarRelatorio()
            caso 5
                escreval("\nSistema encerrado. Obrigado por utilizar o AFSS.")
            outrocaso
                escreval("Opção inválida.\n")
        fimescolha
    ate opcao = 5
fimalgoritmo
