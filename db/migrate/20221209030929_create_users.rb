class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :wallet_address
      t.string :password_digest
      t.boolean :private

      t.timestamps
    end
  end
end