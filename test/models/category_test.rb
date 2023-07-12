require "test_helper"

class CategoryTest < ActiveSupport::TestCase
   test "check the 'Category_1' name from database" do
     category_first = Category.find_by(name: 'Category_1')
     assert_equal("Category_1", category_first.name)
   end

   test "return false if name is missed" do
     new_category = Category.new(description: 'description_example')
     assert_not(new_category.valid?)
   end

   test "return false if description is missed" do
     new_category = Category.new(name: 'name_example')
     assert_not(new_category.valid?)
   end

   test "saving and gathering" do
     new_category = Category.new(name: 'name_example', description: 'description_example')
     new_category.save()
     category_new = Category.find_by(name: 'name_example')
     assert_equal('description_example', category_new.description)
   end

end
