class User < ApplicationRecord
  has_many :messages
  has_many :particpants
  has_many :searches
end
