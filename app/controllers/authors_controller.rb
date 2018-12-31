class AuthorsController < ApplicationController
  require 'prawn' 
  def index
    @authors = Author.all
    @authors_count = Author.count(:nationality_id) 
    @author_join = Article.joins(:author)
    @authors_eager = Article.all.includes(:author).where(authors: {name: params[:both]})
    @author_scope = Author.grade.nationality_id
    @author_max_story = Article.where(["LENGTH(story)>17"])
  end
  def preview
    author = Author.find_by(id: params[:id])
    send_data generate_pdf(author),
      filename: "#{author.name}.pdf",
      type: "application/pdf"
  end

  def totalrecord
    @author = Author.find(params[:id])
    puts "totalrecord working.............@@@@@@@@@@@@@"
  end

  def download
    @authors = Author.all
    puts "totalrecord working.............@@@@@@@@@@@@@"
  end

  private
    def author_params
      params.require(:author).permit(:title, :name, :nationality, :story)
    end
    def generate_pdf(author)
      Prawn::Document.new do
        text "Author Name: #{author.name}", align: :center
        text "Author nationality: #{author.nationality.country}"
        text "Author Grade: #{author.grade}"
      end.render
    end
end
