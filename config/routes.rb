QuestoesVf::Application.routes.draw do
  # Comentarios Routes
  resources :comentarios, :only => [:new, :create, :destroy]
  
  # Main Routes
  root :to => 'home#index'

  # Prova Routes
  resources :provas, :except => [:index] 
  match 'provas/:id/pre_do/:estudante_id' => 'provas#pre_do', :via => :get, :as => 'pre_do_test' ## |
  match 'provas/:id/do/:estudante_id' => 'provas#index', :via => [:post, :get], :as => 'do_test'         ## | INICIAR PROVA -> FAZER PROVA -> ENVIAR PROVA
  match 'provas/:id/do' => 'provas#do', :via => :post, :as => 'submit_do_test'                   ## |

  # Estudante Routes
  match 'estudantes/:estudante_id' => 'estudantes#index', :as => 'index_estudantes'

  # Professor Routes
  match 'professores/:professor_id' => 'professors#index', :as => 'index_professores'

  # Relatório Routes
  match 'relatorios' => 'relatorios#index', :via => :get
  match 'relatorios' => 'relatorios#report', :via => :post, :as => 'report'
  match 'relatorios/texto' => 'relatorios#texto', :via => :post
  match 'relatorios/excel' => 'relatorios#excel', :via => :post


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end