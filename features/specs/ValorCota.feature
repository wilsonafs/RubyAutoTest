# language: pt

Funcionalidade: Processar a cota

-Eu como usuário.
-Eu quero processar a cota do fundo F no dia D.

Cenario: Processar o fundo Teste no dia 4 de agosto
Dado que eu tenho um fundo F fechado no dia D
|fundo|    45          |
|data |  04/08/2020      |
Quando eu faco o processamento de fechamento
E gero o relatorio de historico de cota
Entao eu verifico o valor da cota 
|ValorCota |    1.00007756     |

