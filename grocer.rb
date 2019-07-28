require "pry"

def consolidate_cart(cart)
  cart_hash = {}

    cart.each do |item_hash|

        item_hash.each do |key, value|

          if cart_hash.key?(key)
            cart_hash[key][:count] += 1
          else
            cart_hash[key] = value
            cart_hash[key][:count] = 1
          end
        end
    end
  cart_hash
end


def apply_coupons(cart, coupons)
  
  coupons.each do |coupon|
    item = coupon[:item]
    if cart[item] && cart[item][:count] >= coupon[:num]  
      
      if cart["#{item} W/COUPON"]
         cart["#{item} W/COUPON"][:count] += coupon[:num]
        
      else 
          cart["#{item} W/COUPON"] = { 
            price: coupon[:cost] / coupon[:num],
            clearance: cart[item][:clearance],
            count: coupon[:num]
          }
      end
      cart[item][:count] -= coupon[:num]
    end
  end
  cart
end

def apply_clearance(cart)
   
  #if cart.key?(:clearance) == true
    
    cart.each do |item|
      item.each do |key, value|
      
        if cart[item][:clearance] = !false
        #binding.pry
        original_price = cart[item][:price].round(2)
        discount_rate = 0.20.round(2)
      
        discount_amount = (discount_rate * original_price).float.round(2)
        
        new_discounted_price = (original_price - discount_amount).float.round(2)
     
     cart[item][:price] = new_discounted_price.round(2)
      end
    end 
  end
    cart 
end

def checkout(cart, coupons)
  # code here
end
