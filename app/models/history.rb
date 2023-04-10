class History < ApplicationRecord

  # Association
  has_one :item
  belongs_to :user

end
