# frozen_string_literal: true

class User < ActiveRecord::Base
  # self.abstract_class = true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  include DeviseTokenAuth::Concerns::User

  has_many :notes
  has_many :pages
  has_one :user_role
  has_many :roles, through: :user_roles
  has_many :boards
  has_many :board_comments, through: :boards

  # validates :nickname, uniqueness: true, presence: true
end
