class Adventure < ApplicationRecord
  belongs_to :user

  enum stress_level: ["Very Low", "Low", "Moderate", "High", "Very High"]
end
