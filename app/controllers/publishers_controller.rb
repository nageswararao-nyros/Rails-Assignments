class PublishersController < ApplicationController

  def index
    @publishers = Publisher.all
  end

  def new
    @publisher = Publisher.new
  end

  def show
    @publisher = Publisher.find(params[:publisher_id])
  end

  def edit
    @publisher = Publisher.find(params[:publisher_id])
    puts "edit .......success@@@@@@@@@"
  end

  def create
     @publisher = Publisher.new(publisher_params)  
    if @publisher.save
      
      redirect_to publishers_path
    else
      render 'new'
    end
  end

  def update
    @publisher = Publisher.find(params[:publisher_id])
 
    if @publisher.update(publisher_params)
      puts "update success ..........@@@@@@@"
      redirect_to publishers_path
    else
      render 'edit'
    end
  end

  def destroy
    @publisher = Publisher.find(params[:publisher_id])
 
    if @publisher.destroy
      puts "update success ..........@@@@@@@"
      redirect_to publishers_path
    else
      render 'edit'
    end
  end

  private
  def publisher_params
    params.require(:publisher).permit(:name, :from)
  end
end
