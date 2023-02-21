class Api::PokemonController < ApplicationController

    def index 
        @pokemon = Pokemon.all
        render :index
    end

    def show
        # debugger
        @pokemon = Pokemon.find(params[:id])
        render :show
    end
    
    def create
        @pokemon = Pokemon.new(pokemon_params)
        if @pokemon.save!
            render json: @pokemon
        else
            render json: @pokemon.errors.full_messages, status: 422
        end
    end    
    
    def types
        @types = Pokemon::TYPES
        render json: @types
    end

    def update
        @pokemon = Pokemon.find(params[:id])
        if @pokemon.update(pokemon_params)
            render :show
        else
            render json: @pokemon.errors.full_messages, status: 422
        end
    end

    
    private
    def pokemon_params
        params.require(:pokemon).permit(:name, :number, :poke_type, :attack, :defense, :image_url, :captured )
    end
end
