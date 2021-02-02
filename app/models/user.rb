class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable

  enum role: {
    guest: 0,
    admin: 1
  }, _default: :guest

  has_many :orders, class_name: 'Order', foreign_key: 'user_id', inverse_of: :orderer, dependent: :destroy

  #this method is called by devise to check for role of the model
  def active_for_authentication?
    super and self.admin?
  end
end
