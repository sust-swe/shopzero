module ProductsHelper

    def searchable_attribs
      ["category","brand","product" ]
    end

    def search_by_category(objects,value)
      category = Catagory.find_by(name:value)
      if category.present?
        objects.where('catagory_id like ?', "%#{category.id}%")
      else
        Catagory.none
      end
    end

    def search_by_brand(objects,value)
      brand = Brand.find_by(name:value)
      if brand.present?
        objects.where('brand_id like ?', "%#{brand.id}%")
      else
        Brand.none
      end
    end

    def search_by_product(value)
      Product.where("name like ?", "%#{value}%")
    end
    
end
