class Task < ApplicationRecord
	validates :title, :description, :due_date, :priority, :user_id, presence: true 
    validates :priority, numericality: { only_integer: true }
    belongs_to :user
   
end
