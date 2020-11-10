10.times do
  @article = Article.new
  @article.title = Faker::Creature::Animal.name
  @article.content = Faker::Lorem.paragraphs.join
  @article.picture = "https://images.unsplash.com/photo-1534534502714-2828e7c540d0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE4MTU1MX0&utm_source=alices_terrific_client_app&utm_medium=referral&utm_campaign=api-credit"
  @article.save
end
