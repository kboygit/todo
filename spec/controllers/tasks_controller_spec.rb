require 'rails_helper'
require 'neatjson'

RSpec.describe TasksController, type: :controller do
  describe 'tasks#index' do
    it 'should list the task in the database' do
      task1 = FactoryGirl.create(:task)
      task2 = FactoryGirl.create(:task)
      get :index
      expect(response).to have_http_status :success
      # response_value = ActiveSupport::JSON.decode(@response.body)
      response_value = ActiveSupport::JSON.neat_generate(@response.body)
      expect(response_value.count).to eq(2)
    end
  end
end
