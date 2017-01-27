Rails.application.routes.draw do
  resources :posts, defaults: {format: :json}
  resources :bank_accounts, defaults: {format: :json}
  root 'posts#index'
  get '/username' => "bank_accounts#username"
  get '/banking_list' => "bank_accounts#index"
  get '/debit' => "bank_accounts#debit"
  get '/credit' => "bank_accounts#credit"
  get 'transactions' => "bank_accounts#transactions"
  get 'transactions_list' => "bank_accounts#transactions_list"
end
