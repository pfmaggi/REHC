require 'rho/rhoapplication'
require 'rexml/document'
#require 'helpers/browser_helper'

class AppApplication < Rho::RhoApplication
  def initialize
    # Tab items are loaded left->right, @tabs[0] is leftmost tab in the tab-bar
    # Super must be called *after* settings @tabs!
    @tabs = nil
    #To remove default toolbar uncomment next line:
    @@toolbar = nil
    super
    
    
    # Get app folder and extract fully qualified application name
    my_path = Rho::RhoApplication.appName
    if (Rho::RhoConfig.exists?("rehc_use_bundle_url")) && ("1" == Rho::RhoConfig.rehc_use_bundle_url)
      Rho::Log.info("Use full BundleURL for configuration folder","APP")
      Rho::Log.info("**** my_path = #{my_path}" ,"APP")
      appFolder = Rho::Application.appBundleFolder
      Rho::Log.info("**** appBundleFolder = #{appFolder}" ,"APP")
      
      # Re-implemented string splitting and searching with a regex
      my_path = /[a-z]{2,}\.[a-z]+\.[a-z]+/.match(appFolder).to_s
#      path_pieces = appFolder.split('/')
#      path_pieces.each do |item|
#        Rho::Log.info("**** item = #{item}" ,"APP")
#        if item.include?('.')
#          items = item.split('.')
#          if items[-1].casecmp(Rho::RhoApplication.appName) == 0
#            my_path = item
#            break
#          end
#        end
#      end
    end
    Rho::Log.info("**** my_path = #{my_path}" ,"APP")

    if Rho::System.isRhoSimulator
      app_data_path = "/Android/data/" + my_path
    else
      app_data_path = Rho::Externalstorage.getSDPath()+ "/Android/data/" + my_path       
    end
    fileName = File.join(app_data_path, '/Config.xml')
    Rho::Log.info("Searching for configuration file: #{fileName}","APP")
    
    start_path = "/app"
    if File.exists?(fileName)
      file = File.new(fileName)
      doc = REXML::Document.new(file)
      doc.elements.each("Configuration/Applications/Application/General/StartPage") { |element| start_path = element.attributes["value"] }
      if start_path.include?("INSTALLDIR")
        Rho::Log.info("Invalid default Start_path: #{start_path}","APP")
        start_path = "/app"
      end  
#    else
      # Configuration file does not exist... do you want to create it?
    end
      
    if (Rho::RhoConfig.exists?("rehc_intercept_button")) && ("1" == Rho::RhoConfig.rehc_intercept_button)
      Rho::Log.info("KeyCapture enabled","APP")

      Rho::KeyCapture.captureKey(true, 'ALL', '/app/Settings/keyCallback')
          
      Rho::KeyCapture.captureKey(false, '0x04') # This is Back Button on MC40 and TC55
      Rho::KeyCapture.captureKey(false, '0x52') # This is Menu Button on MC40 and TC55
    else
      Rho::Log.info("KeyCapture NOT enabled","APP")
    end
    
    Rho::Application.startURI = start_path
    Rho::Log.info("Selected Start Path: #{start_path}","APP")
  end
end
