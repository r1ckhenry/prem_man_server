class Game < ActiveRecord::Base
  has_many( :managers )
end
