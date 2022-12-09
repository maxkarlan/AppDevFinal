class WalletsController < ApplicationController
  def index
    @wallets = Wallet.all
    render({ :template => "wallets/all_wallets.html.erb"})
  end

  def create
    user_id = session.fetch(:user_id)
    wallet = Wallet.new
    wallet.owner_id = user_id
    wallet.save
    redirect_to("/wallets/#{wallet.id}")
  end

  def show
    p_id = params.fetch("the_photo_id")
    @photo = Photo.where({:id => p_id }).first
    render({:template => "photos/details.html.erb"})
  end

  def destroy
    id = params.fetch("the_photo_id")
    photo = Photo.where({ :id => id }).at(0)
    photo.destroy

    redirect_to("/photos")
  end

  def update
    id = params.fetch("the_photo_id")
    photo = Photo.where({ :id => id }).at(0)
    photo.caption = params.fetch("input_caption")
    photo.image = params.fetch("input_image")
    photo.save

    redirect_to("/photos/#{photo.id}")
  end
end
