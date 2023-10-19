class Adventure
  include Mongoid::Document
  field :title, type: String
 
  belongs_to :user

  # enum stress_level: ["Very Low", "Low", "Moderate", "High", "Very High"]
end
