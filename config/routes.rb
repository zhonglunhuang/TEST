Rails.application.routes.draw do
  # get '/' , to: "index#index"
  root "resumes#index"
  get "/@:user_id" , to: "users#default_resume"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/resumes/my", to: "resumes#my"
  get "/resumes", to: "resumes#index"
  get "/resumes/new", to: "resumes#new", as: "new_resumes"
  post "/resumes", to: "resumes#create"
  get "/resumes/:id", to: "resumes#show" , as:'resume'
  delete "/resumes/:id", to: "resumes#destroy"
  get "/resumes/:id/edit", to: "resumes#edit" ,as: "edit_resume"
  patch "resumes/:id", to: "resumes#update"


  resource :users, only: [:create] do
    get :sign_up
    get :sign_in
  end

  resource :session , only: [:create, :destroy]
end
