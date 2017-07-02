class PicturesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_insta,only:[:edit,:update,:destroy]

  def new
    if params[:back]
      @insta = Picture.new(insta_params)
    else
      @insta = Picture.new
    end
  end

  def create
    @insta = Picture.new(insta_params)
    @insta.user_id = current_user.id
    @insta.user_name = current_user.name
    if @insta.save
      redirect_to pictures_path,notice:"[Runsta]新たな投稿がありました"
      NoticeMailer.sendmail_picture(@insta).deliver
    else
      render 'new'
    end
  end

  def index
    @instas = Picture.all
    @users = User.all
  end

  def edit
    @insta = Picture.find(params[:id])
  end

  def destroy
    @insta = Picture.find(params[:id])
    @insta.destroy
    redirect_to pictures_path,notice:"投稿を削除しました！！"
  end

  def update
   @insta = Picture.find(params[:id])
   if @insta.update(insta_params)
     redirect_to pictures_path,notice:"投稿を更新しました！！"
   else
     render 'edit'
   end
 end

  private
    def insta_params
     params.require(:picture).permit(:image,:title,:content)
    end

    def set_insta
      @insta = Picture.find(params[:id])
    end

end
