
(function ($, rho, rhoUtil) {
    'use strict';

    var moduleNS = 'Rho.Externalstorage';
    var apiReq = rhoUtil.apiReqFor(moduleNS);
    var currentDefaultID = null;

    // === Externalstorage class definition ===

    function Externalstorage() {
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

    Externalstorage.getId = function() { return currentDefaultID; }

    // === Externalstorage instance properties ===

    rhoUtil.createPropsProxy(Externalstorage.prototype, [
    ], apiReq, function(){ return this.getId(); });

    // === Externalstorage instance methods ===

    rhoUtil.createMethodsProxy(Externalstorage.prototype, [
    
    ], apiReq, function(){ return this.getId(); });

    // === Externalstorage constants ===

    



    // === Externalstorage static properties ===

    rhoUtil.createPropsProxy(Externalstorage, [
    ], apiReq);

    // === Externalstorage static methods ===

    rhoUtil.createMethodsProxy(Externalstorage, [
    
          // function(/* optional function */ oResult)
          { methodName: 'getSDPath', nativeName: 'getSDPath', valueCallbackIndex: 0 }
    
    ], apiReq);

    // === Externalstorage default instance support ===
    

    rhoUtil.namespace(moduleNS, Externalstorage);

    



})(Rho.jQuery, Rho, Rho.util);
