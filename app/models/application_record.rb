class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.ransackable_attributes(_auth_object = nil)
    []
  end
end
