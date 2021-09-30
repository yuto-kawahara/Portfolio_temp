class TagsController < ApplicationController
  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_to new_game_path
  end
  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    redirect_to new_game_path
  end

  private
  
  def tag_params
    params.require(:tag).permit(:tag_name)
  end
end
