class GamesController < ApplicationController
  def new
    @tag_list = Tag.all
    @game = Game.new
  end
  def create
    @game = Game.new(game_params)
    tag_list = params[:game][:tag_name].split(nil)
    @game.save
    @game.save_tag(tag_list)
    redirect_to game_path(@game.id)
  end
  def destroy
  end
  def index
    @tag_list = Tag.all
    @games = Game.all
  end
  def show
    @game = Game.find(params[:id])
    @game_tags = @game.tags
  end
  def search
    @tag = Tag.find(params[:tag_id])
    @games = @tag.games.all
  end


  
  private

  def game_params
    params.require(:game).permit(:game_image, :name, :body, :duration, :headcount, :level, :remarks)
  end


end
