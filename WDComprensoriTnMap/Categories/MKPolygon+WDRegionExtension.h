//
//  MKPolygon+WDRegionExtension.h
//  MapTest
//
//  Created by Walter Da Col on 11/16/13.
//  Copyright (c) 2013 Walter Da Col. All rights reserved.
//

#import <MapKit/MapKit.h>

typedef NS_ENUM(NSUInteger, WDMapRegionState){
    regionSelectedState,
    regionUnselectedState
};

@interface MKPolygon (WDRegionExtension)
@property (nonatomic,strong) id<NSCopying> identifier;
@property (nonatomic) WDMapRegionState state;

+ (MKPolygon *)regionWithPolygon:(MKPolygon *)polygon withIdentifier:(id<NSCopying>)identifier;

- (BOOL) containsCoordinate:(CLLocationCoordinate2D)coordinate;
@end
