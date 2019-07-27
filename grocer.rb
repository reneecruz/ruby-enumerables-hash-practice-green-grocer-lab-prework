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
  coupons_applied_hash = {}
  
  coupons.each do |coupon|
    item = coupon[:item]
    coupon.each do |key, value|
      
      if item_hash[:item].value?(value) == cart.key?(key)
        coupons_applied_hash[key] = item_hash[:item].value
      
      if item_hash.key?(key)
        coupons_applied_hash[key] = value

      end
      
    end
    
  end
  cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
