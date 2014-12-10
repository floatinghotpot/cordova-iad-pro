# iAd Plugin Pro #

Present Apple iAd in Mobile App/Games natively from JavaScript. 

Highlights:
- [x] Easy-to-use APIs. Display Ad with single line of Js code.
- [x] Support Banner, Interstitial Ad.
- [x] Multiple banner size, also support custom size.
- [x] Fixed and overlapped mode.
- [x] Auto fit on orientation change.
- [x] Same API with other RjFun Ad plugins, easily switch to other Ad networks.

Compatible with:

* Cordova CLI, v3.5+
* Intel XDK and Crosswalk, r1095+
* IBM Worklight, v6.2+

## How to use? ##

If use with Cordova CLI:
```
cordova plugin add com.rjfun.cordova.iad
```

If use with Intel XDK:
Project -> CORDOVA 3.X HYBRID MOBILE APP SETTINGS -> PLUGINS AND PERMISSIONS -> Third-Party Plugins ->
Add a Third-Party Plugin -> Get Plugin from the Web, input:
```
Name: iAdPluginPro
Plugin ID: com.rjfun.cordova.iad
[x] Plugin is located in the Apache Cordova Plugins Registry
```
## Quick Start ##

Before using the plugin in your project, please verify the plugin by build the demo index.html coming with the plugin:

```bash
cordova create test1 com.rjfun.test1 test1;
cd test1;
cordova platform add ios;
cordova plugin add com.rjfun.cordova.iad;
rm -r www/*;
cp -r plugins/com.rjfun.cordova.iad/test/* www/;
cordova prepare;
cordova run ios;
```

## Quick Start Example Code ##

Step 1: Create a banner with single line of javascript

```javascript
// it will display smart banner at top center, using the default options
if(iAd) iAd.createBanner( { autoShow:true } );
```

Or, show the banner Ad in some other way:

```javascript
// or, show a default banner at bottom
if(iAd) iAd.createBanner( {
	position:iAd.AD_POSITION.BOTTOM_CENTER, 
	autoShow:true
} );
```

Step 2: Prepare an interstitial, and show it when needed

** Notice: iAd interstitial Ad only supports iPad.

```javascript
// preppare and load ad resource in background, e.g. at begining of game level
if(iAd) iAd.prepareInterstitial( { autoShow:false } );

// show the interstitial later, e.g. at end of game level
if(iAd) iAd.showInterstitial();
```

## Javascript API Overview ##

Methods:
```javascript
// set default value for other methods
setOptions(options, success, fail);
// for banner
createBanner(options, success, fail);
removeBanner();
showBanner(position);
showBannerAtXY(x, y);
hideBanner();
// for interstitial
prepareInterstitial(options, success, fail);
showInterstitial();
```

## Detailed Documentation ##

The APIs, Events and Options are detailed documented.

Read the detailed API Reference Documentation [English](https://github.com/floatinghotpot/cordova-iad-pro/wiki).

## FAQ ##

If encounter problem when using the plugin, please read the [FAQ](https://github.com/floatinghotpot/cordova-iad-pro/wiki/FAQ) first.

## Full Example Code ##

This MobFox Plugin Pro offers the most flexibility and many options.

Check the [test/index.html] (https://github.com/floatinghotpot/cordova-iad-pro/blob/master/test/index.html).

## Screenshots ##

iPhone Portrait | iPhone Landscape
-------|----------
![ScreenShot](docs/iphone_portrait.jpg) | ![ScreenShot](docs/iphone_landscape.jpg)
 iPad Banner | iPad Interstitial
![ScreenShot](docs/ipad_banner.jpg) | ![ScreenShot](docs/ipad_interstitial.jpg)

Ad PluginPro series for the world leading Mobile Ad services:

* [GoogleAds PluginPro](https://github.com/floatinghotpot/cordova-admob-pro), for Google AdMob/DoubleClick.
* [iAd PluginPro](https://github.com/floatinghotpot/cordova-iad-pro), for Apple iAd. 
* [FacebookAds PluginPro](https://github.com/floatinghotpot/cordova-plugin-facebookads), for Facebook Audience Network.
* [FlurryAds PluginPro](https://github.com/floatinghotpot/cordova-plugin-flurry), for Flurry Ads.
* [mMedia PluginPro](https://github.com/floatinghotpot/cordova-plugin-mmedia), for Millennial Meida.
* [MobFox PluginPro](https://github.com/floatinghotpot/cordova-mobfox-pro), for MobFox.
* [MoPub PluginPro](https://github.com/floatinghotpot/cordova-plugin-mopub), for MoPub.

More Cordova/PhoneGap plugins by Raymond Xie, [find them in plugin registry](http://plugins.cordova.io/#/search?search=rjfun).

If use in commercial project or need prompt support, please [buy a license](http://rjfun.github.io/), you will be served with high priority.

Project outsourcing and consulting service is also available. Please [contact us](mailto:rjfun.mobile@gmail.com) if you have the business needs.

