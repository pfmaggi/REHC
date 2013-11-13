REHC
====

RhoElements Hybrid Container for Android.


I'm sending this to you because you've expressed interest in the Android Shared Runtime that is no more available in RhoElements v4
As described in the documentation, a similar behaviour can be brought back building a [web container/hybrid container](http://docs.rhomobile.com/guide/webcontainer)

I'm building such a sample project with a very clear scope:

  1. Having a pre-built APK available
  2. Possibility to customize the start-path without recompiling the application
  3. Only RhoElements v4.0 Android supported API available (no Meta Tags, no RhoElements MSI only API like Scanner)
  
The basic idea is that, once installed the APK on an MC40, ET1 or TC55 (I've just tested on MC40) you can create a folder on the SDCard partition with the path:
Android/data/REHC

Put in this folder a Config.xml and you're set.

I've used the same syntax of the previous Config.xml but I only read the start path, and it needs to be a full path without macros like %INSTALLDIR%.

See sample folder for a test APK and a sample configuration and page (put the content of the archive on the SDCard in Android/data/REHC).

Ciao
Pietro
pietro.maggi@motorolasolutions.com