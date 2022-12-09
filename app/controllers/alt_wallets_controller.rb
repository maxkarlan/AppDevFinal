class AltWalletsController < ApplicationController

  def index
    @alt_wallets = AltWallet.all
    render({ :template => "alt_wallets/all_alt_wallets.html.erb"})
  end

  def show
    username = params.fetch("the_username")
    @user_alt_wallets = AltWallet.all.where({ :username => username})
    render({ :template => "alt_wallets/user_alt_wallets.html.erb"})
  end

  def add_alt_wallet

    username = params.fetch("the_username")
    address = params.fetch("input_alt_wallet_address")

    alt_wallet = AltWallet.new
    alt_wallet.username = username
    alt_wallet.alt_wallet_address = address

    alt_wallet.save

    if save_status == true
      session.store( :id, alt_wallet.id)
      end

    redirect_to("/user_alt_wallets/#{alt_wallet.username}")
  end

  def destroy
    #   username = params.fetch("the_username")
    #   username = session.fetch( :username)
    #   user = User.where({ :username => username }).at(0)
       alt_wallet_id = params.fetch("alt_wallet_id")
       alt_wallet = Wallet.where({ :id => alt_wallet_id}).at(0)
   
       alt_wallet.destroy
   
       redirect_to("/users/#{@alt_wallet.username}")
     end

end
