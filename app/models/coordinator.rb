class Coordinator < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :agency_coordinations
  has_many :agencies, :through => :agency_coordinations
  has_many :needs, :through => :agencies
end
