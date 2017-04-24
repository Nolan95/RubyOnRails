class PagesController < ApplicationController

  def salut
    @name = params[:name]
  end

  def home
    ContactMailer.contact(Post.first).deliver_later
  end

end
