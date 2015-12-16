class PressItem < ActiveRecord::Base
  validates :fan_id, :title, :publisher, :body, presence: true
  belongs_to :fan

end
