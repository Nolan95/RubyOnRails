class CategoriesController < ApplicationController

  before_action :set_post, only: [:update, :destroy, :show, :edit]


  def index
    @session = session[:user_id]
    @categories = Categorie.all
  end

  def show

  end

  def edit

  end

  def update
    @cat.update(cat_params)
    redirect_to categories_path
  end

  def new
    @cat = Categorie.new
  end

  def create
    cat = Categorie.create(cat_params)

    redirect_to category_path(cat.id)
  end

  def destroy
    @cat.destroy

    redirect_to categories_path
  end


  private

  def cat_params
    params.require(:categorie).permit(:title, :description)
  end

  def set_post
    @cat = Categorie.find(params[:id])
  end

end
