class Order < ApplicationRecord   

   has_one :item
   belongs_to :user
   has_one :delivery

end
