class ActivityComment < ApplicationRecord
  belongs_to :activity
  belongs_to :game
end
