class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :dev_activities, dependent: :destroy

  validates :first_name,  :presence => true
  validates :surname,  :presence => true
  validates :workgroup, :presence => true
end
