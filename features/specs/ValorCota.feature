# language: pt

Funcionalidade: Processar a cota

-Eu como usuário.
-Eu quero processar a cota do fundo F no dia D.

Cenario: Processar o fundo F no dia D
Dado que eu tenho um fundo F fechado no dia D
|fundo|    F             |
|data |  DD/MM/AAAA      |
Quando eu faco o processamento de fechamento
E gero o relatorio de composicao da carteira em tela
Entao eu verifico o valor da cota calculada
|ValorCota |    1.2      |

