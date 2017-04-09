FactoryGirl.define do
	factory :task do
	    title "to do something" 
	    description "task description"
	    due_date "2017-04-09"
	    priority 1
	    user_id 1
	end
end 