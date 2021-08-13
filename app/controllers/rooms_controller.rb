class RoomsController < ApplicationController
  
  def index
    @rooms = Room.all
  end
 
  def search
    @roms = Room.search(params[:search])
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = current_user.rooms.new(params.require(:room).permit(:name, :introduction, :price, :address, :image))
    if @room.save
      flash[:notice] = "お部屋を保存しました。"
      redirect_to :rooms
    else
      flash[:alert] = "登録エラーです。"
      render "new"
    end
  end
  
  def show
    @room = Room.find(params[:id])
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "削除しました。"
    redirect_to :rooms
  end
  
end
