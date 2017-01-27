class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.string :username
      t.decimal :amount
      t.timestamps null: false
    end
  end
end