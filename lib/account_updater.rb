class AccountUpdater
    
  def initialize(user, crawler)
    raise ArgumentError, "Argument must be a Library Card" unless user.kind_of?(User)
    @user = user
    raise ArgumentError, "Argument must be a Library Card" unless crawler.kind_of?(CplCrawler)
    @crawler = crawler
  end
  
  def run
    parser = CplParser.new(:all => @crawler.checked_out_page)
    parser.items.each do |item|
      item.user = @user
      item.save!
    end
  end

end