class PicturesController < ApplicationController

  def new
    @insta = Picture.new
  end

  def create
    @insta = Picture.new(insta_params)
    if @insta.save
      redirect_to pictures_path,"[insta]新たな投稿がありました"
      NoticeMailer.sendmail_picture(@insta).deliver
    else
       rendr 'new'
    end
  end

  def index
    @instas = Picture.all
  end

  def edit
    @insta = Picture.find(params[:id])
  end

  def destroy
    @insta = Picture.find(params[:id])
    @insta.destroy
  end

  private
    def insta_params
     params.require(:insta).permit(:title,:content)
   end

end
