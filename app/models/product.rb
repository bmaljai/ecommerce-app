class Product < ActiveRecord::Base
  
  def sale_message
    if price.to_i < 2
      return "This item is on sale"
    else
      return "Normal Price"
    end
  end

  def tax
    return (0.09 * price.to_i)
  end

  def total
    return (tax + price.to_i)
  end

  def self.get_discounted
    #return Product.where("price < ?", 2)
  end




end
