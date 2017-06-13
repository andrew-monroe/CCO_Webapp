class Agency < ApplicationRecord
  # has_many :agency_coordinations
  has_and_belongs_to_many :coordinators
  has_many :needs, dependent: :destroy

  validates :galaxy_id, uniqueness: true

  def get_needs
    Need.where(agency_id: self.galaxy_id)
  end

  def self.get_some_agencies(offset=0,amount=15)
    offset = offset.to_i < 0 ? 0 : offset.to_i
    amount = amount.to_i
    Agency.limit(amount).offset(offset*amount).order(:name)
  end
end
