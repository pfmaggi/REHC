package com.rho.externalstorage;  
  
import java.io.File;  
import android.os.Environment;  
import com.rhomobile.rhodes.api.IMethodResult;  
  
class ExternalstorageSingleton extends ExternalstorageSingletonBase implements IExternalstorageSingleton {  
    @Override  
    public void getSDPath(IMethodResult res) {  
        File sdCardRoot = Environment.getExternalStorageDirectory();  
        String sdCardPath = sdCardRoot.getAbsolutePath();  
  
        res.set(sdCardPath);  
    }  
}  