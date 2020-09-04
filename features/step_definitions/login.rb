Dado("que o usuário acessa a área de login da plataforma") do
  @loginPage.load
end

Quando("preencher o {string} e {string} com dados {string}") do |usuario, senha, status|
  @loginPage.logar_usuario(status, usuario, senha)
end

Então("o login será realizado com sucesso") do
  @initialPage.wait_until_botoesTopo_visible
  @initialPage.wait_until_nomeUsuario_visible
end

Então("será exibido um popup com uma mensagem de erro") do
  expect(accept_alert).to eq("Login ou senha incorretos.")
end

Então("poderá fazer o logout da plataforma") do
  @initialPage.btnSair.click
  @loginPage.wait_until_areaLogin_visible
end
