class Trade 
  
    def initialize(a, b, trader1, trader2)
        @a = a
        @b = b
        @trader1 = trader1
        @trader2 = trader2
      end
    def calc 
      @b.sum {|h| h[:quantity]*h[:value] } == @a.sum {|h| h[:quantity]*h[:value] } 
    end

    def enough
        
    @a.each  {|x|
    begin
        raise "not enough itemsrt" unless @trader1.inventories.find_by(resource_id: x.values[0]).quantity >= x.values[2]
    rescue  NoMethodError => e
        raise "item not found"
    end
        
    }
    @b.each  {|x|
        begin
            raise "not enough items" unless @trader2.inventories.find_by(resource_id: x.values[0]).quantity >= x.values[2]
            
        rescue  NoMethodError => e
            raise "item not found"
        end
               
    }


    ActiveRecord::Base.transaction do
    @a.each  {|x|
        @trader1.inventories.find_by(resource_id: x.values[0]).decrement!(:quantity,x.values[2])
        Inventory.where(resource_id: x.values[0],survivor_id:@trader2.id).first_or_create.increment!(:quantity,x.values[2])
        
        
    }

    @b.each  {|x|
        @trader2.inventories.find_by(resource_id: x.values[0]).decrement!(:quantity,x.values[2])
        Inventory.where(resource_id: x.values[0],survivor_id:@trader1.id).first_or_create.increment!(:quantity,x.values[2])
    }
    end
      
    end

    def infected
        not (@trader1.infected? or @trader2.infected?)
    end


    def complete
        raise "infected" unless infected
        raise "unbalanced" unless calc
        enough
        
    end
end
