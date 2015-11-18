class User < ActiveRecord::Base
  has_many :quantities, dependent: :destroy
  has_many :flosses, through: :quantities
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
