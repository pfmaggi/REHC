REHC
====

RhoElements Hybrid Container for Android.

RhoMobile Suite v4.0 started to walk away from the Industrial Browser use case for RhoElements with the decision to not release and Android version of the Shared Runtime.
The transition to two different products will be complete by the time we're going to release RhoMobile Suite v4.2.
In the meanwhile I've built this sample project that shows how to build WebApp container, or a **R**ho**E**lement **H**Ybrid **C**ontainer, for Android as described in the [documentation](http://docs.rhomobile.com/guide/webcontainer)

I'm building such a sample project with a very clear scope:

  1. Having a pre-built APK available
  2. Possibility to customize the start-path without recompiling the application
  3. Only RhoElements v4.0 Android supported API available (no Meta Tags, no RhoElements MSI only API like Scanner)
  
The basic idea is that, once installed the APK on an MC40, ET1 or TC55 (I've just tested on MC40) you can create a folder on the SDCard partition with the path:
Android/data/<application name>

Put in this folder a Config.xml and you're set.

I've used the same syntax of the previous Config.xml but I only read the start path, and it needs to be a full path without macros like %INSTALLDIR%.

See sample folder for a test APK and a sample configuration and page (put the content of the archive on the SDCard in Android/data/<application name>).

Latest version introduce a couple of configuration flag that are available in the RhoConfig.txt file:

  1.  capability to capture and disable Menu and Back Buttons 

	  # Intercept back and menu button
	  rehc_intercept_button = 1

  2.  have the configuration file on the external storage in the folder: "/Android/data/<package full name>/"
      In your case this could be "/Android/data/com.rhomobile.rehc/"
      This allows the application to read from this folder even on newer version of Android (v4.4 and newer).

      # Read Configuration from fully qualified bundle name
      rehc_use_bundle_url = 1

      Just remember that this folder is overwritten every time you install a new version of the application. 
	  This is why I suggest that you leave this disabled till you don't need to move to Android v4.4:

      # Read Configuration from folder <External Storage>/Android/data/<application name>
      rehc_use_bundle_url = 0



@real_nibble
