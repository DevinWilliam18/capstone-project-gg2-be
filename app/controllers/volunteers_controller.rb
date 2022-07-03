class VolunteersController < ApplicationController
  before_action :set_volunteer, only: %i[ show update destroy]

  def index
      @volunteers = params[:letter].nil? ? Volunteer.all : Volunteer.by_name(params[:letter])
      
      render json: @volunteers
  end
  
  def show
      render json: @volunteer
  end
  
  
  def create
      @volunteer_1 = Volunteer.new(volunteer_params)
      if @volunteer_1.save
        render json: @volunteer_1, status: :created
      else
        render error: {error: 'Unable to create volunteer.'}, status: 400
      end
  end

  def update
      if @volunteer.update(volunteer_params)
        render json: @volunteer, status: :created
      # else
      #   flash[:error] = "Something went wrong"
      #   render 'edit'
      end
  end
  
  # def login
  #   res = Volunteer.by_email_and_pass(login_params)?

  #   if res
  #     render json: {response: "successfuly login"}
    
  #   else  
  #     flash[:alert] = "User not found."
  #   end

    
    
  # end
  
  def destroy
    @volunteer.destroy
  end
  
  def login
    res = Volunteer.by_email_and_pass(login_params)

    if res.present? 
      # ret = {status: "success", code: 202}
      redirect_to action: "show", id: res[:id] and return
    
    else  
      render json: {status: :not_found, code: 404}
    end
  end

  private
    def set_volunteer
      @volunteer = Volunteer.find(params[:id])
    end
    def volunteer_params
      params.require(:volunteer).permit(:org_name, :org_email, :org_phone, :org_address, :org_pass)
    end

    def login_params
      params.require(:volunteer).permit(:org_email, :org_pass)
    end

end

