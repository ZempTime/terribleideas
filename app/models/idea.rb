class Idea < ApplicationRecord
  belongs_to :user, required: false

  validates_presence_of :text
end
