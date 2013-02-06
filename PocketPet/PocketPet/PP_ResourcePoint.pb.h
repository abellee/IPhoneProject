// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import <ProtocolBuffers/ProtocolBuffers.h>

#import "PP_ResPointData.pb.h"

@class PP_ResPointData;
@class PP_ResPointData_Builder;
@class PP_ResourcePoint;
@class PP_ResourcePoint_Builder;
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


@interface PpResourcePointRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface PP_ResourcePoint : PBGeneratedMessage {
@private
  BOOL hasLongitude_:1;
  BOOL hasLatitude_:1;
  BOOL hasResPointId_:1;
  BOOL hasUid_:1;
  BOOL hasParentType_:1;
  BOOL hasResourceType_:1;
  BOOL hasResourceLevel_:1;
  BOOL hasPerHour_:1;
  BOOL hasMapIp_:1;
  BOOL hasCreateTime_:1;
  BOOL hasResourceName_:1;
  BOOL hasResourceImg_:1;
  BOOL hasResPointData_:1;
  Float64 longitude;
  Float64 latitude;
  int32_t resPointId;
  int32_t uid;
  int32_t parentType;
  int32_t resourceType;
  int32_t resourceLevel;
  int32_t perHour;
  int32_t mapIp;
  int32_t createTime;
  NSString* resourceName;
  NSString* resourceImg;
  PP_ResPointData* resPointData;
}
- (BOOL) hasResPointId;
- (BOOL) hasUid;
- (BOOL) hasResourceName;
- (BOOL) hasResourceImg;
- (BOOL) hasParentType;
- (BOOL) hasResourceType;
- (BOOL) hasResourceLevel;
- (BOOL) hasPerHour;
- (BOOL) hasLongitude;
- (BOOL) hasLatitude;
- (BOOL) hasMapIp;
- (BOOL) hasCreateTime;
- (BOOL) hasResPointData;
@property (readonly) int32_t resPointId;
@property (readonly) int32_t uid;
@property (readonly, retain) NSString* resourceName;
@property (readonly, retain) NSString* resourceImg;
@property (readonly) int32_t parentType;
@property (readonly) int32_t resourceType;
@property (readonly) int32_t resourceLevel;
@property (readonly) int32_t perHour;
@property (readonly) Float64 longitude;
@property (readonly) Float64 latitude;
@property (readonly) int32_t mapIp;
@property (readonly) int32_t createTime;
@property (readonly, retain) PP_ResPointData* resPointData;

+ (PP_ResourcePoint*) defaultInstance;
- (PP_ResourcePoint*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PP_ResourcePoint_Builder*) builder;
+ (PP_ResourcePoint_Builder*) builder;
+ (PP_ResourcePoint_Builder*) builderWithPrototype:(PP_ResourcePoint*) prototype;
- (PP_ResourcePoint_Builder*) toBuilder;

+ (PP_ResourcePoint*) parseFromData:(NSData*) data;
+ (PP_ResourcePoint*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PP_ResourcePoint*) parseFromInputStream:(NSInputStream*) input;
+ (PP_ResourcePoint*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PP_ResourcePoint*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PP_ResourcePoint*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PP_ResourcePoint_Builder : PBGeneratedMessage_Builder {
@private
  PP_ResourcePoint* result;
}

- (PP_ResourcePoint*) defaultInstance;

- (PP_ResourcePoint_Builder*) clear;
- (PP_ResourcePoint_Builder*) clone;

- (PP_ResourcePoint*) build;
- (PP_ResourcePoint*) buildPartial;

- (PP_ResourcePoint_Builder*) mergeFrom:(PP_ResourcePoint*) other;
- (PP_ResourcePoint_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PP_ResourcePoint_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasResPointId;
- (int32_t) resPointId;
- (PP_ResourcePoint_Builder*) setResPointId:(int32_t) value;
- (PP_ResourcePoint_Builder*) clearResPointId;

- (BOOL) hasUid;
- (int32_t) uid;
- (PP_ResourcePoint_Builder*) setUid:(int32_t) value;
- (PP_ResourcePoint_Builder*) clearUid;

- (BOOL) hasResourceName;
- (NSString*) resourceName;
- (PP_ResourcePoint_Builder*) setResourceName:(NSString*) value;
- (PP_ResourcePoint_Builder*) clearResourceName;

- (BOOL) hasResourceImg;
- (NSString*) resourceImg;
- (PP_ResourcePoint_Builder*) setResourceImg:(NSString*) value;
- (PP_ResourcePoint_Builder*) clearResourceImg;

- (BOOL) hasParentType;
- (int32_t) parentType;
- (PP_ResourcePoint_Builder*) setParentType:(int32_t) value;
- (PP_ResourcePoint_Builder*) clearParentType;

- (BOOL) hasResourceType;
- (int32_t) resourceType;
- (PP_ResourcePoint_Builder*) setResourceType:(int32_t) value;
- (PP_ResourcePoint_Builder*) clearResourceType;

- (BOOL) hasResourceLevel;
- (int32_t) resourceLevel;
- (PP_ResourcePoint_Builder*) setResourceLevel:(int32_t) value;
- (PP_ResourcePoint_Builder*) clearResourceLevel;

- (BOOL) hasPerHour;
- (int32_t) perHour;
- (PP_ResourcePoint_Builder*) setPerHour:(int32_t) value;
- (PP_ResourcePoint_Builder*) clearPerHour;

- (BOOL) hasLongitude;
- (Float64) longitude;
- (PP_ResourcePoint_Builder*) setLongitude:(Float64) value;
- (PP_ResourcePoint_Builder*) clearLongitude;

- (BOOL) hasLatitude;
- (Float64) latitude;
- (PP_ResourcePoint_Builder*) setLatitude:(Float64) value;
- (PP_ResourcePoint_Builder*) clearLatitude;

- (BOOL) hasMapIp;
- (int32_t) mapIp;
- (PP_ResourcePoint_Builder*) setMapIp:(int32_t) value;
- (PP_ResourcePoint_Builder*) clearMapIp;

- (BOOL) hasCreateTime;
- (int32_t) createTime;
- (PP_ResourcePoint_Builder*) setCreateTime:(int32_t) value;
- (PP_ResourcePoint_Builder*) clearCreateTime;

- (BOOL) hasResPointData;
- (PP_ResPointData*) resPointData;
- (PP_ResourcePoint_Builder*) setResPointData:(PP_ResPointData*) value;
- (PP_ResourcePoint_Builder*) setResPointDataBuilder:(PP_ResPointData_Builder*) builderForValue;
- (PP_ResourcePoint_Builder*) mergeResPointData:(PP_ResPointData*) value;
- (PP_ResourcePoint_Builder*) clearResPointData;
@end
