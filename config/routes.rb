Rails.application.routes.draw do
  root 'pages#home'

  get 'scans/high_low'

  get 'pages/examples'
  get 'pages/about'
  get 'pages/contact'
end
