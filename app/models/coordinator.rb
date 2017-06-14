class Coordinator < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :invite_for => 2.weeks

  # has_many :agency_coordinations
  has_and_belongs_to_many :agencies
  has_many :needs, :through => :agencies

  def list_of_agencies
    list_str = ""
    agency_names = self.agencies.collect {|agency| agency[:name]}
    agency_names.each do |agency|
      if agency != agency_names.first
        list_str += "<br>"+agency
      else
        list_str += agency
      end
    end
    list_str
  end
end
