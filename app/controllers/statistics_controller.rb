class StatisticsController < ApplicationController

    def infected
         render json: { infected_perc: Statistic.infected }
      end
    def non_infected
      render json: { non_infected_perc: Statistic.non_infected }
    end

    def resources_average
      render json: { resources_average: Statistic.resources_average }
    end

    def points_lost
      render json: { lost_points: Statistic.points_lost }
    end

end
