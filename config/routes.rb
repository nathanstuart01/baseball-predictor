Rails.application.routes.draw do

  root 'teams#index'
  get 'scores', to: 'teams#game_info'


  #Full Crud Routes
  resources :teams

  #Custom Routes
  get 'scraped_pitching_wars', to: 'pitching_stats#scraped_pitching_wars'
  get 'scraped_batting_wars', to: 'batting_stats#scraped_batting_wars'




end
