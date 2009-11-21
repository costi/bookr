class AccountUpdater
    
  def initialize(user, crawler)
    raise ArgumentError, "Argument must be a Library Card" unless user.kind_of?(User)
    @user = user
    raise ArgumentError, "Argument must be a Library Card" unless crawler.kind_of?(CplCrawler)
    @crawler = crawler
  end
  
  def run
    parser = CplParser.new(:all => @crawler.checked_out_page)
    items = parser.items.map{|item| item.user = @user; item}
    items -= handle_transition('Held','Checked out', items)
    items -= handle_transition('Checked out', 'Overdue', items)
    items -= handle_brand_new(items)
  end
  
  private
    def handle_transition(old_status, new_status, items)
      handled_items = []
      # I want to see if the items from  checked out were in the past held
      items.find_all{|item| item.status == new_status}.each do | item|
        if real_item = @user.items.find(:first, :conditions => {:title => item.title, :status => old_status})
          real_item.status = new_status
          real_item.save
          handled_items << item
        end
      end
      handled_items
    end
   
    
    def handle_brand_new(items)
      handled_items = []
      items.each do |item|
        unless @user.items.find(:first, :conditions => {:title => item.title})
          item.save!
          handled_items << item
        end
      end
      handled_items
    end

end