class AlbumsController < ApplicationController

    def show
        @album = Album.find(params[:id])
        render json: @album
    end

    def index
        @albums = Album.all
        render json: @albums
    end

end
