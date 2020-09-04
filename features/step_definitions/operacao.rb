Dado("que estou na área de operações") do
  @initialPage.wait_until_botoesTopo_visible
  @initialPage.acessar_operacoes
end

Quando("que eu tenho a operação de compra preenchida") do
  @operacaoPage.dados_campos
end

Quando("clicar em cadastrar") do
  @operacaoPage.salvar_operacao
end

Quando("a operação será com base na {string} com valor {string}") do |campo, valor|
  @operacaoPage.tipo_calculo(campo, valor)
end

Então("a movimentação é cadastrada com sucesso") do
  @operacaoPage.validar_inclusao
end

Quando("consultar uma operação pelo ID {string}") do |idOperacao|
  @operacaoPage.consulta_operacao(idOperacao)
end

Então("poderei visualizar os dados cadastrados com sucesso") do
  within_frame :xpath, '//*[@id="iframePrincipal"]' do
    @operacaoPage.wait_until_tabelaCadastroOperacao_visible
    expect(@operacaoPage).to have_selecionaPrimaOperacao
  end
end

Dado("consultar uma operação") do
  data = "01082020"
  @operacaoPage.consulta_operacao(data)
  @operacaoPage.wait_until_loading_invisible
  within_frame :xpath, '//*[@id="iframePrincipal"]' do
    @operacaoPage.wait_until_tabelaCadastroOperacao_visible
    expect(@operacaoPage).to have_selecionaPrimaOperacao
  end
end

Dado("selecionar a operação a ser excluida") do
  @operacaoPage.excluir_operacao
end

Então("a operação é excluida com sucesso") do
  @operacaoPage.wait_until_loading_invisible
end

Dado("abro os dados da operacao") do
  @operacaoPage.selecionar_operacao
end

Dado("edito o campo {string} com {string}") do |campo, valor|
  @campo_alterado = campo
  @operacaoPage.edita_operacao(@campo_alterado, valor)
  @operacaoPage.salvar_operacao
end

Então("a operação é editada com sucesso") do
  @operacaoPage.wait_until_modal_cliente_invisible
end

Então("o valor do campo {string} é alterado para {string}") do |campoValorAlterado, valorAlterado|
  sleep 6
  @operacaoPage.valida_valor(campoValorAlterado, valorAlterado)
end
