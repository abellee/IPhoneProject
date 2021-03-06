// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import <ProtocolBuffers/ProtocolBuffers.h>

@class PP_UserState;
@class PP_UserState_Builder;
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


@interface PpUserStateRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface PP_UserState : PBGeneratedMessage {
@private
  BOOL hasUid_:1;
  BOOL hasState_:1;
  int32_t uid;
  int32_t state;
}
- (BOOL) hasUid;
- (BOOL) hasState;
@property (readonly) int32_t uid;
@property (readonly) int32_t state;

+ (PP_UserState*) defaultInstance;
- (PP_UserState*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PP_UserState_Builder*) builder;
+ (PP_UserState_Builder*) builder;
+ (PP_UserState_Builder*) builderWithPrototype:(PP_UserState*) prototype;
- (PP_UserState_Builder*) toBuilder;

+ (PP_UserState*) parseFromData:(NSData*) data;
+ (PP_UserState*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PP_UserState*) parseFromInputStream:(NSInputStream*) input;
+ (PP_UserState*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PP_UserState*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PP_UserState*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PP_UserState_Builder : PBGeneratedMessage_Builder {
@private
  PP_UserState* result;
}

- (PP_UserState*) defaultInstance;

- (PP_UserState_Builder*) clear;
- (PP_UserState_Builder*) clone;

- (PP_UserState*) build;
- (PP_UserState*) buildPartial;

- (PP_UserState_Builder*) mergeFrom:(PP_UserState*) other;
- (PP_UserState_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PP_UserState_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasUid;
- (int32_t) uid;
- (PP_UserState_Builder*) setUid:(int32_t) value;
- (PP_UserState_Builder*) clearUid;

- (BOOL) hasState;
- (int32_t) state;
- (PP_UserState_Builder*) setState:(int32_t) value;
- (PP_UserState_Builder*) clearState;
@end

