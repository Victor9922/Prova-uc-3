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
    escreva("Informe o modelo do carro: ")
    leia(modelo)

    repita
        escreva("Informe o ano de fabricação (1990 até ", anoAtual, "): ")
        leia(ano)
        se (ano < 1990) ou (ano > anoAtual) entao
            escreval("Ano inválido. Por favor, informe um ano entre 1990 e ", anoAtual, ".")
        fimse
    ate (ano >= 1990) e (ano <= anoAtual)

    repita
        escreva("Informe o preço do carro (mínimo R$10.000): R$ ")
        leia(preco)
        se preco < 10000 entao
            escreval("Preço inválido. O valor deve ser igual ou superior a R$10.000.")
        fimse
    ate preco >= 10000

    repita
        escreva("Informe a quantidade disponível em estoque: ")
        leia(qtdEstoque)
        se qtdEstoque < 0 entao
            escreval("Quantidade inválida. O estoque não pode ser negativo.")
        fimse
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
    escreva("Informe o nome completo: ")
    leia(nomeCliente)

    repita
        escreva("Informe o CPF (somente números, 11 dígitos): ")
        leia(cpfCliente)
        tamCPF <- compr(cpfCliente)
        se tamCPF <> 11 entao
            escreval("CPF inválido. Deve conter exatamente 11 dígitos.")
        fimse
    ate tamCPF = 11

    repita
        escreva("Informe o e-mail: ")
        leia(emailCliente)
        se pos("@", emailCliente) = 0 entao
            escreval("E-mail inválido. O e-mail deve conter '@'.")
        fimse
    ate pos("@", emailCliente) > 0

    escreval("Cliente cadastrado com sucesso.\n")
fimprocedimento


inicio
    totalCarros <- 0
    anoAtual <- 2025

    repita

        escreval("  AFSS - AutoFácil Sales System")
        escreval("1 - Cadastrar Carro")
        escreval("2 - Cadastrar Cliente")
        escreval("3 - Sair do Sistema")

        escreva("Escolha uma opção: ")
        leia(opcao)

        escolha opcao
            caso 1
                registerCar()
            caso 2
                registerClient()
            caso 3
                escreval("\nEncerrando o sistema. Obrigado por utilizar o AFSS.")
            outrocaso
                escreval("Opção inválida. Por favor, tente novamente.\n")
        fimescolha
    ate opcao = 3
fimalgoritmo
