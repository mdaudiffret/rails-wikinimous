10.times do
  @article = Article.new
  @article.title = Faker::Creature::Animal.name
  @article.content = Faker::Lorem.paragraphs.join
  random_index = rand(0..3)
  search_results = Unsplash::Photo.search(@article.title)
  if search_results[random_index]
    @article.picture = search_results[random_index].urls['regular']
  else
    @article.picture = Unsplash::Photo.search('dinosaure')[rand(0..2)].urls['regular']
  end
  @article.save
end
