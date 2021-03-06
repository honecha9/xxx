class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true, uniqueness: true, length: {minimum: 6 }

  has_many :group
  has_one :profile
  has_many :comments

  def self.search(search)
    return User.all() unless search
    User.where('name LIKE(?)', "%#{search}%")
  end
end
