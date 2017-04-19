class PostsController < ApplicationController

  before_action :set_post, only: [:update, :show, :edit, :destroy]
  #Action d'affichage de tous les articles
  def index
    session[:user_id] = {username: 'Sadate', id:3}
    cookies.encrypted[:username] = {
      value: "John",
      expires: 1.month.from_now
    }
    @posts = Post.includes(:categorie, :tags).all

    respond_to do |format|
      format.html {  }
      format.json { render json: @posts.as_json(only: [:name, :created_at, :id]) }
      format.xml { render xml: @posts }
    end
  end

  #Action d'affichage d'un article en particulier
  def show

  end

  #Action d'edition d'un article
  def edit

  end

  #Action de mis à jour d'un article
  def update
    if @post.update(post_params)
      redirect_to posts_path, success: "Article modifié avec succes"
    else
      render 'edit'
    end
  end

  #Action de creation d'un nouvel article
  def new
    @post = Post.new
  end

  #Action d'insertion d'un nouvel article
  def create
    post = Post.new(post_params)

    if post.valid?
      post.save
      redirect_to post_path(post.id), success: "Article crée avec succes"
    else
      @post = post
      render 'new'
    end
  end

  #Action pour detruire un element
  def destroy
    @post.destroy

    redirect_to posts_path, success: "Article supprimé avec succes"
  end

  #Action privée de recuperation des parametres transmis par les formulaires
  private

  def post_params
    params.require(:post).permit(:name, :content, :slug)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
