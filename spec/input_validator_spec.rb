require './lib/schema/input_validator.rb'
require 'rails_helper'

RSpec.describe "get all questions route" do

  describe 'Bad case tests for each error' do

    # Tests for missing param values
    context 'When value of a is missing' do
      let(:params) { { b: '3'} }
      it 'throws missing error for a' do
        validation = InputValidator.new.call(params)
        expect(validation.errors.to_h).to eq({:a=>["is missing"]})
      end
    end

    context 'When value of b is missing' do
      let(:params) { { a: '3'} }
      it 'throws missing error for b' do
        validation = InputValidator.new.call(params)
        expect(validation.errors.to_h).to eq({:b=>["is missing"]})
      end
    end

    context 'When value of a and b are missing' do
      let(:params) { { } }
      it 'throws missing error for both variables' do
        validation = InputValidator.new.call(params)
        expect(validation.errors.to_h).to eq({:a=>["is missing"], :b=>["is missing"]})
      end
    end

    # Tests for invaild type param
    context 'When value of a is not a number' do
      let(:params) { { a: 'String', b: '3'} }
      it 'throws must be a number error for a' do
        validation = InputValidator.new.call(params)
        expect(validation.errors.to_h).to eq({:a=>["must be a number"]})
      end
    end

    context 'When value of b is not a number' do
      let(:params) { { a:'3', b: 'String'} }
      it 'throws must be a number error for b' do
        validation = InputValidator.new.call(params)
        expect(validation.errors.to_h).to eq({:b=>["must be a number"]})
      end
    end

    context 'When value of a and b are not numbers' do
      let(:params) { { a:'String', b: 'String'} }
      it 'throws must be a number error for both' do
        validation = InputValidator.new.call(params)
        expect(validation.errors.to_h).to eq({:a=>["must be a number"], :b=>["must be a number"]})
      end
    end
  end
end 
