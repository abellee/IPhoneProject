//
//  FileManagerDelegate.h
//  PocketPet
//
//  Created by Lee Abel on 13-4-27.
//
//

#import <Foundation/Foundation.h>

@protocol FileManagerDelegate <NSObject>

@optional
- (void)writeDataComplete;
- (void)deleteFileComplete;

@end
