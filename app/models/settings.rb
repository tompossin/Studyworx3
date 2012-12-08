# This class is the core class for the global setting system
# This gem is provided by: https://github.com/binarylogic/settingslogic
# The actual settings are found/edited in config/settings.yml
#
class Settings < Settingslogic
  source "#{Rails.root}/config/settings.yml"
  namespace Rails.env
  
end