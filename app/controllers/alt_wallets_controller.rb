class AltWalletsController < ApplicationController

  def index
    @alt_wallets = AltWallet.all
    render({ :template => "alt_wallets/all_alt_wallets.html.erb"})
  end

  def show
    @username = params.fetch("the_username")
    @user_alt_wallets = AltWallet.all.where({ :username => @username})
    render({ :template => "alt_wallets/user_alt_wallets.html.erb"})
  end

  def create

    username = params.fetch("the_username")
    address = params.fetch("input_alt_wallet_address")

    alt_wallet = AltWallet.new
    alt_wallet.username = username
    alt_wallet.alt_wallet_address = address

    alt_wallet.save

    redirect_to("/user_alt_wallets/#{alt_wallet.username}")
  end

  def destroy
    alt_wallet_id = params.fetch("alt_wallet_id")
    alt_wallet = AltWallet.where({ :id => alt_wallet_id}).at(0)

    alt_wallet.destroy

    redirect_to("/users/#{alt_wallet.username}")
  end

end
