class Users::SessionsController < Devise::SessionsController






protected

def after_sign_in_path_for(resource)
  if resource.is_a?(User) && resource.admin?
    sign_out resource
    flash[:error] = "Esta cuenta esta desactivada"
    root_path
  else
    super
  end
end



end
