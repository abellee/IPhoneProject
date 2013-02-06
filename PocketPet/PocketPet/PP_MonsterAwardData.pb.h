// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import <ProtocolBuffers/ProtocolBuffers.h>

@class PP_MonsterAwardData;
@class PP_MonsterAwardData_Builder;
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


@interface PpMonsterAwardDataRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface PP_MonsterAwardData : PBGeneratedMessage {
@private
  BOOL hasAwardId_:1;
  BOOL hasMonsterId_:1;
  BOOL hasItemId_:1;
  BOOL hasItemNum_:1;
  BOOL hasItemType_:1;
  BOOL hasParentType_:1;
  BOOL hasRate_:1;
  BOOL hasCreateTime_:1;
  int32_t awardId;
  int32_t monsterId;
  int32_t itemId;
  int32_t itemNum;
  int32_t itemType;
  int32_t parentType;
  int32_t rate;
  int32_t createTime;
}
- (BOOL) hasAwardId;
- (BOOL) hasMonsterId;
- (BOOL) hasItemId;
- (BOOL) hasItemNum;
- (BOOL) hasItemType;
- (BOOL) hasParentType;
- (BOOL) hasRate;
- (BOOL) hasCreateTime;
@property (readonly) int32_t awardId;
@property (readonly) int32_t monsterId;
@property (readonly) int32_t itemId;
@property (readonly) int32_t itemNum;
@property (readonly) int32_t itemType;
@property (readonly) int32_t parentType;
@property (readonly) int32_t rate;
@property (readonly) int32_t createTime;

+ (PP_MonsterAwardData*) defaultInstance;
- (PP_MonsterAwardData*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PP_MonsterAwardData_Builder*) builder;
+ (PP_MonsterAwardData_Builder*) builder;
+ (PP_MonsterAwardData_Builder*) builderWithPrototype:(PP_MonsterAwardData*) prototype;
- (PP_MonsterAwardData_Builder*) toBuilder;

+ (PP_MonsterAwardData*) parseFromData:(NSData*) data;
+ (PP_MonsterAwardData*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PP_MonsterAwardData*) parseFromInputStream:(NSInputStream*) input;
+ (PP_MonsterAwardData*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PP_MonsterAwardData*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PP_MonsterAwardData*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PP_MonsterAwardData_Builder : PBGeneratedMessage_Builder {
@private
  PP_MonsterAwardData* result;
}

- (PP_MonsterAwardData*) defaultInstance;

- (PP_MonsterAwardData_Builder*) clear;
- (PP_MonsterAwardData_Builder*) clone;

- (PP_MonsterAwardData*) build;
- (PP_MonsterAwardData*) buildPartial;

- (PP_MonsterAwardData_Builder*) mergeFrom:(PP_MonsterAwardData*) other;
- (PP_MonsterAwardData_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PP_MonsterAwardData_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasAwardId;
- (int32_t) awardId;
- (PP_MonsterAwardData_Builder*) setAwardId:(int32_t) value;
- (PP_MonsterAwardData_Builder*) clearAwardId;

- (BOOL) hasMonsterId;
- (int32_t) monsterId;
- (PP_MonsterAwardData_Builder*) setMonsterId:(int32_t) value;
- (PP_MonsterAwardData_Builder*) clearMonsterId;

- (BOOL) hasItemId;
- (int32_t) itemId;
- (PP_MonsterAwardData_Builder*) setItemId:(int32_t) value;
- (PP_MonsterAwardData_Builder*) clearItemId;

- (BOOL) hasItemNum;
- (int32_t) itemNum;
- (PP_MonsterAwardData_Builder*) setItemNum:(int32_t) value;
- (PP_MonsterAwardData_Builder*) clearItemNum;

- (BOOL) hasItemType;
- (int32_t) itemType;
- (PP_MonsterAwardData_Builder*) setItemType:(int32_t) value;
- (PP_MonsterAwardData_Builder*) clearItemType;

- (BOOL) hasParentType;
- (int32_t) parentType;
- (PP_MonsterAwardData_Builder*) setParentType:(int32_t) value;
- (PP_MonsterAwardData_Builder*) clearParentType;

- (BOOL) hasRate;
- (int32_t) rate;
- (PP_MonsterAwardData_Builder*) setRate:(int32_t) value;
- (PP_MonsterAwardData_Builder*) clearRate;

- (BOOL) hasCreateTime;
- (int32_t) createTime;
- (PP_MonsterAwardData_Builder*) setCreateTime:(int32_t) value;
- (PP_MonsterAwardData_Builder*) clearCreateTime;
@end

