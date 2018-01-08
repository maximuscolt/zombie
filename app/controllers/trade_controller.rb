class TradeController < ApplicationController

    def create
        
        @json_traders = JSON.parse(request.raw_post)
        @trader1 = Survivor.find(@json_traders[0]["survivor_id"])
        @trader2 = Survivor.find(@json_traders[1]["survivor_id"])
        if @trader1.infected or @trader2.infected
            raise "survivor infected cannot trade"
        else
            @a = Array.new
                @json_traders[0]["items"].each do |resource, quantity|
                @a.push(id: Resource.named(resource).id,value: Resource.named(resource).point, quantity: quantity)
                end
            
            @b = Array.new
                @json_traders[1]["items"].each do |resource, quantity|
                @b.push(id: Resource.named(resource).id,value: Resource.named(resource).point, quantity: quantity)
                end

                # @a.sum{@a["value"]*@a["quantity"]}
                @trade = Trade.new(@a,@b,@trader1,@trader2)
              
    
                
                

        render json:  @trade.complete.to_json
      
#@trader1.inventories.find_by(resource_id: 1).quantity
        # @json_traders[1]["items"]
        end
    end

end
