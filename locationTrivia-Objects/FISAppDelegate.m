//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

-(NSArray *)allLocationNames {
    NSArray *locationNames = [[NSArray alloc]init];
    for (FISLocation *locationName in self.locations) {
        locationNames = [locationNames arrayByAddingObject:locationName.name];
    }
    return locationNames;
}


-(FISLocation *)locationNamed:(NSString *)name {
    for (FISLocation *local in self.locations) {
        if ([local.name isEqualToString:name]) {
            return local;
        }
    }
    return nil;
}

-(NSArray *)locationsNearLatitude:(CGFloat)latitude longitude:(CGFloat)longitude margin:(CGFloat)margin {
    NSMutableArray *locationsArray = [[NSMutableArray alloc]init];
    for (FISLocation *local in self.locations) {
        CGFloat absDifferenceLongitude = fabs((longitude - local.longitude));
        CGFloat absDifferenceLatitude = fabs((latitude - local.latitude));
        if ((margin >= absDifferenceLatitude) && (margin >= absDifferenceLongitude)) {
            [locationsArray addObject:local];
        }
    }
    return locationsArray;
}

@end
