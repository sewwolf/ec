class Cart < ApplicationRecord
  class Cart < ApplicationRecord
    has_many :items, dependent: :destroy
  
    def add_item(product_id:, quantity:)
      item = items.find_by(product_id: product_id) || items.build(product_id: product_id)
      item.quantity += quantity.to_i
      item.save
    end
  
    def update_item(product_id:, quantity:)
      items.find_by(product_id: product_id).update(quantity: quantity.to_i)
    end
  
    def delete_item(product_id:)
      items.find_by(product_id: product_id).destroy
    end
  
    def total_price
      items.sum("quantity*price")
    end
  end
end
