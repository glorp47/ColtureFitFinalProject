class Image < ActiveRecord::Base
  belongs_to :fan
  validates :fan_id, presence: true
end
