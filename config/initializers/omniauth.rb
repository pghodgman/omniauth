# this configures the target providers to support for open id
# we support two for now but they have differing requirements for use
#
# google - just standard support and it works fine as is due to the flexibility google provides in its openid implementation
# autodesk - just standard support, but it requires that the source of the request (domain) be registered - as such you must use with
# an domain that has been registered (http://cd360-staging.autodesk.com) - as an example cd360-staging is registered.
#

Rails.application.config.middleware.use OmniAuth::Builder do
  require 'openid/store/filesystem'

  provider :openid, :name => 'google',
           :identifier => 'https://google.com/accounts/o8/id',
           :store => OpenID::Store::Filesystem.new('/tmp')
  provider :openid, :name => 'autodesk',
           :identifier => 'https://accounts-staging.autodesk.com', #'https://google.com/accounts/o8/id',
           :store => OpenID::Store::Filesystem.new('/tmp')
end