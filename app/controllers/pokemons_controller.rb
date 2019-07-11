class PokemonsController < ApplicationController

    def index
        @pokemons = Pokemon.all
    end

    def new
        @pokemon = Pokemon.new
    end

    def create
        @pokemon = Pokemon.new(pokemon_params)
        if @pokemon.save
            redirect_to pokemons_path
        else
            render 'new'
        end
    end

    private
        def pokemon_params
            params.require(:pokemon).permit(:number, :form_id, :name, :level)
        end


end
