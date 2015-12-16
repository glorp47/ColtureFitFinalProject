class Gig < ActiveRecord::Base

  validates :venue_id, :title, :date, :description, presence: true

  has_many :bookings

  has_many :bands,
  through: :bookings

  belongs_to :venue

end
