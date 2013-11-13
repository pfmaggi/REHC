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

namespace ExternalstorageImpl
{
    public class Externalstorage : IExternalstorageImpl
    {
        public Externalstorage()
        {
            ExternalstorageRuntimeComponent _runtime = new ExternalstorageRuntimeComponent(this);
        }
    }

    public class ExternalstorageSingleton : IExternalstorageSingletonImpl
    {
        public ExternalstorageSingleton()
        {
            ExternalstorageSingletonComponent _runtime = new ExternalstorageSingletonComponent(this);
        }

        public void getSDPath(IMethodResult oResult)
        {
            // implement this method in C# here
        }
    }

    public class ExternalstorageFactory : IExternalstorageFactoryImpl
    {
        public IExternalstorageImpl getImpl() {
            return new Externalstorage();
        }
        public IExternalstorageSingletonImpl getSingletonImpl() {
            return new ExternalstorageSingleton();
        }
    }
}

}
