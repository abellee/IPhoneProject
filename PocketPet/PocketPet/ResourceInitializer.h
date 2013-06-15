//
//  ResourceInitializer.h
//  PocketPet
//
//  Created by Lee Abel on 13-5-6.
//
//

#import <Foundation/Foundation.h>

@interface ResourceInitializer : NSObject

- (void)initInstanceConfigList;
- (void)initMainPetConfigList;
- (void)initPetConfigList;
- (void)initPetTemplate;
- (void)initPublicResource;
- (void)initUserInterface;

@end
