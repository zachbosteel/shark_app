class Shark < ActiveRecord::Base
  validates :common_name, presence: true
  validates :latin_name, presence: true
  validates :habitat_range, presence: true
  validates :attacks_on_humans, presence: true
  validates :attacks_on_humans, numericality: true
end
