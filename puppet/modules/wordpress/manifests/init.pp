# == Class: wordpress
#
# This module manages wordpress
#
# === Parameters
#
# [*install_dir*]
#   Specifies the directory into which wordpress should be installed. Default:
#   /opt/wordpress
#
# [*install_url*]
#   Specifies the url from which the wordpress tarball should be downloaded.
#   Default: http://wordpress.org
#
# [*version*]
#   Specifies the version of wordpress to install. Default: 3.8
#
# [*create_db*]
#   Specifies whether to create the db or not. Default: true
#
# [*create_db_user*]
#   Specifies whether to create the db user or not. Default: true
#
# [*db_name*]
#   Specifies the database name which the wordpress module should be configured
#   to use. Default: wordpress
#
# [*db_host*]
#   Specifies the database host to connect to. Default: localhost
#
# [*db_user*]
#   Specifies the database user. Default: wordpress
#
# [*db_password*]
#   Specifies the database user's password in plaintext. Default: password
#
# [*wp_owner*]
#   Specifies the owner of the wordpress files. You must ensure this user
#   exists as this module does not attempt to create it if missing.  Default:
#   root
#
# [*wp_group*]
#   Specifies the group of the wordpress files. Default: 0 (*BSD/Darwin
#   compatible GID)
#
# [*wp_lang*]
#   WordPress Localized Language. Default: ''
#
#
# [*wp_plugin_dir*]
#   WordPress Plugin Directory. Full path, no trailing slash. Default: WordPress Default
#
# [*wp_additional_config*]
#   Specifies a template to include near the end of the wp-config.php file to add additional options. Default: ''
#
# [*wp_table_prefix*]
#   Specifies the database table prefix. Default: wp_
#
# [*wp_proxy_host*]
#   Specifies a Hostname or IP of a proxy server for Wordpress to use to install updates, plugins, etc. Default: ''
#
# [*wp_proxy_port*]
#   Specifies the port to use with the proxy host.  Default: ''
#
# [*wp_multisite*]
#   Specifies whether to enable the multisite feature. Requires `wp_site_domain` to also be passed. Default: `false`
#
# [*wp_site_domain*]
#   Specifies the `DOMAIN_CURRENT_SITE` value that will be used when configuring multisite. Typically this is the address of the main wordpress instance.  Default: ''
#
# [*wp_debug*]
#   Specifies the `WP_DEBUG` value that will control debugging. This must be true if you use the next two debug extensions. Default: 'false'
#
# [*wp_debug_log*]
#   Specifies the `WP_DEBUG_LOG` value that extends debugging to cause all errors to also be saved to a debug.log logfile insdie the /wp-content/ directory. Default: 'false'
#
# [*wp_debug_display*]
#   Specifies the `WP_DEBUG_DISPLAY` value that extends debugging to cause debug messages to be shown inline, in HTML pages. Default: 'false'
#
# === Requires
#
# === Examples
#
class wordpress (
  $install_dir          = '/opt/wordpress',
  $install_url          = 'http://wordpress.org',
  $version              = 'latest',
  $create_db            = true,
  $nginx_site           = false,
  $create_db_user       = true,
  $db_name              = 'wordpress',
  $db_host              = 'localhost',
  $db_user              = 'wordpress',
  $listen               = '',
  $db_password          = 'password',
  $wp_owner             = 'root',
  $wp_group             = '0',
  $wp_lang              = '',
  $wp_config_content    = undef,
  $wp_plugin_dir        = 'DEFAULT',
  $wp_additional_config = 'DEFAULT',
  $wp_table_prefix      = 'wp_',
  $wp_proxy_host        = '',
  $wp_proxy_port        = '',
  $wp_multisite         = false,
  $wp_site_domain       = '',
  $wp_debug             = false,
  $wp_debug_log         = false,
  $wp_debug_display     = false,
) {
  wordpress::instance { $install_dir:
    install_dir          => $install_dir,
    install_url          => $install_url,
    version              => $version,
    create_db            => $create_db,
    create_db_user       => $create_db_user,
    db_name              => $db_name,
    db_host              => $db_host,
    db_user              => $db_user,
    db_password          => $db_password,
    nginx_site           => $nginx_site,
    wp_owner             => $wp_owner,
    listen               => $listen,
    wp_group             => $wp_group,
    wp_lang              => $wp_lang,
    wp_config_content    => $wp_config_content,
    wp_plugin_dir        => $wp_plugin_dir,
    wp_additional_config => $wp_additional_config,
    wp_table_prefix      => $wp_table_prefix,
    wp_proxy_host        => $wp_proxy_host,
    wp_proxy_port        => $wp_proxy_port,
    wp_multisite         => $wp_multisite,
    wp_site_domain       => $wp_site_domain,
    wp_debug             => $wp_debug,
    wp_debug_log         => $wp_debug_log,
    wp_debug_display     => $wp_debug_display,
  }
}
