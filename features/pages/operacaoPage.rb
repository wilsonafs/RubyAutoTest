include RSpec::Matchers

class OperacaoPage < SitePrism::Page
  # Adicionar nova operação
  element :btnAdd, '#btnAdd'
  element :btnConsultarCliente, '#btnEditCodigoCliente_B0'
  element :inputCodigoCliente, '#PopupCliente_PopupClienteGridCliente_DXFREditorcol0_I'
  element :gridCliente, '#PopupCliente_PopupClienteGridCliente_DXDataRow0'
  element :inputTipo, '#gridCadastro_DXPEForm_efnew_tabCadastro_dropTipoOperacao_I'
  element :inputCategoria, '#gridCadastro_DXPEForm_efnew_tabCadastro_dropTipoNegociacao_I'
  element :modal_cliente, '#gridCadastro_DXPEForm_PW-1'

  # Informações do titulo
  element :btnTitulo, '#gridCadastro_DXPEForm_efnew_tabCadastro_btnEditTituloRF_B0Img'
  element :modal_titulo, '#ctl23_PW-1'
  element :idTitulo, '#ctl23_ctl14_DXFREditorcol0_I'
  element :gridTitulo, '#ctl23_ctl14_DXDataRow0'
  element :inputNegociacao, '#gridCadastro_DXPEForm_efnew_tabCadastro_dropLocalNegociacao_I'
  element :inputAgenteCustodia, '#gridCadastro_DXPEForm_efnew_tabCadastro_dropAgenteCustodia_I'
  element :inputQuantidade, '#gridCadastro_DXPEForm_efnew_tabCadastro_textQuantidade_I'
  element :inputTxOperacao, '#gridCadastro_DXPEForm_efnew_tabCadastro_textTaxaOperacao_I'
  element :calcularPU, '#gridCadastro_DXPEForm_efnew_tabCadastro_btnCalculaPU'
  element :inputValor, '#gridCadastro_DXPEForm_efnew_tabCadastro_textValor_I'
  element :clickTable, '#gridCadastro_DXPEForm_efnew_tabCadastro_C0'
  element :calculaTxOperacao, '#gridCadastro_DXPEForm_efnew_tabCadastro_btnCalculaTaxa'
  element :inputPU, '#gridCadastro_DXPEForm_efnew_tabCadastro_textPUOperacao_I'
  element :btnOk, '.btnOK'

  # Edição
  element :editaPU, '#gridCadastro_DXPEForm_ef0_tabCadastro_0_textPUOperacao_0_I'
  element :editaTxOperacao, '#gridCadastro_DXPEForm_ef0_tabCadastro_0_textTaxaOperacao_0_I'
  element :calculadoTaxaEdicao, '#gridCadastro_DXPEForm_ef0_tabCadastro_0_btnCalculaTaxa_0'

  # Filtro
  element :btnFiltro, '#btnFilter'
  element :btnAplicarFiltro, '#popupFiltro_btnOKFilter'
  element :tabelaCadastroOperacao, '#gridCadastro_DXMainTable'
  element :selecionaPrimaOperacao, '#gridCadastro_DXDataRow0'
  element :checkOperacao, '#gridCadastro_DXSelBtn0_D' # o 0 no final seleciona sempre a primeira operação pensar em uma forma de deixar em lista
  elements :abrirPrimaOperacao, '#gridCadastro_DXDataRow0 td'

  # Excluir
  element :btnExcluir, '#btnDelete'

  # modal consulta
  element :data_inicio, '#popupFiltro_textDataInicio_I'

  # Loading
  element :loading, '#PopupCliente_PopupClienteGridCliente_TL'

  def dados_campos
    # Dados do cliente
    within_frame :xpath, '//*[@id="iframePrincipal"]' do
      btnAdd.click
      btnConsultarCliente.click
      wait_until_inputCodigoCliente_visible
      inputCodigoCliente.set(45)
      wait_until_loading_visible
      wait_until_loading_invisible
      gridCliente.double_click
      wait_until_inputCodigoCliente_invisible

      # Categoria
      inputCategoria.set('Negociação')

      # Tipo operação
      inputTipo.set('Compra Final')

      # Titulo
      btnTitulo.click
      wait_until_modal_titulo_visible
      wait_until_loading_invisible
      idTitulo.set(2_245_809)
      wait_until_loading_invisible
      gridTitulo.double_click
      wait_until_modal_titulo_invisible

      # Local Negociação
      inputNegociacao.set('CETIP')

      # Agende de Custodia
      inputAgenteCustodia.set('MAGLIANO S.A. CCVM')
      inputQuantidade.click
      inputQuantidade.set(1000)
    end
  end

  def calcular_pu(valor)
    within_frame :xpath, '//*[@id="iframePrincipal"]' do
      inputTxOperacao.set(valor)
      calcularPU.click
      sleep 6
      inputValor.click
      inputValor.send_keys :tab
    end
  end

  def calcula_txoperacao(valor)
    within_frame :xpath, '//*[@id="iframePrincipal"]' do
      inputPU.set(valor)
      calculaTxOperacao.click
      sleep 6
      inputValor.click
      inputValor.send_keys :tab
    end
  end

  def tipo_calculo(campo, valor)
    case campo
    when 'txOperacao'
      # within_frame :xpath, '//*[@id="iframePrincipal"]' do
      #   inputTxOperacao.set(valor)
      #   calcularPU.click
      #   sleep 6
      #   inputValor.click
      #   inputValor.send_keys :tab
      # end
      calcular_pu(valor)
    when 'pu'
      # within_frame :xpath, '//*[@id="iframePrincipal"]' do
      #   inputPU.set(valor)
      #   calculaTxOperacao.click
      #   sleep 6
      #   inputValor.click
      #   inputValor.send_keys :tab
      # end
      calcula_txoperacao(valor)
    else
      puts 'Tipo de calculo de operação não localizada'
    end
  end

  def salvar_operacao
    within_frame :xpath, '//*[@id="iframePrincipal"]' do
      btnOk.click
    end
  end

  def validar_inclusao
    within_frame :xpath, '//*[@id="iframePrincipal"]' do
      wait_until_modal_cliente_invisible
    end
  end

  def consulta_operacao(data)
    within_frame :xpath, '//*[@id="iframePrincipal"]' do
      btnFiltro.click
      data_inicio.set(data)
      btnAplicarFiltro.click
    end
  end

  def excluir_operacao
    within_frame :xpath, '//*[@id="iframePrincipal"]' do
      checkOperacao.click
      btnExcluir.click
      page.driver.browser.switch_to.alert.accept
    end
  end

  def edita_operacao(campo, valor)
    case campo
    when 'pu'
      within_frame :xpath, '//*[@id="iframePrincipal"]' do
        editaPU.set(valor)
        calculadoTaxaEdicao.click
      end
    when 'txOperacao'
      within_frame :xpath, '//*[@id="iframePrincipal"]' do
        editaTxOperacao.set(valor)
        calculadoTaxaEdicao.click
      end
    else
      puts 'Não foi localizado nenhum campo com esse nome'
    end
  end

  def selecionar_operacao
    within_frame :xpath, '//*[@id="iframePrincipal"]' do
      selecionaPrimaOperacao.double_click
    end
  end

  def valida_valor(campo, valor)
    case campo
    when 'txOperacao'
      within_frame :xpath, '//*[@id="iframePrincipal"]' do
        expect(inputTxOperacao.value).to eql(valor)
      end
    when 'pu'
      within_frame :xpath, '//*[@id="iframePrincipal"]' do
        expect(inputPU.value).to eql(valor)
      end
    else
      puts 'Não foi localizado nenhum campo'
    end
  end
end
