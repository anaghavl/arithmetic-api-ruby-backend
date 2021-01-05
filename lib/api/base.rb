require 'roda'
require 'json'
require 'dry-validation'
require './lib/schema/input_validator.rb'

module API
  class Base < Roda
    plugin :json

    # main route - /arithmetic
    # branch routes - /add, /sub, /mul, /div

    route do |r|

      r.get "add" do
        # Validate the input variables
        validation = InputValidator.new.call(r.params)
        if validation.success?
          num1 = r.params['a'].to_f;
          num2 = r.params['b'].to_f;
          # Return addition result
          { result: num1 + num2 }
        else
          # Return error if validation fails
          validation.errors.to_h
        end
      end

      r.get "sub" do
        # Validate the input variables
        validation = InputValidator.new.call(r.params)
        if validation.success?
          num1 = r.params['a'].to_f;
          num2 = r.params['b'].to_f;
          # Return subtraction result
          { result: num1 - num2 }
        else
          # Return error if validation fails
          validation.errors.to_h
        end
      end

      r.get "mul" do
        # Validate the input variables
        validation = InputValidator.new.call(r.params)
        if validation.success?
          num1 = r.params['a'].to_f;
          num2 = r.params['b'].to_f;
          # Return multiplication result
          { result: num1 * num2 }
        else
          # Return error if validation fails
          validation.errors.to_h
        end
      end

      r.get "div" do
        # Validate the input variables
        validation = InputValidator.new.call(r.params)
        if validation.success?
          num1 = r.params['a'].to_f;
          num2 = r.params['b'].to_f;
          if num2 != 0
            # Return division result if denominator is not 0
            { result: num1 / num2 }
          else
            { result: "Denominator cannot be 0" }
          end
        else
          # Return error if validation fails
          validation.errors.to_h
        end
      end
    end
  end
end