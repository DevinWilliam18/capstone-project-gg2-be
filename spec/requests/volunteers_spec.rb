require 'rails_helper'

RSpec.describe "Volunteers", type: :request do
  describe "GET #index" do

    context "with params[:letter]" do
      it "populates an array of volunteers starting with the letter" do
        vol1 = create(:volunteer, org_name: "Peduli Lingkungan")
        vol2 = create(:volunteer, org_name: "Peduli Sampah")
        get :index, params: { letter: 'N' }

        expect(assigns(:volunteers)).to match_array([vol1,vol2])
      end
      
    end
    
    
      
  end


end
