class Agency < ApplicationRecord
  # has_many :agency_coordinations
  has_and_belongs_to_many :coordinators
  has_many :needs

  validates :galaxy_id, uniqueness: true

  def get_needs
    Need.where(agency_id: self.galaxy_id)
  end
end
