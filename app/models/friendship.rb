class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  scope :pending, -> { where(status: false) }
  scope :accepted, -> { where(status: true) }
end
