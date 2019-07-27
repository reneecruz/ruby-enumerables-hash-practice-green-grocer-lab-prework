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
  
   cart.each do |item|
     if cart[item][:clearance] 
 
      discount = 0.325
      original_price = cart[item][:price]
      discounted_price = discount * original_price
    
        cart[item][:price] = discounted_price.round
     end
        binding.pry
    end 
    cart 
end

def checkout(cart, coupons)
  # code here
end
