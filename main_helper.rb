module Plugins::Mandrill::MainHelper

  def mandrill_on_destroy(plugin)
  end

  def self.included(klass)
    # klass.helper_method [:my_helper_method] rescue "" # here your methods accessible from views
  end

  # here all actions on going to active
  # you can run sql commands like this:
  # results = ActiveRecord::Base.connection.execute(query);
  # plugin: plugin model
  def mandrill_on_active(plugin)
    current_site.set_meta('mandrill_config',
                          {
                            smtp_username: '',
                            smtp_password: ''
                          })
  end

  # here all actions on going to inactive
  # plugin: plugin model
  def mandrill_on_inactive(plugin)
  end

  # here all actions to upgrade for a new version
  # plugin: plugin model
  def mandrill_on_upgrade(plugin)
  end

  def mandrill_plugin_options(arg)
    arg[:links] << link_to(t('plugin.mandrill.settings.link_name'), admin_plugins_mandrill_settings_path)
  end

  def mandrill_email(plugin)
    mandrill_data_config = current_site.get_meta('mandrill_config')

    plugin[:mail_data][:delivery_method] = :smtp
    plugin[:mail_data][:delivery_method_options] = {
      user_name: mandrill_data_config[:smtp_username],
      password: mandrill_data_config[:smtp_password],
      address: 'smtp.mandrillapp.com',
      port: '587',
      domain: (current_site.the_url.to_s.parse_domain rescue 'localhost'),
      authentication: 'plain',
      enable_starttls_auto: true
    }
  end
end
