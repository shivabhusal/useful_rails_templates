
require 'sidekiq/web'
if Rails.env.development?
  mount Sidekiq::Web => '/sidekiq'
else
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
 