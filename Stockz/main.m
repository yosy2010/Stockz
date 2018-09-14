//
//  main.m
//  Stockz
//
//  Created by YASSER ALTAMIMI on 14/09/2018.
//  Copyright © 2018 YASSER ALTAMIMI. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // create a mutable array for all the stock
        NSMutableArray *stocks = [[NSMutableArray alloc] init];
        
        // create a mutable dictionarry for every stock info
        NSMutableDictionary *stock;
        
        // init the dictionary
        stock = [NSMutableDictionary dictionary];
        
        // add the key value pairs for the first stock
        [stock setObject:@"AAPL"
                  forKey:@"symbol"];
        
        [stock setObject:[NSNumber numberWithInt:200]
                  forKey:@"shares"];
        
        // add the first stock as a dictionary to the first element of the array
        [stocks addObject:stock];
        
        // reset the dictionary to make the second stock
        stock = [NSMutableDictionary dictionary];
        
        // add the second stock with all its info to the dictionary to add to the array at the end
        [stock setObject:@"GOOG"
                  forKey:@"symbol"];
        
        [stock setObject:[NSNumber numberWithInt:160]
                  forKey:@"shares"];
        
        [stocks addObject:stock];
        
        // write it all to the file in the specified path
        [stocks writeToFile:@"/tmp/stocks.plist" atomically:YES];
        
        // read the file an put in an array
        NSArray *stockList = [NSArray arrayWithContentsOfFile:@"/tmp/stocks.plist"];
        
        // log that array using a for loop
        for (NSDictionary *d in stockList) {
            NSLog(@"I have %@ shares of %@",
                  [d objectForKey:@"shares"], [d objectForKey:@"symbol"]);
        }
        
        // without the foor loop it looks like this
        NSLog(@"only dictionary, %@", stockList);
        
        
    }
    return 0;
}
