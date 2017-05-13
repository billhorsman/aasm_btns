Rails.application.routes.draw do
  root to: redirect('/job')
  resource :job do
    member do
      patch 'run'
      patch 'clean'
      patch 'sleep'
      patch 'alarm'
      patch 'fix'
    end
  end
end
