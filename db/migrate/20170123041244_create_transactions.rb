class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
	  t.belongs_to :bank_account
	  t.integer :payee_id
	  t.decimal :debits, unsigned: true
	  t.string :remarks
	  t.string :transaction_type
	  t.decimal :credits
      t.timestamps null: false
    end
  end
end