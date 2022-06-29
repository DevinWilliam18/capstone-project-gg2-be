class VolunteersController < ApplicationController
    
    # def new
    #     @ = .new
    # end

    def index
        @volunteers = Volunteer.by_name(params[:letter])
        render json: @volunteers
    end
    
    # def create
    #     @volunteer = Volunteer.new(params[:object])
    #     if @object.save
    #       flash[:success] = "Object successfully created"
    #       redirect_to @object
    #     else
    #       flash[:error] = "Something went wrong"
    #       render 'new'
    #     end
    # end

    # private


    

    
end
