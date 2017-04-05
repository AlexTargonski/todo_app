class Task < ApplicationRecord
	validates	:title, :description, :priority, :user_id, presence: true 
	validates	:priority, numericality: { only_integer: true }
    belongs_to	:user
end
