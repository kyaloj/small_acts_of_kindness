Rails.application.routes.draw do
  get 'hello_angular/index'
  root 'hello_angular#index'
end
