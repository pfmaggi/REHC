package com.rho.wificonfig;

import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.os.Build;
import android.os.Environment;
import android.widget.Toast;
import android.content.Context;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.File;
import java.io.FileWriter;
import java.security.Provider;
import java.security.Security;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.Map;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import com.rhomobile.rhodes.api.IMethodResult;
import com.rhomobile.rhodes.api.MethodResult;
import com.rhomobile.rhodes.RhodesActivity;
import com.rhomobile.rhodes.Logger;

public class WifiConfig extends WifiConfigBase implements IWifiConfig {
    private static final String INT_PRIVATE_KEY = "private_key";
    private static final String INT_PHASE2 = "phase2";
    private static final String INT_PASSWORD = "password";
    private static final String INT_IDENTITY = "identity";
    private static final String INT_EAP = "eap";
    private static final String INT_CLIENT_CERT = "client_cert";
    private static final String INT_CA_CERT = "ca_cert";
    private static final String INT_ANONYMOUS_IDENTITY = "anonymous_identity";
    //private static final String WIFI_SERVICE = "wifi";

    private static final String TAG = "WiFi Config Extension";
    
    final String INT_ENTERPRISEFIELD_NAME = "android.net.wifi.WifiConfiguration$EnterpriseField";
    
    public WifiConfig(String id) {
        super(id);
    }

    @Override
    public void get_EAP_Identity(String a, IMethodResult result) {
          result.set(get_EAP_identity(a));
    }

    private String get_EAP_identity(String strSSID_Name) {
        String result = null;
        String strComplete_SSID_Name = "\"" + strSSID_Name + "\"";

        /*Get the WifiService */
        RhodesActivity ra = RhodesActivity.safeGetInstance();
        WifiManager wifi = (WifiManager)ra.getSystemService(Context.WIFI_SERVICE);
        /*Get All WIfi configurations*/
        List<WifiConfiguration> configList = wifi.getConfiguredNetworks();
        /*Now we need to search appropriate configuration i.e. with name SSID_Name*/
        for(int i = 0;i<configList.size();i++)
        {
            if(configList.get(i).SSID.contentEquals(strComplete_SSID_Name))
            {
                /*We found the appropriate config now read all config details*/
                Iterator<WifiConfiguration> iter =  configList.iterator();
                WifiConfiguration config = configList.get(i);


                /*reflection magic*/
                /*These are the fields we are really interested in*/
                try
                {
                    // Let the magic start
                    Class[] wcClasses = WifiConfiguration.class.getClasses();
                    // null for overzealous java compiler
                    Class wcEnterpriseField = null;

                    for (Class wcClass : wcClasses)
                        if (wcClass.getName().equals(INT_ENTERPRISEFIELD_NAME))
                        {
                            wcEnterpriseField = wcClass;
                            break;
                        }
                    boolean noEnterpriseFieldType = false;
                    if(wcEnterpriseField == null)
                        noEnterpriseFieldType = true; // Cupcake/Donut access enterprise settings directly

                    Field wcefIdentity = null;
                    Field[] wcefFields = WifiConfiguration.class.getFields();
                    // Dispatching Field vars
                    for (Field wcefField : wcefFields)
                    {
                        if (wcefField.getName().trim().equals(INT_IDENTITY))
                            wcefIdentity = wcefField;
                    }
                    Method wcefValue = null;
                    if(!noEnterpriseFieldType)
                    {
                        for(Method m: wcEnterpriseField.getMethods())
                            //System.out.println(m.getName());
                            if(m.getName().trim().equals("value")){
                                wcefValue = m;
                                break;
                            }
                    }

                /*EAP Method*/
                    Object obj = null;
                /*Identity*/
                    if(!noEnterpriseFieldType)
                    {
                        result = (String) wcefValue.invoke(wcefIdentity.get(config), null);
                        //Logger.I(TAG, "<<<<<<<<<<WifiPreference>>>>>>>>>>>>", "[EAP IDENTITY]" + result);
                        Log.d("<<<<<<<<<<WifiPreference>>>>>>>>>>>>", "[EAP IDENTITY]" + result);
                    }
                    else
                    {
                        result = (String)wcefIdentity.get(config);
                    }

                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }

            }
        }

        return result;
    }
}