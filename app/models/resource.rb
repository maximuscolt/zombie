class Resource < ApplicationRecord
    def self.named(item)
        find_by item: item
      end
    
      def to_s
        item
      end
end
