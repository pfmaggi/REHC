require 'rho/rhoapplication'
require 'rexml/document'

class AppApplication < Rho::RhoApplication
  def initialize
    # Tab items are loaded left->right, @tabs[0] is leftmost tab in the tab-bar
    # Super must be called *after* settings @tabs!
    @tabs = nil
    #To remove default toolbar uncomment next line:
    @@toolbar = nil
    super
    
    app_data_path = Rho::Externalstorage.getSDPath()+ "/Android/data/" + Rho::RhoApplication.appName       
    fileName = File.join(app_data_path, '/Config.xml')
    puts '****' + fileName
    
    file = File.new(fileName)
    doc = REXML::Document.new(file)
    
    start_path = "/app"
    doc.elements.each("Configuration/Applications/Application/General/StartPage") { |element| start_path = element.attributes["value"] }
        
    Rho::Application.startURI = start_path
    puts '****' + start_path
  end
end
