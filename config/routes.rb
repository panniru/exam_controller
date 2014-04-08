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

  resources :students do
    collection do
      get "new_upload"
      post "upload"
    end
  end

  get 'auto_search/autocomplete_course_name'
  get 'auto_search/autocomplete_faculty_name'
  get 'auto_search/autocomplete_student_by_roll_no_and_name'

  
  post "employees/:id" => "employees#update"
  get "org_chart" => "employees#hierarchy"

  get "notifications/new"
  get "notifications/edit"
  get "notifications/show"
  get "notifications/destroy"
  get "notifications/notification"
  get "home/feedback"

  get "notifications/preview"
  get "home/adminhome"
  get "feedbacks/show"

 resources :notifications do
    collection do 
      post "preview"
      end
    member do
      end
    end
  resources :feedbacks do
    collection do 
      end
    member do
      end
    end

  resources :welcomes
   
end
