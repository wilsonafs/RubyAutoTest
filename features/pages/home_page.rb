class HomePage < SitePrism::Page
    
    set_url '/'
    element :campo_email, '#Login1_UserName'
    element :campo_senha, '#Login1_Password'
    element :botao_logar, '#Login1_LoginButton'
    element :table_view, '#table-view'

    def logar_usuario(email, senha)
        campo_email.set email
        campo_senha.set senha
        botao_logar.click
        table_view.click
    end
    
end