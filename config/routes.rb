Rails.application.routes.draw do
  # CREATE
  get("photos/new", { :controller => "photos", :action => "new_form" })
  get("create_photo", { :controller => "photos", :action => "create_row"})

  # READ
  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:the_id_number", { :controller => "photos", :action => "show" })

  # UPDATE

  # DELETE

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
