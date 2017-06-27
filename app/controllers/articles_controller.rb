class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order("created_at DESC").page(params[:page]).per(10)
  end

  def show
    @article = Article.find(params[:id])
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

  def search
    @articles = Article.where('title LIKE(?)',"%#{params[:title]}%").order("created_at DESC")
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def create_params
    params.require(:article).permit(:title, :text, :thumbnail).merge(user_id: current_user.id)
  end
end
