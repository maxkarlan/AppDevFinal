class CreateAltWallets < ActiveRecord::Migration[6.0]
  def change
    create_table :alt_wallets do |t|
      t.string :username
      t.string :alt_wallet_address

      t.timestamps
    end
  end
end
