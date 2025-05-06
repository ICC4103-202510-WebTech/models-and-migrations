class AuthorsController < ApplicationController
  before_action :set_author, only: [ :edit, :update ]
  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def edit
  end

  def create
    @author = Author.new author_params
    if @author.save
      # redirect_to author_path(author)
      flash[:notice] = "Autor guardado con éxito"
      redirect_to authors_path
    else
      # render :new
      flash[:alert] = "#{@author.errors.full_messages.join(", ")}"
      redirect_to new_author_path
    end
  end

  def update
    if @author.update author_params
      redirect_to authors_path
    else
      redirect_to edit_author_path(@author)
    end
  end

  private
  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end

  def set_author
    @author = Author.find params["id"]
  end
end
