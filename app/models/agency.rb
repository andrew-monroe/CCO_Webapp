class Agency < ApplicationRecord
  has_many :agency_coordinations
  has_many :coordinators, :through => :agency_coordinations
  has_many :needs

  def get_needs
    Need.where(agency_id: self.id)
  end
end
