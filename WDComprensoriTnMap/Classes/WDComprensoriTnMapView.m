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
static NSUInteger const world = (NSUIntegerMax - 1);

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.mapType = MKMapTypeStandard;
        self.zoomEnabled = YES;
        self.pitchEnabled = NO;
        self.rotateEnabled = YES;
        self.scrollEnabled = YES;
        
        self.showsPointsOfInterest = NO;
        self.showsBuildings = NO;
        
        // Default values
        _comprensoriSelectedColor = [UIColor colorWithRed:41.0f/255.0f green:128.0f/255.0f blue:185.0f/255.0f alpha:0.6];
        _comprensoriUnselectedColor = [UIColor clearColor];
        _comprensoriInternalBordersColor = [UIColor colorWithRed:127.0f/255.0f green:140.0f/255.0f blue:141.0f/255.0f alpha:0.4];
        _comprensoriExternalBordersColor = [UIColor colorWithRed:127.0f/255.0f green:140.0f/255.0f blue:141.0f/255.0f alpha:0.8];
        _comprensoriOuterColor = [UIColor colorWithRed:149.0f/255.0f green:165.0f/255.0f blue:166.0f/255.0f alpha:0.4];
        _comprensoriPadding = 5.0f;
        
        // Init Polygons
        self.trentinoRegion = [MKPolygon regionWithPolygon:[MKPolygon polygonForTrentino] withIdentifier:@(trentino)];
        self.comprensoriRegions = @{
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
        
        
        // Add opaque overlay
        [self addOverlay:[MKPolygon regionWithPolygon:[MKPolygon polygonForEverythingButTrentino] withIdentifier:@(world)] level:MKOverlayLevelAboveRoads];
        
        // Add polygons to map
        [self addOverlays:[self.comprensoriRegions allValues] level:MKOverlayLevelAboveRoads];
        [self addOverlay:self.trentinoRegion level:MKOverlayLevelAboveRoads];
        
        // Setting delegate
        self.delegate = self;
        self.comprensoriDelegate = nil;
        self.comprensoriDataSource = nil;
        
        // Setting Tap recognizer
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRecognizer:)];
        tapGesture.numberOfTapsRequired = 1;
        tapGesture.numberOfTouchesRequired = 1;
        
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void) centerOnTrentinoAnimated:(BOOL)animated{
    [self setVisibleMapRect:[self.trentinoRegion boundingMapRect]
                edgePadding:UIEdgeInsetsMake(_comprensoriPadding,
                                             _comprensoriPadding,
                                             _comprensoriPadding,
                                             _comprensoriPadding)
                   animated:animated];
}

-(void) tapRecognizer:(UITapGestureRecognizer *)sender{
    if ([self.comprensoriDelegate respondsToSelector:@selector(mapview:didTapComprensorio:)]){
        if (sender.state == UIGestureRecognizerStateEnded)
        {
            CGPoint p = [sender locationInView:self];
            
            CLLocationCoordinate2D loc = [self convertPoint:p toCoordinateFromView:self];
            
            if ([self.trentinoRegion containsCoordinate:loc]){
                for (MKPolygon *region in [self.comprensoriRegions allValues]) {
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
    NSUInteger identifier = [(NSNumber *)region.identifier unsignedIntegerValue];
    MKPolygonRenderer *renderer = [[MKPolygonRenderer alloc] initWithPolygon:region];
    
    if (identifier == world){
        renderer.fillColor = _comprensoriOuterColor;
        return renderer;
    }
    
    if (identifier == trentino){
        renderer.fillColor = [UIColor clearColor];
        renderer.strokeColor = _comprensoriExternalBordersColor;
        renderer.lineWidth = 2.0f;
        return renderer;
    }
    
    if ([self.comprensoriDelegate respondsToSelector:@selector(mapview:shouldSelectComprensorio:)]){
        region.state = [self.comprensoriDataSource mapview:self shouldSelectComprensorio:identifier] ? regionSelectedState : regionUnselectedState;
    } else {
        region.state = regionUnselectedState;
    }
    
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
    renderer.strokeColor = _comprensoriInternalBordersColor;
    renderer.lineWidth = 2.0f;
    
    return renderer;
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    // Limit visible area to Trentino
    // Zooming in is possible but no zooming out
    MKMapRect currentRect = [mapView visibleMapRect];
    MKMapRect maxRect = MKMapRectInset([self.trentinoRegion boundingMapRect], - _comprensoriPadding, - _comprensoriPadding);
    
    // Check position
    if (!MKMapRectIntersectsRect(currentRect, maxRect)){
        [self centerOnTrentinoAnimated:YES];
        return;
    }
    if (currentRect.size.width > (maxRect.size.width * 1.5)&&
        currentRect.size.width > (maxRect.size.height * 1.5)){
    [self centerOnTrentinoAnimated:YES];
        return;
    }
}

@end
