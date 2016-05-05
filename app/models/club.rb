class Club < ActiveRecord::Base
  default_scope { order('name ASC') }
  has_many( :players )
  belongs_to( :league )
end
