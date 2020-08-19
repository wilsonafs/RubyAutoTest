Dado("que eu tenho um usuario") do |table|
  @email = table.rows_hash['email']
  @senha = table.rows_hash['senha']
  home.load
end

Quando("eu faco login") do
 home.logar_usuario(@email, @senha)
end

Entao("eu verifico se estou logado") do

  expect(page).to have_current_path('https://hub.cyrnel.com/', url: true)

end