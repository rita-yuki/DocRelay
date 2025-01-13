class AddEmployeeNumberToUsers < ActiveRecord::Migration[7.0]
  def change
    unless column_exists?(:users, :employee_number)
      add_column :users, :employee_number, :string
      add_index :users, :employee_number, unique: true
  end
 end
end
