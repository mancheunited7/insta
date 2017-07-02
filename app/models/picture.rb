class Picture < ActiveRecord::Base

  validates:image,presence:true
  validates:title,presence:true
  validates:content,presence:true
  belongs_to :user

  mount_uploader :image, AvatarUploader

end
