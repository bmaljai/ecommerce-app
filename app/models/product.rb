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

  def image?
    if image == nil
      return "http://www2.psd100.com/wp-content/uploads/2013/03/white-product-box-psd-20130309.jpg"
    elsif image == ""
      return "http://www2.psd100.com/wp-content/uploads/2013/03/white-product-box-psd-20130309.jpg"
    else
      return image
    end
  end

  






end
