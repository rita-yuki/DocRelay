class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.date :received_date, null: false
      t.date :start_date, null: false
      t.date :due_date, null: false
      t.string :customer_name, null: false
      t.integer :document_name_id, null: false
      t.integer :quantity_id, null: false
      t.integer :progress_status_id, null: false, default: 1
      t.timestamps
    end
  end
end
