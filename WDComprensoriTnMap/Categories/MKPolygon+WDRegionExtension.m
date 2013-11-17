//
//  MKPolygon+WDRegionExtension.m
//  MapTest
//
//  Created by Walter Da Col on 11/16/13.
//  Copyright (c) 2013 Walter Da Col. All rights reserved.
//

#import "MKPolygon+WDRegionExtension.h"
#import <objc/runtime.h>

@interface MKPolygon (WDRegionExtension)
@property (nonatomic,strong) UIBezierPath *path;
@end

@implementation MKPolygon (WDRegionExtension)
static char pathKey;
static char stateKey;
static char identifierKey;

- (void) setState:(WDMapRegionState)state {
    objc_setAssociatedObject( self, &stateKey, [NSNumber numberWithInt:state], OBJC_ASSOCIATION_RETAIN );
}

- (WDMapRegionState) state {
    return [objc_getAssociatedObject(self, &stateKey) intValue];
}

- (void) setPath:(UIBezierPath *)path {
    objc_setAssociatedObject(self, &pathKey, path, OBJC_ASSOCIATION_RETAIN);
}

- (UIBezierPath *) path{
    return objc_getAssociatedObject(self, &pathKey);
}

- (void) setIdentifier:(id<NSCopying>)identifier{
    objc_setAssociatedObject(self, &identifierKey, identifier, OBJC_ASSOCIATION_RETAIN);
}

- (id<NSCopying>) identifier {
    return objc_getAssociatedObject(self, &identifierKey);
}

+ (MKPolygon *)regionWithPolygon:(MKPolygon *)polygon withIdentifier:(id<NSCopying>)identifier{
    MKPolygon *region = [MKPolygon polygonWithPoints:polygon.points count:polygon.pointCount interiorPolygons:polygon.interiorPolygons];
    [region setIdentifier:identifier];
    [region setPath:[MKPolygon pathFromMKPolygon:polygon]];
    [region setState:regionUnselectedState];
    return region;
}

+ (UIBezierPath *) pathFromMKPolygon:(MKPolygon *)polygon{
    // Create path
    CGMutablePathRef mpr = CGPathCreateMutable();
    MKMapPoint *polygonPoints = polygon.points;
    
    for (int p=0; p < polygon.pointCount; p++)
    {
        MKMapPoint mp = polygonPoints[p];
        if (p == 0)
            CGPathMoveToPoint(mpr, NULL, mp.x, mp.y);
        else
            CGPathAddLineToPoint(mpr, NULL, mp.x, mp.y);
    }
    // Create bezierPath
    UIBezierPath *path = [UIBezierPath bezierPathWithCGPath:mpr];
    
    // Release
    CGPathRelease(mpr);
    
    return path;
}

- (BOOL) containsCoordinate:(CLLocationCoordinate2D)coordinate;{
    
    // Once path creation
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        self.path = [self.class pathFromMKPolygon:self];
    });
    
    // Convert point
    MKMapPoint coordinatePoint = MKMapPointForCoordinate(coordinate);
    CGPoint mapPointAsCGP = CGPointMake(coordinatePoint.x, coordinatePoint.y);
    return [self.path containsPoint:mapPointAsCGP];
}

@end

