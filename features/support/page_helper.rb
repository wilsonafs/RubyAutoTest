Dir[File.join(File.dirname(__FILE__),
              '../pages/*_page.rb')].each { |file| require file }



module Pages
    def home
        @home ||= HomePage.new
    end

    def pagina_professor
        @pagina_professor ||= PaginaInicialPage.new
    end

    def pagina_OperRendaFixa
        @pagina_OperRendaFixa ||= PaginaOperRendaFixaPage.new
    end

    def pagina_ProcessamentoPeriodo
        @pagina_ProcessamentoPeriodo ||= PaginaProcessamentoPeriodoPage.new
    end

end