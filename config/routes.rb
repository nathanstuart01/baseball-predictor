Rails.application.routes.draw do

  root 'games#index'

  #Custom Routes
  get 'scraped_pitching_wars', to: 'pitching_stats#scraped_pitching_wars'
  get 'scraped_batting_wars', to: 'batting_stats#scraped_batting_wars'

  resources :teams do
  end

  resources :games do
  end

end
