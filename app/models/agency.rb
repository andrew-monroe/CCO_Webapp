class Agency < ApplicationRecord
  has_many :agency_coordinations
  has_many :coordinators, :through => :agency_coordinations
  has_many :needs
end
