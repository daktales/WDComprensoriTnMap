//
//  WDComprensoriTnMapView.m
//  MapTest
//
//  Created by Walter Da Col on 11/15/13.
//  Copyright (c) 2013 Walter Da Col. All rights reserved.
//

#import "WDComprensoriTnMapView.h"
#import "MKPolygon+WDRegionExtension.h"
#import "MKPolygon+WDComprensoriTn.h"

@interface WDComprensoriTnMapView()
@property (nonatomic,strong) NSDictionary *comprensoriRegions;
@property (nonatomic,strong) MKPolygon *trentinoRegion;
@end
@implementation WDComprensoriTnMapView

static NSUInteger const trentino = NSUIntegerMax;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // Default values
        _comprensoriSelectedColor = [UIColor colorWithRed:41.0f/255.0f green:128.0f/255.0f blue:185.0f/255.0f alpha:0.6];
        _comprensoriUnselectedColor = [[UIColor whiteColor] colorWithAlphaComponent:0.2];
        
        // Init Polygons
        _trentinoRegion = [MKPolygon regionWithPolygon:[MKPolygon polygonForTrentino] withIdentifier:@(trentino)];
        _comprensoriRegions = @{
                                @(comprensorioC1): [MKPolygon regionWithPolygon:[MKPolygon polygonForC1] withIdentifier:@(comprensorioC1)],
                                @(comprensorioC2): [MKPolygon regionWithPolygon:[MKPolygon polygonForC2] withIdentifier:@(comprensorioC2)],
                                @(comprensorioC3): [MKPolygon regionWithPolygon:[MKPolygon polygonForC3] withIdentifier:@(comprensorioC3)],
                                @(comprensorioC4): [MKPolygon regionWithPolygon:[MKPolygon polygonForC4] withIdentifier:@(comprensorioC4)],
                                @(comprensorioC5): [MKPolygon regionWithPolygon:[MKPolygon polygonForC5] withIdentifier:@(comprensorioC5)],
                                @(comprensorioC6): [MKPolygon regionWithPolygon:[MKPolygon polygonForC6] withIdentifier:@(comprensorioC6)],
                                @(comprensorioC7): [MKPolygon regionWithPolygon:[MKPolygon polygonForC7] withIdentifier:@(comprensorioC7)],
                                @(comprensorioC8): [MKPolygon regionWithPolygon:[MKPolygon polygonForC8] withIdentifier:@(comprensorioC8)],
                                @(comprensorioC9): [MKPolygon regionWithPolygon:[MKPolygon polygonForC9] withIdentifier:@(comprensorioC9)],
                                @(comprensorioC10): [MKPolygon regionWithPolygon:[MKPolygon polygonForC10] withIdentifier:@(comprensorioC10)],
                                @(comprensorioC11): [MKPolygon regionWithPolygon:[MKPolygon polygonForC11] withIdentifier:@(comprensorioC11)]};
        // Setting map
        self.mapType = MKMapTypeHybrid;
        
        // Add polygons to map
        [self addOverlay:_trentinoRegion level:MKOverlayLevelAboveRoads];
        [self addOverlays:[_comprensoriRegions allValues] level:MKOverlayLevelAboveRoads];
        
        // Setting delegate
        self.delegate = self;
        self.comprensoriDelegate = nil;
        
        // Setting Tap recognizer
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRecognizer:)];
        tapGesture.numberOfTapsRequired = 1;
        tapGesture.numberOfTouchesRequired = 1;
        
        [self addGestureRecognizer:tapGesture];
        
        // This force overlay drawing
        self.visibleMapRect = [_trentinoRegion boundingMapRect];
    }
    return self;
}

-(void) tapRecognizer:(UITapGestureRecognizer *)sender{
    if ([self.comprensoriDelegate respondsToSelector:@selector(mapview:didTapComprensorio:)]){
        if (sender.state == UIGestureRecognizerStateEnded)
        {
            CGPoint p = [sender locationInView:self];
            
            CLLocationCoordinate2D loc = [self convertPoint:p toCoordinateFromView:self];
            
            if ([_trentinoRegion containsCoordinate:loc]){
                for (MKPolygon *region in [_comprensoriRegions allValues]) {
                    if ([region containsCoordinate:loc]){
                        WDComprensoriTnIdentifier identifier = [(NSNumber *)region.identifier intValue];
                        [self.comprensoriDelegate mapview:self didTapComprensorio:identifier];
                        break;
                    }
                }
            }
        }
    }
    
}

- (void) setComprensorio:(WDComprensoriTnIdentifier)identifier asSelected:(BOOL)selected animated:(BOOL)animated{
    MKPolygonRenderer *renderer = (MKPolygonRenderer *)[self rendererForOverlay:_comprensoriRegions[@(identifier)]];
    ((MKPolygon *) _comprensoriRegions[@(identifier)]).state = selected ? regionSelectedState : regionUnselectedState;
    renderer.fillColor = selected ? _comprensoriSelectedColor : _comprensoriUnselectedColor;
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id <MKOverlay>)overlay{
    if (![overlay isKindOfClass:[MKPolygon class]]) {
        return nil;
    }
    
    if (![overlay respondsToSelector:@selector(identifier)]){
        return nil;
    }
    
    MKPolygon *region = (MKPolygon *)overlay;
    NSNumber *identifier = (NSNumber *)region.identifier;
    MKPolygonRenderer *renderer = [[MKPolygonRenderer alloc] initWithPolygon:region];
    
    if ([identifier isEqual:@(trentino)]){
        renderer.fillColor = [UIColor clearColor];
        renderer.strokeColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
        renderer.lineWidth = 2.0f;
    } else {
        switch (region.state) {
            case regionSelectedState:{
                renderer.fillColor = _comprensoriSelectedColor;
                break;
            }
            case regionUnselectedState:
            default:{
                renderer.fillColor = _comprensoriUnselectedColor;
                break;
            }
        }
        renderer.strokeColor = [[UIColor whiteColor] colorWithAlphaComponent:0.4];
        renderer.lineWidth = 2.0f;
    }
    
    return renderer;
}

@end
