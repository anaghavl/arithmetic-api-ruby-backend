require 'dry-validation'

class InputValidator < Dry::Validation::Contract
  params do
      # Check if the params are numbers
      required(:a).value(:number?)
      required(:b).value(:number?)
  end
end
