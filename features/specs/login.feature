#language: pt

@testes_login
Funcionalidade: Validar os cenários do fluxo de login

Contexto: Acessar a área de login da plataforma 
    Dado que o usuário acessa a área de login da plataforma 

@login_sucesso
Cenário: Login com sucesso
    Quando preencher o "login" e "senha" com dados "válidos"
    Então o login será realizado com sucesso

@logout
Cenário: Realizar logout da plataforma
    Quando preencher o "login" e "senha" com dados "válidos"
    Então o login será realizado com sucesso
    E poderá fazer o logout da plataforma

@login_invalido
Esquema do Cenario: Login com dados inválidos
    Quando preencher o <login> e <senha> com dados "inválidos"
    Então será exibido um popup com uma mensagem de erro 

Exemplos:
    | login           | senha           |
    | 'teste'         | 'invalida'      |
    | 'invalido'      | 'invalido'      |
    | ''              | 'loginEmBranco' |
    | 'senhaembranco' | ''              |