ExamController::Application.routes.draw do
  root to: "home#home_page"

  resources :employees do
    collection do
      get "hierarchy"
    end
  end

  post "employees/:id" => "employees#update"

end
