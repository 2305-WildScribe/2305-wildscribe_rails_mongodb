require "rails_helper"

RSpec.describe "Adventures API" do
  describe "happy path" do
    xit "can create an adventure" do
      user = User.create!(name: "Bob", email: "bob@gmail.com", password_digest: "password")
      headers = {"CONTENT_TYPE" => "application/json"}

      body = {
        "data": 
               {
                   "type": "adventure",
                   "user_id": user.id,
                   "attributes": {
                       "activity": "Running",
                       "date": "10/11/2023",
                       "notes": "Running is hard",
                       "image_url": "https://www.rei.com/dam/parrish_091412_0679_main_lg.jpg",
                       "stress_level": "Very High",
                       "hydration": 128,
                       "diet": "I eat well",
                       "adventure_id": 1
                   }
               }
       }

      post "/api/v0/user/adventures", headers: headers, params: body.to_json

      expect(response).to be_successful
      expect(response.status).to eq(201)

      message = JSON.parse(response.body, symbolize_names: true)

      expect(message[:message]).to eq("Adventure successfully logged")

      adventure = Adventure.last

      expect(adventure.activity).to eq("Running")
      expect(adventure.notes).to eq("Running is hard")
      expect(adventure.image_url).to eq("https://www.rei.com/dam/parrish_091412_0679_main_lg.jpg")
     
      expect(adventure.hydration).to eq(128)
      expect(adventure.diet).to eq("I eat well")
      expect(adventure.user_id).to eq(user.id)
    end
  end
end