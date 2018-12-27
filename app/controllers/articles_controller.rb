class ArticlesController < ApplicationController

  require 'prawn'

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
    respond_to do |format|
      format.html
      format.pdf do
        send_data generate_pdf(@article), 
        filename: "#{@article.title}.pdf",
        type: "application/pdf"
      end
    end
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

  def download_pdf
    article = Article.find_by(id: params[:id])
    send_data generate_pdf(article),
      filename: "#{article.title}.pdf",
      type: "application/pdf"
  end

  def download_file
    article = Article.find(params[:id])
    send_file("#{Rails.root}/public/system/articles/posters/000/000/0#{article.id}/original/#{article.id}.pdf",
      filename: "#{article.title}.pdf",
      type: "application/pdf")
  end
 
  private
    def article_params
      params.require(:article).permit(:title, :story, :author_id, :poster, :id)
    end

    def generate_pdf(article)
      Prawn::Document.new do
        text "Title: \#{#{article.title}", align: :center
        text "Story: #{article.story}"
        text "Authorname: #{article.author.name}"
      end.render
    end
end
