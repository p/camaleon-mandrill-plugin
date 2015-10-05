Rails.application.routes.draw do

  #Admin Panel
  scope 'admin', as: 'admin' do
    namespace 'plugins' do
      namespace 'camaleon_mandrill' do
        get 'settings' => 'admin#settings'
        post 'settings' => 'admin#save_settings'
      end
    end
  end
end
