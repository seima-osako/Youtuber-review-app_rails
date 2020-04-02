class Scraping
  def self.get_product
    (1..50).each do |i|
      agent = Mechanize.new
      # ダブルクォーテーションでなければ認識されない
      page = agent.get("https://ytranking.net/?p=#{i}")
      names = page.search('.channel-list .title')
      image_urls = page.search('.channel-list img')
      names.zip(image_urls) do |name, image_url|
        name = name.inner_text
        image_url = image_url.get_attribute('src')
        product = Product.where(name: name, image_url: image_url).first_or_initialize
        product.save
      end
    end
  end
end