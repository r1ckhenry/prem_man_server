class Manager < ActiveRecord::Base
  belongs_to( :club )
  belongs_to( :game )
end
