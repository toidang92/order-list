class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable

  enum role: [:guest, :admin]

  has_many :orders, class_name: 'Order', inverse_of: :orderer, dependent: :destroy
end
