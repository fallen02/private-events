class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :time, presence: true
  validates :date, presence: true
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
end
