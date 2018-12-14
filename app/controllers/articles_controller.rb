class ArticlesController < ApplicationController

  def index
    @articles = Article.all
     @articles_query = if params[:term]
      Article.where('title LIKE ?',"%#{params[:term]}")
      elsif params[:term1]
        Article.joins(:author).where('nationality_id LIKE ?',"%#{params[:term1]}")
      elsif params[:author_name]
        Article.all.includes(:author).where(authors: {name: params[:author_name]})
      else
        Article.all
  	 end
  end
 
  def show
    @article = Article.find(params[:id])
  end
 
  def new
    @article = Article.new
  end
 
  def edit
    @article = Article.find(params[:id])
  end
 
  def create

    @article = Article.new(article_params)

    
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
 
  def update
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
 
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  end
 
  private
    def article_params
      params.require(:article).permit(:title, :story, :author_id)
    end
end
