# README

# Architecture 

lib


 -> api
 
 
    -> base.rb
    
    * The endpoints of the arithmetic APIs are placed in `base.rb` using Roda routing tree.

 -> schema
 
 
    -> input_validator.rb
    
    * The logic for validation of input is placed in `input_validator.rb` using dry-validation
 
 spec
 
 
  -> base_spec.rb 
  
  * Good case tests for the different routes
  
  
  
  -> input_validator_spec.rb
  
  * Bad case tests for each error

# To Run: 
bin/rails s
# To run tests: 
bundle exec rspec ./path_of_the_file.rb
