class LoginPage < SitePrism::Page
  set_url ENV["url_padrao"]

  element :areaLogin, "#login_content"
  element :inputLogin, "#Login1_UserName"
  element :inputSenha, "#Login1_Password"
  element :btnAcessar, "#Login1_LoginButton"

  def logar_usuario(status, usuario, senha)
    @login = Base64.decode64($loginValido)
    @senha = Base64.decode64($SenhaValida)
    case status
    when "válidos"
      inputLogin.set(@login)
      inputSenha.set(@senha)
      btnAcessar.click
    when "inválidos"
      inputLogin.set(usuario)
      inputSenha.set(senha)
      btnAcessar.click
    else
      log("Não há dados para o login")
    end
  end
end
