Rails.application.routes.draw do

  #Admin Panel
  scope 'admin', as: 'admin' do
    namespace 'plugins' do
      namespace 'camaleon_mandrill' do
        get 'settings' => 'admin#settings'
        post 'settings' => 'admin#settings'
      end
    end
  end
end
