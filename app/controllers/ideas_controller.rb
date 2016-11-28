class IdeasController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @ideas = current_user.ideas
  end

  def new
    @idea = Idea.new
  end

  def create
    @ideas = ideas_from_params

    @ideas.each do |idea|
      current_user.ideas.create(text: idea)
    end

    redirect_to ideas_path
  end

  private
    def ideas_from_params
      params.require(:idea).permit(:text)[:text]&.split("\r\n")
    end
end
