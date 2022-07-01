class VolunteersController < ApplicationController
    

    def index
        @volunteers = params[:letter].nil? ? Volunteer.all : Volunteer.by_name(params[:letter])
        
        render json: @volunteers
    end
    
    def show
        @volunteer = Volunteer.find(params[:id])
        render json: @volunteer
    end
    
    
    def create
        @volunteer = Volunteer.new(volunteer_params)
        if @volunteer.save
          render json: @volunteer, status: :created
        else
        render error: {error: 'Unable to create volunteer.'}, status: 400
        end
    end

    def update
      @volunteer = Volunteer.find_by(id: params[:id])
        if @volunteer.update(volunteer_params)
          render json: @volunteer, status: :created
        # else
        #   flash[:error] = "Something went wrong"
        #   render 'edit'
        end
    end
    
    private
    def volunteer_params
      params.require(:volunteer).permit(:org_name, :org_email, :org_phone, :org_address, :org_pass)
    end

end

