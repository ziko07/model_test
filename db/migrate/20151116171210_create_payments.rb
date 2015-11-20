class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.text :bkash_transaction
      t.integer :user_id
      t.integer :amount
      t.boolean :is_approved, :default => false
      t.boolean :is_rejected, :default => false

      t.timestamps null: false
    end
  end
end
