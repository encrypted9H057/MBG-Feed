# MBG-Feed
Sample application to demonstrate navigation, presentation and code style.

The correct usage of AWS is described here: http://docs.aws.amazon.com/mobile/sdkforios/developerguide/setup.html
At the moment I'm going to assume this is outside the scope of this project as integration is nontrivial (for all parties) and my goal here is to show in-app navigation.

Splash screen issue: The image on our splash screen may appear all black as if missing. There has been a bug filed (https://forums.developer.apple.com/thread/17146) and the workaround does not always work. I'm now swapping between two slightly different MBG logo images

Displaying articles in a UIWebView (WKWebView for production code) seems to make the most sense but it leaves us with little room for user controls such as forward and backward navigation through webpages [designer need]. Navigation to any webpage an article might link to means we will have to completely disable the App Transport Security Stuff.



