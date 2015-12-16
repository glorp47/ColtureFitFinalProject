class Booking < ActiveRecord::Base
  validates :band_id, :gig_id, presence: true

  belongs_to :band

  belongs_to :gig

end
