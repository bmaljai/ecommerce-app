class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  belongs_to :user

  
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
    if images == nil
      return "http://www2.psd100.com/wp-content/uploads/2013/03/white-product-box-psd-20130309.jpg"
    elsif images == ""
      return "http://www2.psd100.com/wp-content/uploads/2013/03/white-product-box-psd-20130309.jpg"
    else
      return images
    end
  end

  # def first_image
  #   return Image.find_by(product_id: id).url
    
  # end


end
