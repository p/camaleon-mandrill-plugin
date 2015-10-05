class Plugins::CamaleonMandrill::AdminController < Apps::PluginsAdminController

  def settings
    @mandrill = current_site.get_meta('mandrill_config')
  end

  def save_settings
    current_site.set_meta('mandrill_config',
                          {
                            smtp_username: params[:mandrill][:smtp_username],
                            smtp_password: params[:mandrill][:smtp_password],
                            default_from: params[:mandrill][:default_from],
                          })
    flash[:notice] = "#{t('plugin.mandrill.messages.settings_saved')}"
    redirect_to action: :settings
  end
end

