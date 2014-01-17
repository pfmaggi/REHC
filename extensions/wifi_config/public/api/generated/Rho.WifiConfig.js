
(function ($, rho, rhoUtil) {
    'use strict';

    var moduleNS = 'Rho.WifiConfig';
    var apiReq = rhoUtil.apiReqFor(moduleNS);
    var currentDefaultID = null;

    // === WifiConfig class definition ===

    function WifiConfig() {
        var id = null;
        this.getId = function () {return id;};

        if (1 == arguments.length && arguments[0][rhoUtil.rhoIdParam()]) {
            if (moduleNS != arguments[0][rhoUtil.rhoClassParam()]) {
                throw "Wrong class instantiation!";
            }
            id = arguments[0][rhoUtil.rhoIdParam()];
        } else {
            id = rhoUtil.nextId();
            // constructor methods are following:
            
        }
    };

    WifiConfig.getId = function() { return currentDefaultID; }

    // === WifiConfig instance properties ===

    rhoUtil.createPropsProxy(WifiConfig.prototype, [
        { propName: 'simpleStringProperty', propAccess: 'rw' }
    ], apiReq, function(){ return this.getId(); });

    // === WifiConfig instance methods ===

    rhoUtil.createMethodsProxy(WifiConfig.prototype, [
    
          // function(/* const rho::String& */ a, /* optional function */ oResult)
          { methodName: 'get_EAP_Identity', nativeName: 'get_EAP_Identity', valueCallbackIndex: 1 }
    
          // function(/* const rho::String& */ propertyName, /* optional function */ oResult)
        , { methodName: 'getProperty', nativeName: 'getProperty', persistentCallbackIndex: 1, valueCallbackIndex: 3 }
    
          // function(/* const rho::Vector<rho::String>& */ arrayofNames, /* optional function */ oResult)
        , { methodName: 'getProperties', nativeName: 'getProperties', persistentCallbackIndex: 1, valueCallbackIndex: 3 }
    
          // function(/* optional function */ oResult)
        , { methodName: 'getAllProperties', nativeName: 'getAllProperties', persistentCallbackIndex: 0, valueCallbackIndex: 2 }
    
          // function(/* const rho::String& */ propertyName, /* const rho::String& */ propertyValue, /* optional function */ oResult)
        , { methodName: 'setProperty', nativeName: 'setProperty', valueCallbackIndex: 2 }
    
          // function(/* const rho::Hashtable<rho::String, rho::String>& */ propertyMap, /* optional function */ oResult)
        , { methodName: 'setProperties', nativeName: 'setProperties', valueCallbackIndex: 1 }
    
    ], apiReq, function(){ return this.getId(); });

    // === WifiConfig constants ===

    



    // === WifiConfig static properties ===

    rhoUtil.createPropsProxy(WifiConfig, [
    ], apiReq);

    // === WifiConfig static methods ===

    rhoUtil.createMethodsProxy(WifiConfig, [
    
          // function(/* optional function */ oResult)
          { methodName: 'enumerate', nativeName: 'enumerate', persistentCallbackIndex: 0, valueCallbackIndex: 2 }
    
    ], apiReq);

    // === WifiConfig default instance support ===
    

        rhoUtil.createPropsProxy(WifiConfig, [
            { propName: 'defaultInstance:getDefault:setDefault', propAccess: 'rw', customSet: function(obj) { if(!obj || 'function' != typeof obj.getId){ throw 'Default object should provide getId method!' }; currentDefaultID = obj.getId(); } }
          , { propName: 'defaultID:getDefaultID:setDefaultID', propAccess: 'rw', customSet: function(id) { currentDefaultID = id; } }
        ], apiReq);

        WifiConfig.getId = function() {
            if (null == currentDefaultID) {
                currentDefaultID = WifiConfig.getDefaultID();
            }
            return currentDefaultID;
        }

        // === WifiConfig default instance properties ===

        rhoUtil.createPropsProxy(WifiConfig, [
            { propName: 'simpleStringProperty', propAccess: 'rw' }
        ], apiReq, function(){ return this.getId(); });

        // === WifiConfig default instance methods ===

        rhoUtil.createMethodsProxy(WifiConfig, [
        
              // function(/* const rho::String& */ a, /* optional function */ oResult)
              { methodName: 'get_EAP_Identity', nativeName: 'get_EAP_Identity', valueCallbackIndex: 1 }
        
              // function(/* const rho::String& */ propertyName, /* optional function */ oResult)
            , { methodName: 'getProperty', nativeName: 'getProperty', persistentCallbackIndex: 1, valueCallbackIndex: 3 }
        
              // function(/* const rho::Vector<rho::String>& */ arrayofNames, /* optional function */ oResult)
            , { methodName: 'getProperties', nativeName: 'getProperties', persistentCallbackIndex: 1, valueCallbackIndex: 3 }
        
              // function(/* optional function */ oResult)
            , { methodName: 'getAllProperties', nativeName: 'getAllProperties', persistentCallbackIndex: 0, valueCallbackIndex: 2 }
        
              // function(/* const rho::String& */ propertyName, /* const rho::String& */ propertyValue, /* optional function */ oResult)
            , { methodName: 'setProperty', nativeName: 'setProperty', valueCallbackIndex: 2 }
        
              // function(/* const rho::Hashtable<rho::String, rho::String>& */ propertyMap, /* optional function */ oResult)
            , { methodName: 'setProperties', nativeName: 'setProperties', valueCallbackIndex: 1 }
        
        ], apiReq, function(){ return this.getId(); });

    

    rhoUtil.namespace(moduleNS, WifiConfig);

    



})(Rho.jQuery, Rho, Rho.util);
