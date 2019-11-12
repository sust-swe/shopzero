module ProductsHelper
  def searchable_attribs
    ["category", "brand"]
  end

  def search_by_category(objects, value)
    category = Category.find_by(name: value)
    if category.present?
      objects.where("category_id like ?", "#{category.id}")
    else
      Category.none
    end
  end

  def search_by_brand(objects, value)
    brand = Brand.find_by(name: value)
    if brand.present?
      objects.where("brand_id like ?", "#{brand.id}")
    else
      Brand.none
    end
  end

  def search_by_product(value)
    Product.where("name like ?", "%#{value}%")
  end

  def searchable_attribs_json_params
    array = Array.new
    searchable_attribs.each do |attr|
      array.push({ attr.to_sym => { only: [:name, :id, :picture] } })
    end
    return array
  end

  def product_json_params
    [:id, :name, :sales_price, :retail_price, :picture]
  end
end
