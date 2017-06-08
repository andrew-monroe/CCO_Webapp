class Coordinator < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # has_many :agency_coordinations
  has_and_belongs_to_many :agencies
  has_many :needs, :through => :agencies
end
