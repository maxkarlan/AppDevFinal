# == Schema Information
#
# Table name: alt_wallets
#
#  id                 :integer          not null, primary key
#  alt_wallet_address :string
#  username           :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class AltWallet < ApplicationRecord
end
