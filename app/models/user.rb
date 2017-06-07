class User < ApplicationRecord
  validates :email, uniqueness: true

  def self.get_some_users(offset=0,amount=10)
    User.limit(amount).offset(offset)
  end
end
