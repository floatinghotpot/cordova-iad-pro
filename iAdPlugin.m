//
//  iAdPlugin.m
//  TestAdPlugins
//
//  Created by Xie Liming on 14-11-12.
//
//

#import "iAdPlugin.h"

#import <iAd/iAd.h>

@interface iAdPlugin()<ADBannerViewDelegate, ADInterstitialAdDelegate>

@end

@implementation iAdPlugin

- (void)pluginInitialize
{
    [super pluginInitialize];

    // other init task here
}

- (void) parseOptions:(NSDictionary *)options
{
    [super parseOptions:options];
    
}

- (NSString*) __getProductShortName
{
    return @"iAd";
}

- (NSString*) __getDefaultBannerId
{
    return @"";
}

- (NSString*) __getDefaultInterstitialId
{
    return @"";
}

- (UIView*) __createAdView:(NSString*)adId
{
    ADBannerView *ad = [[ADBannerView alloc] initWithFrame:CGRectZero];
    ad.requiredContentSizeIdentifiers = [NSSet setWithObjects:ADBannerContentSizeIdentifierLandscape,ADBannerContentSizeIdentifierPortrait,nil];
    ad.currentContentSizeIdentifier = [self __isLandscape] ? ADBannerContentSizeIdentifierLandscape : ADBannerContentSizeIdentifierPortrait;
    ad.delegate = self;
    return ad;
}

- (int) __getAdViewWidth:(UIView*)view
{
    return view.frame.size.width;
}

- (int) __getAdViewHeight:(UIView*)view
{
    return view.frame.size.height;
}

- (void) __loadAdView:(UIView*)view
{
    // nothing to do
}

- (void) __pauseAdView:(UIView*)view
{
    // nothing to do
}

- (void) __resumeAdView:(UIView*)view
{
    // nothing to do
}

- (void) __destroyAdView:(UIView*)view
{
    // nothing to do
}

- (NSObject*) __createInterstitial:(NSString*)adId
{
    ADInterstitialAd* ad = [[ADInterstitialAd alloc] init];
    ad.delegate = self;
    return ad;
}

- (void) __loadInterstitial:(NSObject*)interstitial
{
    // nothong to do
}

- (void) __showInterstitial:(NSObject*)interstitial
{
    if([interstitial isKindOfClass:[ADInterstitialAd class]]) {
        ADInterstitialAd* ad = (ADInterstitialAd*) interstitial;
        if(ad.loaded) {
            [ad presentFromViewController:[self getViewController]];
            
            // no callback event, so we fire event here
            [self fireAdEvent:EVENT_AD_PRESENT withType:ADTYPE_INTERSTITIAL];
        }
    }
}

- (void) __destroyInterstitial:(NSObject*)interstitial
{
    // nothing to do
}

- (void) onOrientationChange
{
    if([self.banner isKindOfClass:[ADBannerView class]]) {
        ADBannerView* ad = (ADBannerView*) self.banner;
        if ([self __isLandscape])
            ad.currentContentSizeIdentifier = ADBannerContentSizeIdentifierLandscape;
        else
            ad.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
    }
    
    [super onOrientationChange];
}

#pragma mark banner events

- (void)bannerViewWillLoadAd:(ADBannerView *)banner
{
    // nothing to do
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    [self fireAdEvent:EVENT_AD_LOADED withType:ADTYPE_BANNER];
    
    if((! self.bannerVisible) && self.autoShowBanner) {
        [self __showBanner:self.adPosition atX:self.posX atY:self.posY];
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    [self fireAdErrorEvent:EVENT_AD_FAILLOAD withCode:(int)error.code withMsg:[error localizedDescription] withType:ADTYPE_BANNER];
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave {
    [self fireAdEvent:EVENT_AD_LEAVEAPP withType:ADTYPE_BANNER];
    return YES;
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner
{
    [self fireAdEvent:EVENT_AD_DISMISS withType:ADTYPE_BANNER];
}

#pragma mark interstitial events

- (void)interstitialAdWillLoad:(ADInterstitialAd *)interstitialAd
{
    // nothing to do
}

- (void)interstitialAdDidLoad:(ADInterstitialAd *)interstitialAd
{
    [self fireAdEvent:EVENT_AD_LOADED withType:ADTYPE_INTERSTITIAL];
    
    if(self.autoShowInterstitial) {
        [self __showInterstitial:self.interstitial];
    }
}

- (void)interstitialAd:(ADInterstitialAd *)interstitialAd didFailWithError:(NSError *)error
{
    [self fireAdErrorEvent:EVENT_AD_FAILLOAD withCode:(int)error.code withMsg:[error localizedDescription] withType:ADTYPE_INTERSTITIAL];
}

- (BOOL)interstitialAdActionShouldBegin:(ADInterstitialAd *)banner willLeaveApplication:(BOOL)willLeave
{
    [self fireAdEvent:EVENT_AD_LEAVEAPP withType:ADTYPE_INTERSTITIAL];
    return YES;
}

- (void)interstitialAdActionDidFinish:(ADInterstitialAd *)interstitialAd
{
    [self fireAdEvent:EVENT_AD_DISMISS withType:ADTYPE_INTERSTITIAL];
}

- (void)interstitialAdDidUnload:(ADInterstitialAd *)interstitialAd
{
    // nonthing to do
}

@end
