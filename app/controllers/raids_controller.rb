class RaidsController < ApplicationController

    def index
        @raids = Raid.all
    end

    def new
        @raid = Raid.new
    end

    def create
        @raid = Raid.new(raid_params)
        if @raid.save
            redirect_to raids_path
        else
            render 'new'
        end
    end

    private
        def raid_params
            params.require(:raid).permit(:pokemon_name, :location, :date, :comment)
        end

end
