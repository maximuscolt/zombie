class Statistic 

    def self.infected
        if Survivor.count > 0
          ((Survivor.where(infected: true).count.to_f / Survivor.count)*100).round(2)
        else
          0
        end
    end

    def self.non_infected
        100 - infected
    end

    def self.resources_average
        @resources = Resource.all
        @survivor = Survivor.where(infected: nil).select("id")
       
        @qut = Inventory.where(survivor_id: @survivor).joins(:resource).select("resources.item,  CAST(sum(inventories.quantity)AS FLOAT)/#{@survivor.count} as average").group("resources.item")
        
       
    end

    def self.points_lost
        Inventory.includes(:survivor, :resource).where(survivors: { infected: true }).sum("inventories.quantity * resources.point")
      end
end
