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

  def list_of_coordinators
    list_str = ""
    coordinator_names = self.coordinators.collect {|coordinator| coordinator[:first_name]+" "+coordinator[:last_name]}
    coordinator_names.each do |coordinator|
      if coordinator != coordinator_names.first
        list_str += "<br>"+coordinator
      else
        list_str += coordinator
      end
    end
    list_str
  end
end
