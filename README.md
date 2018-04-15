# sparta_nasa_api_som

A weekend project which involved writing test scripts for the 3 main features of NASA's Near Earth Object API. Overall an exercise in practicing test driven development and improving our understanding of Ruby.

## Getting Started

Clone the sparta_nasa_api_som folder to your personal computer to begin looking at the test files.

### Prerequisites

This was done in Ruby 2.4.0 older versions may not be compatible. see here for instructions on updating your Ruby version (on Mac)

Necessary Gems
* [httparty](https://github.com/jnunemaker/httparty) - used for api access
* [JSON](https://github.com/flori/json) - used to parse JSON data received from the API

## Running the Tests


Use the command 
```
rspec
```
to run the tests located within this project


In general run the following command in your terminal to get the results of your rspec tests.
```
rspec file_name.rb
```
If, however, you first run
```
rspec --init
```
as we have in all examples here, a spec folder will be created. The rspec command will look for this spec folder and run all ruby test spec files within this folder as well as use the spec_helper file, used to configure rspec layout and function. Note, spec files must end with \_spec

## Built With

Ruby, httpary, JSON and rspec!