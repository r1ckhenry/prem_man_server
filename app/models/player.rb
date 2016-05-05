class Player < ActiveRecord::Base
  belongs_to( :club )
  has_one( :brain )
  has_one( :technical )
end
