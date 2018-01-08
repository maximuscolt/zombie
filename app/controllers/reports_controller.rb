class ReportsController < ApplicationController

    def create
        @survivor = Survivor.find(params[:survivor_id])
        @reporter = Survivor.find(params[:reporter])
        
             @report = Report.new(:survivor_id =>params[:survivor_id],:reporter =>params[:reporter])


             if @report.save
                if Report.where(:survivor_id =>params[:survivor_id]).count >= 3
                    @survivor.update_attribute :infected, true

                end
               render json: @report, status: :created
             else
               render json: @report.errors, status: :unprocessable_entity
             end

    end
end
