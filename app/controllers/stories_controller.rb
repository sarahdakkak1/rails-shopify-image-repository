class StoriesController < ApplicationController

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
    if @story.save
      redirect_to story_path(@story)
    else
      render 'new'
    end
  end

  def destroy
    @story = Story.find(params[:id])
      @story.destroy
      redirect_to story_path(@story)
  end

  private


  def story_params
    params.require(:story).permit(:name, photos: [])
  end

end
