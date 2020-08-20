# language: pt

Funcionalidade: CRUD da tela de Operacao de Renda Fixa

-Eu como usuario.
-Eu quero incluir uma operação de compra.
-Eu quero depois consultar a operação incluida.
-Eu quero depois alterar o PU de compra.
-Eu quero depois excluir a operação de compra.

Contexto: Dado que eu esteja logado na tela de operacao de renda fixa

Cenario: Incluir operação de compra.
Dado que eu tenho a operação de compra preenchida
|Cliente             | 45           |
|Tipo                | Compra Final |
|Categoria           |  Negociação  |
|Título              |     2245809  |
|Operacao            |  03/08/2020  |
|Local Negociação    |   CETIP             |
|Agente de Custodia  |  MAGLIANO S.A. CCVM |
|Quantidade          |   1000              |
Quando preencho o campo <TxOperacao> 
E pressiono o botão para calcular o PU
Entao eu verifico o valor do <PU> calculado

Exemplo:
| TxOperacao  |   PU                |
|    2        | 3302.643389420      |
|    1.2      |  3303.57227718      |
|    0.5      |  3304.39131413      |



Cenario: Consultar a operação de compra.
Dado que eu tenho uma operacao de renda fixa inserida na base
Quando eu seleciono a operacao no filtro de consulta
|Id Operacao    | 456        |
Entao eu verifico se a operacao consultada trouxe os valores gravados
|Cliente    | 123        |
|Tipo       | Compra Final |
|Categoria  |  Negociação  |
|Título     |     LFT      |
|Id Posição |              |
|Carência   |     Não      |
|Local Negociação|   CETIP |
|Quantidade      |   1000  |
|Tx Operação     |    1    |

Cenario: Alterar a operação de compra.
Dado eu selecionei a operacao no filtro de consulta
|Id Operacao    | 1        |
Quando altero o valor do <PU>
Entao eu verifico se a <TxOperacao> ficou correta
|       PU          |  TxOperacao  | 
|  3302.643389420   |    2         |
|  3303.57227718    |    1.2       |
|  3304.39131413    |   0.5        |


Cenario: Excluir a operação de compra.
Dado eu seleciono a operacao no filtro de consulta
|Id Operacao    |   1   |
Quando excluo a operacao inserida anteriormente
Entao eu verifico se a operacao foi excluida



