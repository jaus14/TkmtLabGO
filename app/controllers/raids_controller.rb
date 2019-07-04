class RaidsController < ApplicationController

    def index
        @raids = Raid.all
    end

end
