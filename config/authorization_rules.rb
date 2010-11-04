authorization do
  role :admin do
    has_permission_on [:users], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:certification_levels], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:certifications], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:roles], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:albums], :to => [:index, :new, :create, :edit, :update, :destroy]
    has_permission_on [:photos], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:locations], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:contacts], :to => [:index, :show, :edit, :update, :destroy]
    has_permission_on [:subscribers], :to => [:index, :create, :verify, :destroy]
  end

  role :guest do
    has_permission_on [:certifications], :to => [:index]
    has_permission_on [:albums], :to => [:index]
    has_permission_on [:photos], :to => [:index]
    has_permission_on [:contacts], :to => [:new,:create]
    has_permission_on [:subscribers], :to => [:create, :verify]
  end
end