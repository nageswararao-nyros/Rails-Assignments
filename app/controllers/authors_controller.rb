class AuthorsController < ApplicationController
  def index
    @authors = Author.select(:nationality_id).distinct
    @authors_count = Author.count(:nationality_id) 
    @author_join = Article.joins(:author)
    @authors_eager = Article.all.includes(:author).where(authors: {name: params[:both]})
    @author_scope = Author.grade.nationality_id
    @author_max_story = Article.where(["LENGTH(story)>17"])
  end
  private
    def author_params
      params.require(:author).permit(:title, :name, :nationality, :story)
    end
end
