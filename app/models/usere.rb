# == Schema Information
#
# Table name: useres
#
#  id             :integer          not null, primary key
#  username       :string
#  wallet_address :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#
class Usere < ApplicationRecord
end
