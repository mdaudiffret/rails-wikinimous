class ApplicationController < ActionController::Base

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(strong_params)
    random_index = rand(0..3)
    search_results = Unsplash::Photo.search(@article.title)
    if search_results[random_index]
      @article.picture = search_results[random_index].urls['regular']
    else
      @article.picture = Unsplash::Photo.search('dinosaure')[rand(0..2)].urls['regular']
    end
    @article.save
    redirect_to article_path(@article)
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def show
  end

  def update
    @article.update(strong_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def strong_params
    params.require(:article).permit(:title, :content)
  end
end

# search_results = Unsplash::Photo.search("cats")
# search_results[1].urls['regular']
