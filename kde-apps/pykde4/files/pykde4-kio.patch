--- a/sip/kio/kabstractfilemodule.sip
+++ b/sip/kio/kabstractfilemodule.sip
@@ -37,7 +37,8 @@
 #include <jobuidelegate.h>
 #include <kabstractfileitemactionplugin.h>
 #include <kabstractfilemodule.h>
-#include <kautomount.h>
+// Disabled due compile error w/ latest `kdelibs`
+// #include <kautomount.h>
 #include <kbookmarkdialog.h>
 #include <kbookmarkdombuilder.h>
 #include <kbookmarkimporter.h>
@@ -132,10 +133,13 @@ public:
         sipType = sipType_KAbstractFileItemActionPlugin;
     else if (dynamic_cast<KAbstractFileModule*>(sipCpp))
         sipType = sipType_KAbstractFileModule;
+#if 0
+    // NOTE Disabled due compile error w/ latest `kdelibs`
     else if (dynamic_cast<KAutoMount*>(sipCpp))
         sipType = sipType_KAutoMount;
     else if (dynamic_cast<KAutoUnmount*>(sipCpp))
         sipType = sipType_KAutoUnmount;
+#endif
     else if (dynamic_cast<KBookmarkDomBuilder*>(sipCpp))
         sipType = sipType_KBookmarkDomBuilder;
     else if (dynamic_cast<KBookmarkImporterBase*>(sipCpp))
--- a/sip/kio/kiomod.sip
+++ b/sip/kio/kiomod.sip
@@ -50,7 +50,8 @@
 %Include kacl.sip
 %Include kar.sip
 %Include karchive.sip
-%Include kautomount.sip
+// NOTE Disabled due compile error w/ latest `kdelibs`
+// %Include kautomount.sip
 %Include kbookmark.sip
 %Include kbookmarkdialog.sip
 %Include kbookmarkdombuilder.sip
