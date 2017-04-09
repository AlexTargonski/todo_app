require 'spec_helper'

describe Task do
	it 'New tasks' do
		@task = FactoryGirl.build(:task)
		expect(@task.title).to eq("to do something")
    	expect(@task.description).to eq("task description")
    	expect(@task.priority).to eq(1)
    	expect(@task.user_id).to eq(1)
    end

    context 'valid' do
	    subject { FactoryGirl.create(:task) } 
	    it { should be_valid(:title ) }
	    it { should be_valid(:description) }
	    it { should be_valid(:priority) } 
	    it { should be_valid(:due_date) }
   end
end
