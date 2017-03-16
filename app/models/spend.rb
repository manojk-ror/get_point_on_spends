class Spend < ApplicationRecord
  belongs_to :user
  after_save :calculate_and_store_points

  def calculate_and_store_points
  	self.update_columns(points: (spend_amount.to_i / 20))
  end
end
