ExamController::Application.routes.draw do
  devise_for :users, :controllers => { :sessions => 'sessions'}
  root to: "home#home_page"

  resources :employees do
    collection do
      get "hierarchy"
    end
  end

  resources :courses

  resources :results do
    collection do
      get "result_upload"
      post "upload"
    end
  end

  get 'auto_search/autocomplete_course_name'
  post "employees/:id" => "employees#update"

end
