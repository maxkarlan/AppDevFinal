Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index" })

  # User routes

  get("/user_sign_up", { :controller => "users", :action => "new_registration_form" })
  get("/user_sign_out", { :controller => "users", :action => "sign_out" })
  get("/user_sign_in", { :controller => "users", :action => "new_session_form" })

  post("/verify_creds", { :controller => "users", :action => "authenticate" })

end
