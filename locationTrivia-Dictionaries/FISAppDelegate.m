//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSString *)stringByTruncatingNameOfLocation: (NSDictionary *) location toLength: (NSUInteger) length {
    
//    should return a string containing the beginning of the submitted location's name with the number of letters specified in the length argument.
    
    //Max's genius one line code - original code commented out at the bottom
    return [location[@"name"]  substringToIndex: MIN ([location[@"name"] length], length)];
}


-(NSDictionary *) dictionaryForLocationWithName:(NSString *) name latitude: (CGFloat) latitude longitude: (CGFloat) longitude {
    
    //should return a dictionary containing the three argument values stored to keys of the argument names (@"name", @"latitude", @"longitude")
    
    NSArray *valuesForDictionary = @[name, @(latitude), @(longitude)];
    NSArray *keysForDictionary = @[@"name", @"latitude", @"longitude"];
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]initWithObjects:valuesForDictionary forKeys:keysForDictionary];
    
    return dictionary;
}


-(NSArray *) namesOfLocations: (NSArray*) locations {
    //should return an array containing all of the values for the name key in the location dictionaries in the submitted locations array.

    return [locations valueForKey:@"name"];
}

-(BOOL) dictionaryIsValidLocation: (NSDictionary *) vaildDictionary {
//    should return YES only if the submitted location dictionary has exactly three keys by the names of @"name", @"latitude", and @"longitude". If any of these conditions fail, the method should return NO.
    
    NSArray *arrayOfKeys = [vaildDictionary allKeys];
    
    if([arrayOfKeys count] != 3){
        return NO;
    }
    if(![arrayOfKeys containsObject:@"name"]) {
        return NO;
    }
    
    return YES;
}

-(NSDictionary *) locationNamed:(NSString *) name
                    inLocations: (NSArray *) locations {
    
    
    //match name string with the name values in location
    //NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
   //for loop to get key name out of array
    //send to string and match to string provided
    
    for(NSDictionary *location in locations){
            NSString *newLocation = location[@"name"];
        if([newLocation isEqualToString: name]) {
            return location;
        }
    }
    //NSLog(@"\n\n%@\n\n %@", name, locations)
    
    return nil;
}

@end





//-(NSString *)stringByTruncatingNameOfLocation: (NSDictionary *) location toLength: (NSUInteger) length {
//    NSString *firstThreeLetters = @"";
//    for(NSString *key in location) {
//        if([key isEqualToString:@"name"]) {
//          firstThreeLetters = [location[key] substringToIndex: MIN (21, length)]; <--- got MIN from stack overflow, not sure I really understand how the range is set
//        }
//    }
//    return firstThreeLetters;