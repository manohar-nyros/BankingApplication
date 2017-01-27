# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
BankAccount.create(username: 'Emanuel', amount: 10000)
BankAccount.create(username: 'John', amount: 20000)
BankAccount.create(username: 'Mike', amount: 30000)
BankAccount.create(username: 'Louise', amount: 25000)
BankAccount.create(username: 'Jin', amount: 15000)

Transaction.create(bank_account_id: 1, payee_id: nil, debits: nil, remarks: nil, transaction_type: "credit", credits: 10000)
Transaction.create(bank_account_id: 2, payee_id: nil, debits: nil, remarks: nil, transaction_type: "credit", credits: 20000)
Transaction.create(bank_account_id: 3, payee_id: nil, debits: nil, remarks: nil, transaction_type: "credit", credits: 30000)
Transaction.create(bank_account_id: 4, payee_id: nil, debits: nil, remarks: nil, transaction_type: "credit", credits: 25000)
Transaction.create(bank_account_id: 5, payee_id: nil, debits: nil, remarks: nil, transaction_type: "credit", credits: 15000)