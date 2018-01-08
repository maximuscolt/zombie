class Survivor < ApplicationRecord
    has_many :inventories, dependent: :destroy
  validates_associated :inventories
  validates_presence_of :inventories

 
  

  def inventory=(items)
    items.each do |resource, quantity|
      inventories.build(resource: Resource.named(resource), quantity: quantity)
    end
  end
end
