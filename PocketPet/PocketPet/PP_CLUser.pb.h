// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import <ProtocolBuffers/ProtocolBuffers.h>

#import "PP_AccTime.pb.h"
#import "PP_Location.pb.h"
#import "PP_Pet.pb.h"
#import "PP_Task.pb.h"

@class PP_AccTime;
@class PP_AccTime_Builder;
@class PP_CLUser;
@class PP_CLUser_Builder;
@class PP_Location;
@class PP_Location_Builder;
@class PP_Pet;
@class PP_Pet_Builder;
@class PP_Pet_Equipment;
@class PP_Pet_Equipment_Builder;
@class PP_Pet_Skill;
@class PP_Pet_Skill_Builder;
@class PP_Task;
@class PP_Task_Award;
@class PP_Task_Award_Builder;
@class PP_Task_Builder;
@class PP_Task_Require;
@class PP_Task_Require_Builder;
#ifndef __has_feature
  #define __has_feature(x) 0 // Compatibility with non-clang compilers.
#endif // __has_feature

#ifndef NS_RETURNS_NOT_RETAINED
  #if __has_feature(attribute_ns_returns_not_retained)
    #define NS_RETURNS_NOT_RETAINED __attribute__((ns_returns_not_retained))
  #else
    #define NS_RETURNS_NOT_RETAINED
  #endif
#endif


@interface PpCluserRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface PP_CLUser : PBGeneratedMessage {
@private
  BOOL hasTelephone_:1;
  BOOL hasBirthday_:1;
  BOOL hasBloodType_:1;
  BOOL hasBagNum_:1;
  BOOL hasPetNum_:1;
  BOOL hasResourceNum_:1;
  BOOL hasCountry_:1;
  BOOL hasLevel_:1;
  BOOL hasToken_:1;
  BOOL hasCoin_:1;
  BOOL hasCity_:1;
  BOOL hasProvince_:1;
  BOOL hasNation_:1;
  BOOL hasConstellation_:1;
  BOOL hasAge_:1;
  BOOL hasSex_:1;
  BOOL hasUid_:1;
  BOOL hasVersion_:1;
  BOOL hasJob_:1;
  BOOL hasNickname_:1;
  BOOL hasAvatarImg_:1;
  BOOL hasSignature_:1;
  BOOL hasHobby_:1;
  BOOL hasAccTime_:1;
  BOOL hasHomeLocation_:1;
  BOOL hasLocation_:1;
  uint64_t telephone;
  uint64_t birthday;
  int32_t bloodType;
  int32_t bagNum;
  int32_t petNum;
  int32_t resourceNum;
  int32_t country;
  int32_t level;
  int32_t token;
  int32_t coin;
  int32_t city;
  int32_t province;
  int32_t nation;
  int32_t constellation;
  int32_t age;
  int32_t sex;
  int32_t uid;
  int32_t version;
  NSString* job;
  NSString* nickname;
  NSString* avatarImg;
  NSString* signature;
  NSString* hobby;
  PP_AccTime* accTime;
  PP_Location* homeLocation;
  PP_Location* location;
  PBAppendableArray * petsArray;
  PBAppendableArray * tasksArray;
}
- (BOOL) hasUid;
- (BOOL) hasVersion;
- (BOOL) hasNickname;
- (BOOL) hasAvatarImg;
- (BOOL) hasSignature;
- (BOOL) hasHobby;
- (BOOL) hasSex;
- (BOOL) hasAge;
- (BOOL) hasConstellation;
- (BOOL) hasBirthday;
- (BOOL) hasNation;
- (BOOL) hasProvince;
- (BOOL) hasCity;
- (BOOL) hasTelephone;
- (BOOL) hasCoin;
- (BOOL) hasToken;
- (BOOL) hasLevel;
- (BOOL) hasCountry;
- (BOOL) hasResourceNum;
- (BOOL) hasPetNum;
- (BOOL) hasBagNum;
- (BOOL) hasBloodType;
- (BOOL) hasJob;
- (BOOL) hasAccTime;
- (BOOL) hasHomeLocation;
- (BOOL) hasLocation;
@property (readonly) int32_t uid;
@property (readonly) int32_t version;
@property (readonly, retain) NSString* nickname;
@property (readonly, retain) NSString* avatarImg;
@property (readonly, retain) NSString* signature;
@property (readonly, retain) NSString* hobby;
@property (readonly) int32_t sex;
@property (readonly) int32_t age;
@property (readonly) int32_t constellation;
@property (readonly) uint64_t birthday;
@property (readonly) int32_t nation;
@property (readonly) int32_t province;
@property (readonly) int32_t city;
@property (readonly) uint64_t telephone;
@property (readonly) int32_t coin;
@property (readonly) int32_t token;
@property (readonly) int32_t level;
@property (readonly) int32_t country;
@property (readonly) int32_t resourceNum;
@property (readonly) int32_t petNum;
@property (readonly) int32_t bagNum;
@property (readonly) int32_t bloodType;
@property (readonly, retain) NSString* job;
@property (readonly, retain) PBArray * pets;
@property (readonly, retain) PBArray * tasks;
@property (readonly, retain) PP_AccTime* accTime;
@property (readonly, retain) PP_Location* homeLocation;
@property (readonly, retain) PP_Location* location;
- (PP_Pet*)petsAtIndex:(NSUInteger)index;
- (PP_Task*)tasksAtIndex:(NSUInteger)index;

+ (PP_CLUser*) defaultInstance;
- (PP_CLUser*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PP_CLUser_Builder*) builder;
+ (PP_CLUser_Builder*) builder;
+ (PP_CLUser_Builder*) builderWithPrototype:(PP_CLUser*) prototype;
- (PP_CLUser_Builder*) toBuilder;

+ (PP_CLUser*) parseFromData:(NSData*) data;
+ (PP_CLUser*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PP_CLUser*) parseFromInputStream:(NSInputStream*) input;
+ (PP_CLUser*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PP_CLUser*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PP_CLUser*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PP_CLUser_Builder : PBGeneratedMessage_Builder {
@private
  PP_CLUser* result;
}

- (PP_CLUser*) defaultInstance;

- (PP_CLUser_Builder*) clear;
- (PP_CLUser_Builder*) clone;

- (PP_CLUser*) build;
- (PP_CLUser*) buildPartial;

- (PP_CLUser_Builder*) mergeFrom:(PP_CLUser*) other;
- (PP_CLUser_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PP_CLUser_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasUid;
- (int32_t) uid;
- (PP_CLUser_Builder*) setUid:(int32_t) value;
- (PP_CLUser_Builder*) clearUid;

- (BOOL) hasVersion;
- (int32_t) version;
- (PP_CLUser_Builder*) setVersion:(int32_t) value;
- (PP_CLUser_Builder*) clearVersion;

- (BOOL) hasNickname;
- (NSString*) nickname;
- (PP_CLUser_Builder*) setNickname:(NSString*) value;
- (PP_CLUser_Builder*) clearNickname;

- (BOOL) hasAvatarImg;
- (NSString*) avatarImg;
- (PP_CLUser_Builder*) setAvatarImg:(NSString*) value;
- (PP_CLUser_Builder*) clearAvatarImg;

- (BOOL) hasSignature;
- (NSString*) signature;
- (PP_CLUser_Builder*) setSignature:(NSString*) value;
- (PP_CLUser_Builder*) clearSignature;

- (BOOL) hasHobby;
- (NSString*) hobby;
- (PP_CLUser_Builder*) setHobby:(NSString*) value;
- (PP_CLUser_Builder*) clearHobby;

- (BOOL) hasSex;
- (int32_t) sex;
- (PP_CLUser_Builder*) setSex:(int32_t) value;
- (PP_CLUser_Builder*) clearSex;

- (BOOL) hasAge;
- (int32_t) age;
- (PP_CLUser_Builder*) setAge:(int32_t) value;
- (PP_CLUser_Builder*) clearAge;

- (BOOL) hasConstellation;
- (int32_t) constellation;
- (PP_CLUser_Builder*) setConstellation:(int32_t) value;
- (PP_CLUser_Builder*) clearConstellation;

- (BOOL) hasBirthday;
- (uint64_t) birthday;
- (PP_CLUser_Builder*) setBirthday:(uint64_t) value;
- (PP_CLUser_Builder*) clearBirthday;

- (BOOL) hasNation;
- (int32_t) nation;
- (PP_CLUser_Builder*) setNation:(int32_t) value;
- (PP_CLUser_Builder*) clearNation;

- (BOOL) hasProvince;
- (int32_t) province;
- (PP_CLUser_Builder*) setProvince:(int32_t) value;
- (PP_CLUser_Builder*) clearProvince;

- (BOOL) hasCity;
- (int32_t) city;
- (PP_CLUser_Builder*) setCity:(int32_t) value;
- (PP_CLUser_Builder*) clearCity;

- (BOOL) hasTelephone;
- (uint64_t) telephone;
- (PP_CLUser_Builder*) setTelephone:(uint64_t) value;
- (PP_CLUser_Builder*) clearTelephone;

- (BOOL) hasCoin;
- (int32_t) coin;
- (PP_CLUser_Builder*) setCoin:(int32_t) value;
- (PP_CLUser_Builder*) clearCoin;

- (BOOL) hasToken;
- (int32_t) token;
- (PP_CLUser_Builder*) setToken:(int32_t) value;
- (PP_CLUser_Builder*) clearToken;

- (BOOL) hasLevel;
- (int32_t) level;
- (PP_CLUser_Builder*) setLevel:(int32_t) value;
- (PP_CLUser_Builder*) clearLevel;

- (BOOL) hasCountry;
- (int32_t) country;
- (PP_CLUser_Builder*) setCountry:(int32_t) value;
- (PP_CLUser_Builder*) clearCountry;

- (BOOL) hasResourceNum;
- (int32_t) resourceNum;
- (PP_CLUser_Builder*) setResourceNum:(int32_t) value;
- (PP_CLUser_Builder*) clearResourceNum;

- (BOOL) hasPetNum;
- (int32_t) petNum;
- (PP_CLUser_Builder*) setPetNum:(int32_t) value;
- (PP_CLUser_Builder*) clearPetNum;

- (BOOL) hasBagNum;
- (int32_t) bagNum;
- (PP_CLUser_Builder*) setBagNum:(int32_t) value;
- (PP_CLUser_Builder*) clearBagNum;

- (BOOL) hasBloodType;
- (int32_t) bloodType;
- (PP_CLUser_Builder*) setBloodType:(int32_t) value;
- (PP_CLUser_Builder*) clearBloodType;

- (BOOL) hasJob;
- (NSString*) job;
- (PP_CLUser_Builder*) setJob:(NSString*) value;
- (PP_CLUser_Builder*) clearJob;

- (PBAppendableArray *)pets;
- (PP_Pet*)petsAtIndex:(NSUInteger)index;
- (PP_CLUser_Builder *)addPets:(PP_Pet*)value;
- (PP_CLUser_Builder *)setPetsArray:(NSArray *)array;
- (PP_CLUser_Builder *)setPetsValues:(const PP_Pet* *)values count:(NSUInteger)count;
- (PP_CLUser_Builder *)clearPets;

- (PBAppendableArray *)tasks;
- (PP_Task*)tasksAtIndex:(NSUInteger)index;
- (PP_CLUser_Builder *)addTasks:(PP_Task*)value;
- (PP_CLUser_Builder *)setTasksArray:(NSArray *)array;
- (PP_CLUser_Builder *)setTasksValues:(const PP_Task* *)values count:(NSUInteger)count;
- (PP_CLUser_Builder *)clearTasks;

- (BOOL) hasAccTime;
- (PP_AccTime*) accTime;
- (PP_CLUser_Builder*) setAccTime:(PP_AccTime*) value;
- (PP_CLUser_Builder*) setAccTimeBuilder:(PP_AccTime_Builder*) builderForValue;
- (PP_CLUser_Builder*) mergeAccTime:(PP_AccTime*) value;
- (PP_CLUser_Builder*) clearAccTime;

- (BOOL) hasHomeLocation;
- (PP_Location*) homeLocation;
- (PP_CLUser_Builder*) setHomeLocation:(PP_Location*) value;
- (PP_CLUser_Builder*) setHomeLocationBuilder:(PP_Location_Builder*) builderForValue;
- (PP_CLUser_Builder*) mergeHomeLocation:(PP_Location*) value;
- (PP_CLUser_Builder*) clearHomeLocation;

- (BOOL) hasLocation;
- (PP_Location*) location;
- (PP_CLUser_Builder*) setLocation:(PP_Location*) value;
- (PP_CLUser_Builder*) setLocationBuilder:(PP_Location_Builder*) builderForValue;
- (PP_CLUser_Builder*) mergeLocation:(PP_Location*) value;
- (PP_CLUser_Builder*) clearLocation;
@end
