class UsersController < ApplicationController

  def authenticate
    un = params.fetch("input_username")
    pw = params.fetch("input_password")

    user = User.where({ :username => un }).at(0)

    if user == nil
      redirect_to("/user_sign_in", { :alert => "No one by that name"})
    else
      if user.authenticate(pw)
        session.store( :user_id, user.id)
        
        redirect_to("/users/#{user.username}", { :notice => "Welcome back, " + user.username})
      else
        redirect_to("/user_sign_in", { :alert => "Try again"})
      end
    end
  end

  def sign_out
    reset_session

    redirect_to("/")
  end

  def new_registration_form
  
    render({ :template => "users/signup_form.html.erb"})
  end

  def new_session_form
  
    render({ :template => "users/signin_form.html.erb"})
  end

  def index
    @users = User.all.order({ :username => :asc })

    render({ :template => "users/index.html.erb" })
  end

  def show

    ## User verification

    the_username = params.fetch("the_username")
    @user = User.where({ :username => the_username }).at(0)

      ## Looks Rare API

      url = URI("https://api.looksrare.org/api/v1/accounts?address=#{@user.wallet_address}")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
  
      request = Net::HTTP::Get.new(url)
      request["accept"] = 'application/json'
  
      response = http.request(request)
      puts response.read_body
  
      raw_data = open(url).read
      @parsed_data = JSON.parse(raw_data) 
  
    render({ :template => "users/show.html.erb" })
  end

  def create

    user = User.new

    user.username = params.fetch("input_username")
    user.wallet_address = params.fetch("input_wallet_address")
    user.password = params.fetch("input_password")
    user.password_confirmation = params.fetch("input_password_confirmation")

    save_status = user.save

    if save_status == true
      session.store(:user_id, user.id)

      redirect_to("/users/#{user.username}", { :notice => "Welcome, " + user.username + "!"})
    else
      redirect_to("/user_sign_up", { :alert => user.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("the_user_id")
    user = User.where({ :id => the_id }).at(0)

    user.username = params.fetch("input_username")

    user.wallet_address = params.fetch("input_wallet_address")

    user.save
    
    redirect_to("/users/#{user.username}")
  end

  def destroy
 #   username = params.fetch("the_username")
 #   username = session.fetch( :username)
 #   user = User.where({ :username => username }).at(0)
    user_id = params.fetch("the_user_id")
    user = User.where({ :id => user_id}).at(0)

    user.destroy

    reset_session

    redirect_to("/users")
  end

  def update_settings
    the_username = session.fetch( :username)
    @user = User.where({ :username => the_username }).at(0)

    render({ :template => "users/settings.html.erb"})
  end

#  def add_alt_wallet

#    the_id = params.fetch("the_user_id")
 #   user = User.where({ :id => the_id }).at(0)

  #  user.username = params.fetch("input_username")

   # user.wallet_address = params.fetch("input_wallet_address")

   # user.save

   # redirect_to("/users/#{user.username}")
  #end
end
