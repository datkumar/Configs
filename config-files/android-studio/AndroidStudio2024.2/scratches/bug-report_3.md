Please file this bug report at https://github.com/flutter/flutter-intellij/issues/new.

---

## What happened

(please describe what you were doing when this exception occurred)

## Version information

Android Studio `Ladybug | 2024.2.1 Patch 1` • Flutter plugin `io.flutter 82.0.3` • Dart plugin `242.22855.32`

Flutter 3.24.3 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 2663184aa7 (6 weeks ago) • 2024-09-11 16:27:48 -0500
Engine • revision 36335019a8
Tools • Dart 3.5.3 • DevTools 2.37.3

## Exception

null

```
java.lang.NullPointerException: Cannot invoke "com.intellij.openapi.wm.ToolWindow.setAvailable(boolean)" because the return value of "com.intellij.openapi.wm.ToolWindowManager.getToolWindow(String)" is null
	at io.flutter.performance.FlutterPerformanceViewFactory.lambda$initPerfView$1(FlutterPerformanceViewFactory.java:43)
	at com.intellij.util.concurrency.ContextRunnable.run(ContextRunnable.java:27)
	at com.intellij.openapi.application.TransactionGuardImpl.runWithWritingAllowed(TransactionGuardImpl.java:229)
	at com.intellij.openapi.application.TransactionGuardImpl.access$100(TransactionGuardImpl.java:22)
	at com.intellij.openapi.application.TransactionGuardImpl$1.run(TransactionGuardImpl.java:191)
	at com.intellij.openapi.application.impl.AnyThreadWriteThreadingSupport.runIntendedWriteActionOnCurrentThread$lambda$1(AnyThreadWriteThreadingSupport.kt:184)
	at com.intellij.openapi.application.impl.AnyThreadWriteThreadingSupport.runWriteIntentReadAction(AnyThreadWriteThreadingSupport.kt:84)
	at com.intellij.openapi.application.impl.AnyThreadWriteThreadingSupport.runIntendedWriteActionOnCurrentThread(AnyThreadWriteThreadingSupport.kt:183)
	at com.intellij.openapi.application.impl.ApplicationImpl.runIntendedWriteActionOnCurrentThread(ApplicationImpl.java:836)
	at com.intellij.openapi.application.impl.ApplicationImpl$2.run(ApplicationImpl.java:424)
	at com.intellij.openapi.application.impl.AnyThreadWriteThreadingSupport.runWithImplicitRead(AnyThreadWriteThreadingSupport.kt:122)
	at com.intellij.openapi.application.impl.ApplicationImpl.runWithImplicitRead(ApplicationImpl.java:1162)
	at com.intellij.openapi.application.impl.FlushQueue.doRun(FlushQueue.java:78)
	at com.intellij.openapi.application.impl.FlushQueue.runNextEvent(FlushQueue.java:119)
	at com.intellij.openapi.application.impl.FlushQueue.flushNow(FlushQueue.java:41)
	at java.desktop/java.awt.event.InvocationEvent.dispatch(Unknown Source)
	at java.desktop/java.awt.EventQueue.dispatchEventImpl(Unknown Source)
	at java.desktop/java.awt.EventQueue$4.run(Unknown Source)
	at java.desktop/java.awt.EventQueue$4.run(Unknown Source)
	at java.base/java.security.AccessController.doPrivileged(Unknown Source)
	at java.base/java.security.ProtectionDomain$JavaSecurityAccessImpl.doIntersectionPrivilege(Unknown Source)
	at java.desktop/java.awt.EventQueue.dispatchEvent(Unknown Source)
	at com.intellij.ide.IdeEventQueue.defaultDispatchEvent(IdeEventQueue.kt:696)
	at com.intellij.ide.IdeEventQueue._dispatchEvent$lambda$16(IdeEventQueue.kt:590)
	at com.intellij.openapi.application.impl.AnyThreadWriteThreadingSupport.runWithoutImplicitRead(AnyThreadWriteThreadingSupport.kt:117)
	at com.intellij.ide.IdeEventQueue._dispatchEvent(IdeEventQueue.kt:590)
	at com.intellij.ide.IdeEventQueue.access$_dispatchEvent(IdeEventQueue.kt:73)
	at com.intellij.ide.IdeEventQueue$dispatchEvent$processEventRunnable$1$1$1$1.compute(IdeEventQueue.kt:357)
	at com.intellij.ide.IdeEventQueue$dispatchEvent$processEventRunnable$1$1$1$1.compute(IdeEventQueue.kt:356)
	at com.intellij.openapi.progress.impl.CoreProgressManager.computePrioritized(CoreProgressManager.java:843)
	at com.intellij.ide.IdeEventQueue$dispatchEvent$processEventRunnable$1$1$1.invoke(IdeEventQueue.kt:356)
	at com.intellij.ide.IdeEventQueue$dispatchEvent$processEventRunnable$1$1$1.invoke(IdeEventQueue.kt:351)
	at com.intellij.ide.IdeEventQueueKt$performActivity$runnableWithWIL$1.invoke$lambda$0(IdeEventQueue.kt:1035)
	at com.intellij.openapi.application.WriteIntentReadAction.lambda$run$0(WriteIntentReadAction.java:24)
	at com.intellij.openapi.application.impl.AnyThreadWriteThreadingSupport.runWriteIntentReadAction(AnyThreadWriteThreadingSupport.kt:84)
	at com.intellij.openapi.application.impl.ApplicationImpl.runWriteIntentReadAction(ApplicationImpl.java:910)
	at com.intellij.openapi.application.WriteIntentReadAction.compute(WriteIntentReadAction.java:55)
	at com.intellij.openapi.application.WriteIntentReadAction.run(WriteIntentReadAction.java:23)
	at com.intellij.ide.IdeEventQueueKt$performActivity$runnableWithWIL$1.invoke(IdeEventQueue.kt:1035)
	at com.intellij.ide.IdeEventQueueKt$performActivity$runnableWithWIL$1.invoke(IdeEventQueue.kt:1035)
	at com.intellij.ide.IdeEventQueueKt.performActivity$lambda$1(IdeEventQueue.kt:1036)
	at com.intellij.openapi.application.TransactionGuardImpl.performActivity(TransactionGuardImpl.java:106)
	at com.intellij.ide.IdeEventQueueKt.performActivity(IdeEventQueue.kt:1036)
	at com.intellij.ide.IdeEventQueue.dispatchEvent$lambda$10(IdeEventQueue.kt:351)
	at com.intellij.ide.IdeEventQueue.dispatchEvent(IdeEventQueue.kt:397)
	at java.desktop/java.awt.EventDispatchThread.pumpOneEventForFilters(Unknown Source)
	at java.desktop/java.awt.EventDispatchThread.pumpEventsForFilter(Unknown Source)
	at java.desktop/java.awt.EventDispatchThread.pumpEventsForHierarchy(Unknown Source)
	at java.desktop/java.awt.EventDispatchThread.pumpEvents(Unknown Source)
	at java.desktop/java.awt.EventDispatchThread.pumpEvents(Unknown Source)
	at java.desktop/java.awt.EventDispatchThread.run(Unknown Source)
```
