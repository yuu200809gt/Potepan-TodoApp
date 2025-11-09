class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:title, :start_date, :end_date, :all_day, :memo))
    if @user.save
      flash[:notice] = "予定を新規追加しました"
      redirect_to :users
    else
      flash[:notice] = "予定を追加できませんでした"
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:title, :start_date, :end_date, :all_day, :memo))
      @user.save
      flash[:notice] = "予定を更新しました"
      redirect_to :users
    else
      flash[:notice] = "予定を更新できませんでした"
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "予定を削除しました"
    redirect_to :users
  end

end
