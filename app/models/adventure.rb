class Adventure
  include Mongoid::Document
  field :user_id, type: String
  field :activity, type: String
  field :hours_slept, type: Integer
  field :date, type: Date
  field :diet_hydration_notes, type: String
  field :sleep_stress_notes, type: String
  field :beta_notes, type: String
  field :image_url, type: String
  field :stress_level, type: String
  field :hydration, type: String
  field :diet, type: String
 
  belongs_to :user

  # enum stress_level: ["Very Low", "Low", "Moderate", "High", "Very High"]
end
