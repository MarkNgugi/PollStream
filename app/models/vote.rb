class Vote < ApplicationRecord
  belongs_to :choice
  validates :choice_id, presence: true
end
