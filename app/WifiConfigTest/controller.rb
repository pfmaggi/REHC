require 'rho/rhocontroller'
require 'helpers/application_helper'
require 'helpers/browser_helper'

class WifiConfigTestController < Rho::RhoController
  include BrowserHelper
  include ApplicationHelper
  
  def index
    render :back => '/app'
  end

  def run_test_get_EAP_Identity
    objects = Rho::WifiConfig.enumerate
    obj = objects[0]
    res = obj.get_EAP_Identity('jlp_test')
    Alert.show_popup "Rho::WifiConfig.get_EAP_Identity return : #{res.to_s}"
    render :action => :index, :back => '/app'
  end
  
end
