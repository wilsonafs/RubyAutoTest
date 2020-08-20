# language: pt

Funcionalidade: Fazer login

-Eu com professor.
-Eu quero fazer login na plataforma.

Cenario: Fazer login com sucesso.
Dado que eu tenho um usuario
|email|   teste   |
|senha|  mengao   |
Quando eu faco login
Entao eu verifico se estou logado