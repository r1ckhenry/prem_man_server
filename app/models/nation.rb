class Nation < ActiveRecord::Base
  has_many( :clubs )
  has_many( :players )
  has_many( :leagues )
end
