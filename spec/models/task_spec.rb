require 'spec_helper'

describe Task do
	it 'New tasks' do
		@task = FactoryGirl.build(:task)
		expect(@task.title).to eq("to do something")
    	expect(@task.description).to eq("task description")
    	expect(@task.priority).to eq(1)
    end
end
