class Watch < ApplicationRecord
  belongs_to :user , optional: true 
  belongs_to :movie , optional: true 
end
