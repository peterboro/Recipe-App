class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :role, presence: true

  has_many :inventories, foreign_key: :user_id, dependent: :destroy
  has_many :recipes, foreign_key: :user_id, dependent: :destroy

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
