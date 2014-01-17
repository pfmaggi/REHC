using System;
using System.Collections.Generic;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using rhoruntime;

namespace rho {

namespace WifiConfigImpl
{
    public class WifiConfig : IWifiConfigImpl
    {
        public WifiConfig()
        {
            WifiConfigRuntimeComponent _runtime = new WifiConfigRuntimeComponent(this);
        }

        public void getSimpleStringProperty(IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public void setSimpleStringProperty(string simpleStringProperty, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public void get_EAP_Identity(string a, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public void getProperty(string propertyName, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public void getProperties(IReadOnlyList<string> arrayofNames, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public void getAllProperties(IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public void setProperty(string propertyName, string propertyValue, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public void setProperties(IReadOnlyDictionary<string, string> propertyMap, IMethodResult oResult)
        {
            // implement this method in C# here
        }
    }

    public class WifiConfigSingleton : IWifiConfigSingletonImpl
    {
        public WifiConfigSingleton()
        {
            WifiConfigSingletonComponent _runtime = new WifiConfigSingletonComponent(this);
        }

        public void enumerate(IMethodResult oResult)
        {
            // implement this method in C# here
        }
    }

    public class WifiConfigFactory : IWifiConfigFactoryImpl
    {
        public IWifiConfigImpl getImpl() {
            return new WifiConfig();
        }
        public IWifiConfigSingletonImpl getSingletonImpl() {
            return new WifiConfigSingleton();
        }
    }
}

}
