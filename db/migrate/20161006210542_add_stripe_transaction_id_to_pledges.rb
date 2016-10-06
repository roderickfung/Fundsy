class AddStripeTransactionIdToPledges < ActiveRecord::Migration[5.0]
  def change
    add_column :pledges, :stripe_transaction_id, :string
  end
end
