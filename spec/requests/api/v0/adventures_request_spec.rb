require "rails_helper"

RSpec.describe "Adventures API" do
  describe "happy path" do
    it "can create an adventure" do
      user = User.create!(name: "Bob", email: "bob@gmail.com", password_digest: "password")
      headers = {"CONTENT_TYPE" => "application/json"}

      body = {
        "data": [
               {
                   "type": "adventure",
                   "user_id": 12,
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
           ]
       }

      post "/api/v0/user/adventures", headers: headers, params: body.to_json

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response.body).to eq("Adventure successfully logged")
    end
  end
end