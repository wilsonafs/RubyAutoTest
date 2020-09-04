#language: pt

@testes_operacao
Funcionalidade: Cadastro de operações

Contexto: Fazer login
    Dado que o usuário acessa a área de login da plataforma 
    Quando preencher o "login" e "senha" com dados "válidos"
    Então o login será realizado com sucesso 

@cadastro_operacao
Cenario: Incluir operação de compra
    Dado que estou na área de operações 
    Quando que eu tenho a operação de compra preenchida
        Mas a operação será com base na 'txOperacao' com valor '2'
        E clicar em cadastrar
    Então a movimentação é cadastrada com sucesso

@consulta_operacao
Cenário: Consultar operação
    Dado que estou na área de operações
    Quando consultar uma operação pelo ID '01082020'
    Então poderei visualizar os dados cadastrados com sucesso

@deleta_operacao
Cenário: Deleta operação
    Dado que estou na área de operações
      E consultar uma operação
      E selecionar a operação a ser excluida
    Então a operação é excluida com sucesso

@edita_operacao
Cenário: Edita operação
    Dado que estou na área de operações
        E consultar uma operação
        E abro os dados da operacao
        E edito o campo <campo> com <valor>
    Então a operação é editada com sucesso

    Exemplos:
        | campo | valor            |
        | 'pu'  | '3302.643389420' |
        | 'pu'  | '3303.57227718'  |
        | 'pu'  | '3304.39131413'  |

@valida_calculo
Esquema do Cenario: Validar cálculos
    Dado que estou na área de operações 
    Quando que eu tenho a operação de compra preenchida
    Mas a operação será com base na <campo> com valor <valor>
    Então o valor do campo <campoValorAlterado> é alterado para <valorAlterado>

    Exemplos:
        | campo        | valor            | campoValorAlterado | valorAlterado    |
        | 'txOperacao' | '2'              | 'pu'               | '3303.41897105' |
        | 'txOperacao' | '1.2'            | 'pu'               | '3303.57227718'  |

        # | 'txOperacao' | '0.5'            | 'pu'               | '3304.39131413'  |
        # | 'pu'         | '3302.643389420' | 'txOperacao'       | '2'              |
        # | 'pu'         | '3303.57227718'  | 'txOperacao'       | '1.2'            |
        # | 'pu'         | '3304.39131413'  | 'txOperacao'       | '0.5'            |
