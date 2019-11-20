class RaidsController < ApplicationController

    protect_from_forgery :except => ["update"]
    protect_from_forgery :except => ["attendance"]

    def index
        @raids = Raid.all
        @pokemons = Pokemon.all
        @places = Place.all
        @users = User.all
        @login_user = User.find(session[:user_id])
    end

    def new
        @raid = Raid.new
        @pokemons = Pokemon.all
        @places = Place.all
    end

    def create
        @raid = Raid.new(
            pokemon_id: params[:pokemon_id],
            place_id: params[:place_id],
            date: params[:date],
            comment: params[:comment]
        )
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

    def show
      @raid = Raid.find(params[:id])
      @pokemon = Pokemon.find(@raid[:pokemon_id])
      @place = Place.find(@raid[:place_id])
      @users = User.all
      @login_user = User.find(session[:user_id])
      @attendances = Attendance.where(raid_id: params[:id])
    end

    def attendance
      @status_id = params[:attend] ? 2 : params[:thinking] ? 4 : 3
      @attendance = Attendance.find_or_create_by(
        raid_id: params[:id],
        user_id: session[:user_id]
      )
      @attendance.update_attributes(
        status_id: @status_id
      )
      if @attendance.save
          redirect_to '/raid/'+params[:id]+'/show'
      end
    end

    private
        def raid_params
            params.require(:raid).permit(:pokemon_id, :place_id, :date, :comment)
        end

end
