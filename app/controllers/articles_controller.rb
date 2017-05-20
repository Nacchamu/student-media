class ArticlesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(create_params)
    if article.save
      redirect_to articles_path
    else
      redirect_to new_article_path
    end
  end

  private
  def create_params
    params.require(:article).permit(:title, :text, :thumbnail).merge(user_id: current_user.id)
  end
end
