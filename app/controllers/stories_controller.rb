class StoriesController < ApplicationController
  before_action :authenticate_user!, only: [:home, :show, :index]


  def home
    @stories = Story.all
  end

  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    @story.user = current_user
    if @story.save
      redirect_to story_path(@story)
    else
      render 'new'
    end
  end

  def destroy
    story = Story.find(params[:id])
    if current_user == story.user
      story.destroy
      redirect_to root_path
    else
      render(
        html: "<script>alert('You can't delete this motorcycle post because you are not the owner')</script>".html_safe,
        layout: 'application'
      )
    end
  end

  private


  def story_params
    params.require(:story).permit(:name, photos: [])
  end

end
