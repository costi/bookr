class CplCrawler

  def initialize(card_number, zip_code)
    @card_number = card_number
    @zip_code = zip_code
  end

  def login_to_library
    @current_page = WWW::Mechanize.new.post('http://www.chipublib.org/mycpl/login//mycpl/login/', {:card_number => @card_number, :zip_code => @zip_code})
    self.html = page.body    

  end

  def holds_page
    
  end
  
  def checked_out_page
    
  end

  def overdue_page
    
  end
  
  def fines_page
    
  end
  
end