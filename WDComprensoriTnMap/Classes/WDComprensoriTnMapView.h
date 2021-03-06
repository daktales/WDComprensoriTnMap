//
//  WDComprensoriTnMapView.h
//  MapTest
//
//  Created by Walter Da Col on 11/15/13.
//  Copyright (c) 2013 Walter Da Col. All rights reserved.
//

#import <MapKit/MapKit.h>

typedef NS_ENUM(NSUInteger, WDComprensoriTnIdentifier){
    comprensorioC1,
    comprensorioC2,
    comprensorioC3,
    comprensorioC4,
    comprensorioC5,
    comprensorioC6,
    comprensorioC7,
    comprensorioC8,
    comprensorioC9,
    comprensorioC10,
    comprensorioC11
};

@class WDComprensoriTnMapView;

@protocol WDComprensoriTnDataSource <NSObject>
@optional
- (BOOL) mapview:(WDComprensoriTnMapView *)mapview shouldSelectComprensorio:(WDComprensoriTnIdentifier)identifier;
@end

@protocol WDComprensoriTnDelegate <NSObject>
@optional
- (void) mapview:(WDComprensoriTnMapView *)mapview didTapComprensorio:(WDComprensoriTnIdentifier)identifier;
@end

@interface WDComprensoriTnMapView : MKMapView <MKMapViewDelegate>
@property (nonatomic,strong) UIColor *comprensoriSelectedColor UI_APPEARANCE_SELECTOR;
@property (nonatomic,strong) UIColor *comprensoriUnselectedColor UI_APPEARANCE_SELECTOR;
@property (nonatomic,strong) UIColor *comprensoriInternalBordersColor UI_APPEARANCE_SELECTOR;
@property (nonatomic,strong) UIColor *comprensoriExternalBordersColor UI_APPEARANCE_SELECTOR;
@property (nonatomic,strong) UIColor *comprensoriOuterColor UI_APPEARANCE_SELECTOR;
@property (nonatomic) CGFloat comprensoriPadding UI_APPEARANCE_SELECTOR;

@property (nonatomic,assign) id<WDComprensoriTnDelegate> comprensoriDelegate;
@property (nonatomic,assign) id<WDComprensoriTnDataSource> comprensoriDataSource;

- (void) setComprensorio:(WDComprensoriTnIdentifier)identifier asSelected:(BOOL)filled animated:(BOOL)animated;
@end

