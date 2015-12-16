class Album < ActiveRecord::Base
  validates :band_id, :title, :date_made, presence: true

has_many :songs
belongs_to :band

end
