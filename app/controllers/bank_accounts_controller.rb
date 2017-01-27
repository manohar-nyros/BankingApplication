class BankAccountsController < ApplicationController
	respond_to :json
	def index
		@home = BankAccount.all
		render json: @home
	end

	def username
		if BankAccount.find_by_username(params[:username])
			@username = BankAccount.find_by_username(params[:username])
			render json: @username
		end		
	end

	def debit
		@error_message = ""
		begin
			ActiveRecord::Base.transaction do 
			 @user = BankAccount.find(params[:user_id])
			 
			 if @user.present?
				if @user.amount >= params[:debits].to_f
					@transaction = Transaction.new
					@transaction.bank_account_id = @user.id
				 	@transaction.remarks = params[:remarks]
				 	@transaction.debits = params[:debits].to_f
				 	@transaction.credits = nil
				 	@transaction.transaction_type = "debit"
				 	if @transaction.save
				 		@user.update_attributes(:amount => @user.amount - params[:debits].to_f )
				 	end
				else
					@error_message = "Please check entered amount"
				end
			 else
			 	@error_message = "User Not Available."
			 end
			end
		rescue => e
			@error_message = "Error while transaction"
		end
		     render json: @user.transactions 
	end	

	def credit
		@error_message = ""
		begin
			ActiveRecord::Base.transaction do 
			 @user = BankAccount.find(params[:user_id])
			 if @user.present?
				@transaction = Transaction.new
				@transaction.bank_account_id = @user.id
			 	@transaction.remarks = params[:remarks]
			 	@transaction.debits = nil
			 	@transaction.credits = params[:credits]
			 	@transaction.transaction_type = "credit"
			 	if @transaction.save
				 	@user.update_attributes(:amount => @user.amount + params[:credits].to_f )
				end
			 else
			 	@error_message = "User Not Available."
			 end
			end
		rescue => e
			@error_message = "Error while transaction"
		end
		     render json: @user.transactions 
	end

	def transactions
		begin
			ActiveRecord::Base.transaction do 
				@user = BankAccount.find(params[:user_id])
				@payee = BankAccount.find(params[:payee_id])
				if @user.present? && @payee.present?
					if @user.amount >= params[:debits].to_f
						@transaction = Transaction.new
						@transaction.bank_account_id = @user.id
				 		@transaction.remarks = params[:remarks]
				 		@transaction.debits = params[:debits]
				 		@transaction.credits = nil
				 		@transaction.transaction_type = "debit"
				 		@transaction.payee_id = params[:payee_id]
				 		if @transaction.save
				 			@user.update_attributes(:amount => @user.amount - params[:debits].to_f )
				 			@payee.update_attributes(:amount => @payee.amount + params[:debits].to_f )
				 		end
					else
						@error_message = "User or Payee Not Available."		
					end
			    else
				end
			end
		rescue => e
			@error_message = "Error while transaction"
		end
		     render json: @user.transactions 
	end

	def transactions_list
		@user = BankAccount.find(params[:user_id])
		@transactions = @user.transactions.order("created_at").last(5)
		render json: @transactions
	end

end