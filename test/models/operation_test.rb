require "test_helper"

class OperationTest < ActiveSupport::TestCase
  test "check the operation 'one' amount from database" do
    operation_first = operations[0]
    assert_equal(9.99, operation_first['amount'])
  end

  test "return false if amount is missed" do
    new_operation = Operation.new(odate: '2023-06-22 18:23:24', description: 'description_example', category: Category.find_by(name: 'one'))
    assert_not(new_operation.valid?)
  end

  test "return false if odate is missed" do
    new_operation = Operation.new(amount: '100', description: 'description_example', category: Category.find_by(name: 'one'))
    assert_not(new_operation.valid?)
  end

  test "return false if description is missed" do
    new_operation = Operation.new(amount: '100', odate: '2023-06-22 18:23:24',  category: Category.find_by(name: 'one'))
    assert_not(new_operation.valid?)
  end

  test "return false if category is missed" do
    new_operation = Operation.new(amount: '100', odate: '2023-06-22 18:23:24', description: 'description_example')
    assert_not(new_operation.valid?)
  end

  test "saving and gathering" do
    new_operation = Operation.new(amount: '100', odate: '2023-06-22 18:23:01', description: 'description_example', category: Category.find_by(name: 'Category_1'))
    new_operation.save()
    operation_new = Operation.find_by(odate: '2023-06-22 18:23:01')
    assert_equal(100, operation_new.amount)
  end

end
