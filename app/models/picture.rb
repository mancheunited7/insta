class Picture < ActiveRecord::Base

  validates:gazo,presence:true
  validates:title,presence:true
  validates:content,presence:true
  belongs_to :user

  mount_uploader :gazo, AvatarUploader

end
