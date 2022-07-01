require 'rails_helper'

RSpec.describe "Volunteers", type: :request do
  describe "GET #index" do
      it "populates an array of volunteers starting with the letter" do
        vol1 = create(:volunteer, org_name: "Peduli Lingkungan")
        vol2 = create(:volunteer, org_name: "Peduli Sampah")
        
        get '/volunteers', params: { letter: 'P' }

        expect(assigns(:volunteers)).to match_array([vol1,vol2])
      end
      
    end

    describe "GET #show" do
      context "when volunteer record is exits" do
        it "assigns the requested volunteer to @volunteer " do

          volunteer = create(:volunteer)
          
          get "/volunteers/#{volunteer.id}"

          expect(assigns(:volunteer)).to eq volunteer
        
        end        
      end

      # context "when volunteer record is empty" do
      #   it "returns" do
          
      #   end
        
      # end
    end
    describe "POST #create" do
      context "inserting records into database with valid parameters" do
        it "inserting a new volunteer into the database" do
          volunteer = FactoryBot.build(:volunteer)
          
          expect{
            post '/volunteers', params: { 
              volunteer: {
                org_name: volunteer.org_name,
                org_email: volunteer.org_email,
                org_phone: volunteer.org_phone,
                org_address: volunteer.org_address,
                org_pass: volunteer.org_pass
              }
            }
          }.to change(Volunteer, :count).by(1)
        end

      end

      # context "inserting records into database with invalid parameters" do
        
      # end
      
    end
    
    describe "POST #update" do
      
      it "updating volunteer with valid params" do
        
        
        volunteer1 = FactoryBot.build(:volunteer)
        put "/volunteers/#{volunteer1.id}"
        
        volunteer2 = FactoryBot.create(:volunteer, org_name: "Virgennion Amburawa", org_email: "amburawa@yahoo.com", org_phone: "081290127865", org_address: "JL. Sultan Hasanudin no 192", org_pass:"jkwiranto112")

        expect(volunteer1.update({
          org_name: "Virgennion Amburawa",
          org_email: "amburawa@yahoo.com",
          org_phone: "081290127865",
          org_address: "JL. Sultan Hasanudin no 192",
          org_pass:"jkwiranto112"
        })).to eq volunteer2 
      end

    end
    
    
    
end
