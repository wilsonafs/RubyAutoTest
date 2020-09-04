class InitialPage < SitePrism::Page
  # Elementos topo
  element :botoesTopo, "#topoBotoes"
  element :nomeUsuario, "#loginName"
  element :btnSair, "#sair a"

  # Elementos menu
  element :menuMercados, "#ASPxMenu1_DXI3_T"
  element :subMenuRendaFixa, "#ASPxMenu1_DXI3i2_"
  element :subMenuOperacao, "#ASPxMenu1_DXI3i2i5_"

  def acessar_operacoes
    menuMercados.click
    subMenuRendaFixa.click
    subMenuOperacao.click
  end
end
