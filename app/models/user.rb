class User < ApplicationRecord
  has_many :messages
  has_many :searches
end
