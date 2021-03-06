// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import <ProtocolBuffers/ProtocolBuffers.h>

@class PP_UserAuction;
@class PP_UserAuction_Builder;
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


@interface PpUserAuctionRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface PP_UserAuction : PBGeneratedMessage {
@private
  BOOL hasAuctionId_:1;
  BOOL hasUid_:1;
  BOOL hasActionId_:1;
  BOOL hasItemId_:1;
  BOOL hasItemNum_:1;
  BOOL hasInvalidTime_:1;
  BOOL hasCreateTime_:1;
  BOOL hasVersion_:1;
  int32_t auctionId;
  int32_t uid;
  int32_t actionId;
  int32_t itemId;
  int32_t itemNum;
  int32_t invalidTime;
  int32_t createTime;
  int32_t version;
}
- (BOOL) hasAuctionId;
- (BOOL) hasUid;
- (BOOL) hasActionId;
- (BOOL) hasItemId;
- (BOOL) hasItemNum;
- (BOOL) hasInvalidTime;
- (BOOL) hasCreateTime;
- (BOOL) hasVersion;
@property (readonly) int32_t auctionId;
@property (readonly) int32_t uid;
@property (readonly) int32_t actionId;
@property (readonly) int32_t itemId;
@property (readonly) int32_t itemNum;
@property (readonly) int32_t invalidTime;
@property (readonly) int32_t createTime;
@property (readonly) int32_t version;

+ (PP_UserAuction*) defaultInstance;
- (PP_UserAuction*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PP_UserAuction_Builder*) builder;
+ (PP_UserAuction_Builder*) builder;
+ (PP_UserAuction_Builder*) builderWithPrototype:(PP_UserAuction*) prototype;
- (PP_UserAuction_Builder*) toBuilder;

+ (PP_UserAuction*) parseFromData:(NSData*) data;
+ (PP_UserAuction*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PP_UserAuction*) parseFromInputStream:(NSInputStream*) input;
+ (PP_UserAuction*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PP_UserAuction*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PP_UserAuction*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PP_UserAuction_Builder : PBGeneratedMessage_Builder {
@private
  PP_UserAuction* result;
}

- (PP_UserAuction*) defaultInstance;

- (PP_UserAuction_Builder*) clear;
- (PP_UserAuction_Builder*) clone;

- (PP_UserAuction*) build;
- (PP_UserAuction*) buildPartial;

- (PP_UserAuction_Builder*) mergeFrom:(PP_UserAuction*) other;
- (PP_UserAuction_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PP_UserAuction_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasAuctionId;
- (int32_t) auctionId;
- (PP_UserAuction_Builder*) setAuctionId:(int32_t) value;
- (PP_UserAuction_Builder*) clearAuctionId;

- (BOOL) hasUid;
- (int32_t) uid;
- (PP_UserAuction_Builder*) setUid:(int32_t) value;
- (PP_UserAuction_Builder*) clearUid;

- (BOOL) hasActionId;
- (int32_t) actionId;
- (PP_UserAuction_Builder*) setActionId:(int32_t) value;
- (PP_UserAuction_Builder*) clearActionId;

- (BOOL) hasItemId;
- (int32_t) itemId;
- (PP_UserAuction_Builder*) setItemId:(int32_t) value;
- (PP_UserAuction_Builder*) clearItemId;

- (BOOL) hasItemNum;
- (int32_t) itemNum;
- (PP_UserAuction_Builder*) setItemNum:(int32_t) value;
- (PP_UserAuction_Builder*) clearItemNum;

- (BOOL) hasInvalidTime;
- (int32_t) invalidTime;
- (PP_UserAuction_Builder*) setInvalidTime:(int32_t) value;
- (PP_UserAuction_Builder*) clearInvalidTime;

- (BOOL) hasCreateTime;
- (int32_t) createTime;
- (PP_UserAuction_Builder*) setCreateTime:(int32_t) value;
- (PP_UserAuction_Builder*) clearCreateTime;

- (BOOL) hasVersion;
- (int32_t) version;
- (PP_UserAuction_Builder*) setVersion:(int32_t) value;
- (PP_UserAuction_Builder*) clearVersion;
@end

