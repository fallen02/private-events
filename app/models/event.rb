class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :time, presence: true
  validates :date, presence: true
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :bookings, foreign_key: 'attended_event_id'
  has_many :attendees, :through => :bookings, source: :attendee

  default_scope {order('date')}
  scope :past, -> { where(date: ..(Time.now)) }
  scope :future, -> { where(date: (Time.now).. ) }
end
