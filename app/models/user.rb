class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  has_many :recipes, foreign_key: :user_id, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }, allow_blank: true
  validates :email, presence: true, uniqueness: true

  ROLES = %i[admin user].freeze

  def admin?
    role == 'admin'
  end

  def user?
    role == 'user'
  end

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
end
