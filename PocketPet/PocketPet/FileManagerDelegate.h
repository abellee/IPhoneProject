//
//  FileManagerDelegate.h
//  PocketPet
//
//  Created by Lee Abel on 13-4-27.
//
//

#import <Foundation/Foundation.h>

@class InstanceImages;
@protocol FileManagerDelegate <NSObject>

@optional
- (void)writeDataComplete;
- (void)deleteFileComplete;
- (void)getInstanceImageComplete:(InstanceImages*)images;
- (void)getMainPetImagesComplete:(NSMutableArray*)array;
- (void)getPetImagesComplete:(NSMutableArray*)array;

@end
