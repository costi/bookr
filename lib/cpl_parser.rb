class CplParser
  
  # options is a has of documents
  def initialize(options)
    if options[:all]
      @held_items_doc = @checked_out_items_doc = @overdue_items_doc = @total_fine_amount_doc = options[:all]
    end
    
  end

  def held_items
    doc = Nokogiri::HTML(@held_items_doc)
    # I go the the holds text and then I go to its parent to get to the table containing the holds 
    rows = doc.css('h3#holds').first.parent.parent.css('table tr')

    
  end

  def checked_out_items
    
  end
  
  def overdue_items
    
  end
  
  def returned_items
    
  end
  
  def total_fine_amount
    doc = Nokogiri::HTML(@total_fine_amount_doc)
    amount = doc.css('div.mycpl_green').last.css('table tr').last.css('td').last.content.delete('$')
    BigDecimal.new(amount)
  end
end