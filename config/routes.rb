Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index" })

  # User routes

  get("/user_sign_up", { :controller => "users", :action => "new_registration_form" })
  get("/user_sign_out", { :controller => "users", :action => "sign_out" })
  get("/user_sign_in", { :controller => "users", :action => "new_session_form" })
  get("/settings", { :controller => "users", :action => "update_settings"})

  post("/verify_creds", { :controller => "users", :action => "authenticate" })

  # CREATE
  get("/insert_user_record", {:controller => "users", :action => "create" })

  # READ
  get("/users", {:controller => "users", :action => "index"})
  get("/users/:the_username", {:controller => "users", :action => "show"})

  # UPDATE
  get("/update_user/:the_user_id", {:controller => "users", :action => "update" })
  #get("/update_wallet/:the_user_id", {:controller => "users", :action => "update_wallet" })

  # DELETE
  get("/delete_user/:the_user_id", {:controller => "users", :action => "destroy"})

end
