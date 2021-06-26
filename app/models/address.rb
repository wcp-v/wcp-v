class Address < ApplicationRecord
    belongs_to :customer
    
    def view_address
      self.postcode.to_s + self.address.to_s + self.name.to_s
    end
end
