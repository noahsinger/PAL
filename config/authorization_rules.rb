authorization do
  role :admin do
    has_permission_on [:users, :certification_levels, :certifications], :to => [:index, :show, :new, :create, :edit, :update, :destroy]  
  end

  role :guest do
    has_permission_on [:certifications], :to => [:index]
  end
end