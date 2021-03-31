class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :password, :password_confirmation, format: { with: /\A(?=.*?[a-z])(?=.*?[\d)])[a-z\d]+\z/i }
  validates :age, numericality: { greater_than_or_equal_to: 20, less_than_or_equal_to: 120 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true, numericality: { other_than: 0 } do
    validates :gender_id
    validates :country_id
  end

  belongs_to :gender
  belongs_to :country
end