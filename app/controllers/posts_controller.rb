class PostsController < ApplicationController

  before_action :set_post, only: [:update, :show, :edit, :destroy]
  #Action d'affichage de tous les articles
  def index
    session[:user_id] = {username: 'Sadate', id:3}
    @posts = Post.all
  end

  #Action d'affichage d'un article en particulier
  def show

  end

  #Action d'edition d'un article
  def edit

  end

  #Action de mis à jour d'un article
  def update
    @post.update(post_params)
    flash[:notice] = "Article modifié avec succes"
    redirect_to posts_path
  end

  #Action de creation d'un nouvel article
  def new
    @post = Post.new
  end

  #Action d'insertion d'un nouvel article
  def create
    post = Post.create(post_params)
    redirect_to post_path(post.id)
  end

  #Action pour detruire un element
  def destroy
    @post.destroy

    redirect_to posts_path
  end

  #Action privée de recuperation des parametres transmis par les formulaires
  private

  def post_params
    params.require(:post).permit(:name, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
