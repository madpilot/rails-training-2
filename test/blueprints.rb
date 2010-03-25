require 'machinist/active_record'
require 'sham'

Stock.blueprint do
  code { Faker::Company.name }
end
