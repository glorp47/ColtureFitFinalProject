class Video < ActiveRecord::Base
  validates :fan_id, :title, :date_made, presence: true
  belongs_to :fan
end
