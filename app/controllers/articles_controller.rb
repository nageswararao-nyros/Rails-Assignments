class ArticlesController < ApplicationController

  def index
    @articles = Article.all
     @articles_query = if params[:term]
      Article.where('title LIKE ?',"%#{params[:term]}")
      else if params[:term1]
        Article.where('author_id LIKE ?',"%#{params[:term1]}")
      else
        Article.all
      end
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
