class PaginaInicialPage < SitePrism::Page
  #  element :nome_professor, 'div[class="container"]'
    element :sair, '#LogoffBtn'

   def deslogar
     sair.click
   end 
end