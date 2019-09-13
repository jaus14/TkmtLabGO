class RaidsController < ApplicationController

    protect_from_forgery :except => ["update"]

    def index
        @raids = Raid.all
        @pokemons = Pokemon.all
        @places = Place.all
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

    def edit
        @raid = Raid.find(params[:id])
        @pokemons = Pokemon.all
        @places = Place.all
    end

    def update
        @raid = Raid.find(params[:id])
        if @raid.update_attributes(
            pokemon_id: params[:pokemon_id],
            place_id: params[:place_id],
            date: params[:date],
            comment: params[:comment]
        )
        redirect_to raids_path
        else
            render 'index'
        end
    end

    private
        def raid_params
            params.require(:raid).permit(:pokemon_id, :place_id, :date, :comment)
        end



end
