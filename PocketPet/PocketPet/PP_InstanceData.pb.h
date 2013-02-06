// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import <ProtocolBuffers/ProtocolBuffers.h>

@class PP_InstanceData;
@class PP_InstanceData_Builder;
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


@interface PpInstanceDataRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface PP_InstanceData : PBGeneratedMessage {
@private
  BOOL hasInstanceDataId_:1;
  BOOL hasInstanceId_:1;
  BOOL hasGateNum_:1;
  BOOL hasMonsterId_:1;
  BOOL hasMonsterLevel_:1;
  BOOL hasMonsterNum_:1;
  BOOL hasCreateTime_:1;
  int32_t instanceDataId;
  int32_t instanceId;
  int32_t gateNum;
  int32_t monsterId;
  int32_t monsterLevel;
  int32_t monsterNum;
  int32_t createTime;
}
- (BOOL) hasInstanceDataId;
- (BOOL) hasInstanceId;
- (BOOL) hasGateNum;
- (BOOL) hasMonsterId;
- (BOOL) hasMonsterLevel;
- (BOOL) hasMonsterNum;
- (BOOL) hasCreateTime;
@property (readonly) int32_t instanceDataId;
@property (readonly) int32_t instanceId;
@property (readonly) int32_t gateNum;
@property (readonly) int32_t monsterId;
@property (readonly) int32_t monsterLevel;
@property (readonly) int32_t monsterNum;
@property (readonly) int32_t createTime;

+ (PP_InstanceData*) defaultInstance;
- (PP_InstanceData*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PP_InstanceData_Builder*) builder;
+ (PP_InstanceData_Builder*) builder;
+ (PP_InstanceData_Builder*) builderWithPrototype:(PP_InstanceData*) prototype;
- (PP_InstanceData_Builder*) toBuilder;

+ (PP_InstanceData*) parseFromData:(NSData*) data;
+ (PP_InstanceData*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PP_InstanceData*) parseFromInputStream:(NSInputStream*) input;
+ (PP_InstanceData*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PP_InstanceData*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PP_InstanceData*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PP_InstanceData_Builder : PBGeneratedMessage_Builder {
@private
  PP_InstanceData* result;
}

- (PP_InstanceData*) defaultInstance;

- (PP_InstanceData_Builder*) clear;
- (PP_InstanceData_Builder*) clone;

- (PP_InstanceData*) build;
- (PP_InstanceData*) buildPartial;

- (PP_InstanceData_Builder*) mergeFrom:(PP_InstanceData*) other;
- (PP_InstanceData_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PP_InstanceData_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasInstanceDataId;
- (int32_t) instanceDataId;
- (PP_InstanceData_Builder*) setInstanceDataId:(int32_t) value;
- (PP_InstanceData_Builder*) clearInstanceDataId;

- (BOOL) hasInstanceId;
- (int32_t) instanceId;
- (PP_InstanceData_Builder*) setInstanceId:(int32_t) value;
- (PP_InstanceData_Builder*) clearInstanceId;

- (BOOL) hasGateNum;
- (int32_t) gateNum;
- (PP_InstanceData_Builder*) setGateNum:(int32_t) value;
- (PP_InstanceData_Builder*) clearGateNum;

- (BOOL) hasMonsterId;
- (int32_t) monsterId;
- (PP_InstanceData_Builder*) setMonsterId:(int32_t) value;
- (PP_InstanceData_Builder*) clearMonsterId;

- (BOOL) hasMonsterLevel;
- (int32_t) monsterLevel;
- (PP_InstanceData_Builder*) setMonsterLevel:(int32_t) value;
- (PP_InstanceData_Builder*) clearMonsterLevel;

- (BOOL) hasMonsterNum;
- (int32_t) monsterNum;
- (PP_InstanceData_Builder*) setMonsterNum:(int32_t) value;
- (PP_InstanceData_Builder*) clearMonsterNum;

- (BOOL) hasCreateTime;
- (int32_t) createTime;
- (PP_InstanceData_Builder*) setCreateTime:(int32_t) value;
- (PP_InstanceData_Builder*) clearCreateTime;
@end

