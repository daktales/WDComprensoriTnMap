//
//  MKPolygon+WDComprensoriTn.h
//  MapTest
//
//  Created by Walter Da Col on 11/15/13.
//  Copyright (c) 2013 Walter Da Col. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKPolygon (WDComprensoriTn)
+ (BOOL) polygon:(MKPolygon *)polygon withIdentifier:(id<NSCopying>)identifier containsCoordinate:(CLLocationCoordinate2D)coordinate;
+ (MKPolygon *) polygonForTrentino;
+ (MKPolygon *) polygonForEverythingButTrentino;
+ (MKPolygon *) polygonForC1;
+ (MKPolygon *) polygonForC2;
+ (MKPolygon *) polygonForC3;
+ (MKPolygon *) polygonForC4;
+ (MKPolygon *) polygonForC5;
+ (MKPolygon *) polygonForC6;
+ (MKPolygon *) polygonForC7;
+ (MKPolygon *) polygonForC8;
+ (MKPolygon *) polygonForC9;
+ (MKPolygon *) polygonForC10;
+ (MKPolygon *) polygonForC11;
@end
