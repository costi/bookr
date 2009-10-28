class CplCrawler

  def initialize(card_number, zip_code)
    @card_number = card_number
    @zip_code = zip_code
    @summary_page = nil
    @agent = WWW::Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }
  end

  def login_to_library
    @agent.get('http://www.chipublib.org/mycpl/login/') do |login_page|
      @homepage = login_page.form_with(:action => '/mycpl/login/') do |f|
        f.patronId = @card_number
        f.zipCode = @zip_code
      end.click_button
    end
    @homepage
  end

  def holds_page
    summary_page  
  end
  
  def checked_out_page
    summary_page
  end

  def overdue_page
    summary_page
  end
  
  def fines_page
    summary_page
  end
  
  private
  def summary_page
    @summary_page ||= @agent.click( @homepage.links.text(/Checked Out/) )
  end
  
  
end