class User < ApplicationRecord
  has_many :user_items
  has_many :items, through: :user_items
  has_many :friends
  has_many :comments
end
