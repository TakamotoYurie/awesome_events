class Ticket < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event

  validates :comment, length: { miximum: 30 }, allow_blank: true
end
