class AgencyCoordination < ApplicationRecord
  belongs_to :agency
  belongs_to :coordinator
end
