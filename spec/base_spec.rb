require './lib/api/base'
require 'rails_helper'


RSpec.describe "get all arithmetic route", :type => :request do

  #Good case tests for the different routes
  describe 'Test the branches of the arithmetic routes' do
    it '/add route' do
      expect(get '/arithmetic/add').to eq(200)
    end

    it '/sub route' do
      expect(get '/arithmetic/sub').to eq(200)
    end

    it '/mul route' do
      expect(get '/arithmetic/mul').to eq(200)
    end

    it '/div route' do
      expect(get '/arithmetic/div').to eq(200)
    end
  end
end 
