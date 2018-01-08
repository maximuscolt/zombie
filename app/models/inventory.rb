class Inventory < ApplicationRecord
  belongs_to :resource
  belongs_to :survivor

  validates :survivor, uniqueness: { scope: :resource }
end
