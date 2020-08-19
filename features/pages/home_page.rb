class HomePage < SitePrism::Page
    
    set_url '/'
    element :campo_email, '#Email'
    element :campo_senha, '#Password'
    element :botao_logar, 'button[class="blue"]'
    element :table_view, '#table-view'

    def logar_usuario(email, senha)
        campo_email.set email
        campo_senha.set senha
        botao_logar.click
        table_view.click
    end
    
end