module CategoriesControllerHelper
  def any_categories
    Category.count > 0
  end
end
