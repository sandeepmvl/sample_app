class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :uname
  # attr_accessible :title, :body
  
  attr_accessible :avatar
    has_attached_file :avatar, :styles => {
        :thumb => "80x80#",
        :small  => "150x150>",
        :medium => "200x200" ,:san =>"30x30#"}
  validates_attachment :avatar,
    :content_type => { :content_type=>['image/jpeg', 'image/png', 'image/gif'] },
    :size => { :in => 0..4000.kilobytes }
end
