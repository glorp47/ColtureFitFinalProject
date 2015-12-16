class Song < ActiveRecord::Base
  validates :band_id, :title, :date_made, presence: true
  belongs_to :album
  belongs_to :band 
end
