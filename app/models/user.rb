class User < ApplicationRecord
  validates :email, uniqueness: true

  def self.get_some_users(offset=0,amount=15)
    offset = offset.to_i < 0 ? 0 : offset.to_i
    amount = amount.to_i
    User.limit(amount).offset(offset*amount).order(:last_name)
  end
end
