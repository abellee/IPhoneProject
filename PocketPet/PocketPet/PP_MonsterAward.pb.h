// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import <ProtocolBuffers/ProtocolBuffers.h>

#import "PP_MonsterAwardData.pb.h"

@class PP_MonsterAward;
@class PP_MonsterAwardData;
@class PP_MonsterAwardData_Builder;
@class PP_MonsterAward_Builder;
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


@interface PpMonsterAwardRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface PP_MonsterAward : PBGeneratedMessage {
@private
  BOOL hasMonsterId_:1;
  int32_t monsterId;
  PBAppendableArray * awardDataListArray;
}
- (BOOL) hasMonsterId;
@property (readonly, retain) PBArray * awardDataList;
@property (readonly) int32_t monsterId;
- (PP_MonsterAwardData*)awardDataListAtIndex:(NSUInteger)index;

+ (PP_MonsterAward*) defaultInstance;
- (PP_MonsterAward*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PP_MonsterAward_Builder*) builder;
+ (PP_MonsterAward_Builder*) builder;
+ (PP_MonsterAward_Builder*) builderWithPrototype:(PP_MonsterAward*) prototype;
- (PP_MonsterAward_Builder*) toBuilder;

+ (PP_MonsterAward*) parseFromData:(NSData*) data;
+ (PP_MonsterAward*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PP_MonsterAward*) parseFromInputStream:(NSInputStream*) input;
+ (PP_MonsterAward*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PP_MonsterAward*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PP_MonsterAward*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PP_MonsterAward_Builder : PBGeneratedMessage_Builder {
@private
  PP_MonsterAward* result;
}

- (PP_MonsterAward*) defaultInstance;

- (PP_MonsterAward_Builder*) clear;
- (PP_MonsterAward_Builder*) clone;

- (PP_MonsterAward*) build;
- (PP_MonsterAward*) buildPartial;

- (PP_MonsterAward_Builder*) mergeFrom:(PP_MonsterAward*) other;
- (PP_MonsterAward_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PP_MonsterAward_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (PBAppendableArray *)awardDataList;
- (PP_MonsterAwardData*)awardDataListAtIndex:(NSUInteger)index;
- (PP_MonsterAward_Builder *)addAwardDataList:(PP_MonsterAwardData*)value;
- (PP_MonsterAward_Builder *)setAwardDataListArray:(NSArray *)array;
- (PP_MonsterAward_Builder *)setAwardDataListValues:(const PP_MonsterAwardData* *)values count:(NSUInteger)count;
- (PP_MonsterAward_Builder *)clearAwardDataList;

- (BOOL) hasMonsterId;
- (int32_t) monsterId;
- (PP_MonsterAward_Builder*) setMonsterId:(int32_t) value;
- (PP_MonsterAward_Builder*) clearMonsterId;
@end

