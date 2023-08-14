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
  has_many :board_bookmarks
  has_many :note_bookmarks
  has_many :fav_boards, through: :board_bookmarks,source: :board
  has_many :fav_notes, through: :note_bookmarks,source: :note
  # フォローをした、されたの関係
  has_many :relationships, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy

  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # validates :nickname, uniqueness: true, presence: true
end
