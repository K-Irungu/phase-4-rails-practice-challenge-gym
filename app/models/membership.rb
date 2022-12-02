class Membership < ApplicationRecord
    belongs_to :gym
    belongs_to :client

    # This validation ensures a client can only have one membership with a gym
    validates :client, uniqueness: { scope: :gym }
end
