ExamController::Application.routes.draw do
  devise_for :users, :controllers => { :sessions => 'sessions'}
  root to: "home#home_page"

  resources :employees do
    collection do

    end
  end

  resources :courses do
    member do
      get "course_subjects"
    end
    collection do
      get "course_sems"
    end
  end

  resources :results do
    collection do
      get "result_upload"
      post "upload"
    end
  end

  resources :faculties
  resources :how_tos

  resources :students do
    collection do
      get "new_upload"
      post "upload"
    end
  end

  resources :documents do
    member do
      get "download"
    end
  end

  get 'auto_search/autocomplete_course_name'
  get 'auto_search/autocomplete_faculty_name'
  get 'auto_search/autocomplete_student_by_roll_no_and_name'
  get 'auto_search/autocomplete_how_to_name'
  get 'auto_search/autocomplete_document_filename'
  get 'auto_search/autocomplete_calendar_course'
  
  post "employees/:id" => "employees#update"
  get "org_chart" => "employees#hierarchy"

  resources :calendars do
    collection do
      
    end
  end

end
