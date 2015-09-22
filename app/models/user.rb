class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :registerable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles
end
