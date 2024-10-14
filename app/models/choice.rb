class Choice < ApplicationRecord
  belongs_to :polls
  has_many :votes, dependent: :destroy
  validates :text, presence: true

  def vote_percentage(total_votes)
    return 0 if total_votes == 0
    (votes.count.to_f / total_votes.to_f) * 100
  end
end
