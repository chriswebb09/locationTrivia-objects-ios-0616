//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by Christopher Webb-Orenstein on 6/13/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"

@implementation FISLocation

-(instancetype)init {
    return [self initWithName:@"" latitude:0.0 longitude:0.0];
    
}

-(instancetype)initWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    self = [super init];
    if (self) {
        _name = name;
        _latitude = latitude;
        _longitude = longitude;
        _trivia = [[NSMutableArray alloc] init];
    }
    return self;
    
}


-(NSString *)stringByTruncatingNameToLength:(NSUInteger)length {
    if (length < self.name.length) {
        return [self.name substringToIndex:length];
    }
    return self.name;
}

-(BOOL)hasValidData {
    if ((!self.name) || ((self.latitude < -90.0) || (self.latitude > 90.0)) || ((self.longitude <= -180.0) || (self.longitude > 180.0)) || (([self.name isEqualToString:@""]))) {
        return NO;
    }
    return YES;
}

-(FISTrivium *)triviumWithMostLikes {
    if (self.trivia && self.trivia.count > 0) {
        NSSortDescriptor *mostLikes = [NSSortDescriptor sortDescriptorWithKey:@"likes"
                                       ascending:NO];
        NSArray *orderedByLikes =[self.trivia sortedArrayUsingDescriptors:@[mostLikes]];
        return orderedByLikes[0];
    }
    return nil;
}

@end
