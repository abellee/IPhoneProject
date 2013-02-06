// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import <ProtocolBuffers/ProtocolBuffers.h>

#import "PP_Head.pb.h"
#import "PP_Body.pb.h"

@class PP_Body;
@class PP_Body_Builder;
@class PP_Head;
@class PP_Head_Builder;
@class PP_Package;
@class PP_Package_Builder;
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


@interface PpPackageRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface PP_Package : PBGeneratedMessage {
@private
  BOOL hasHead_:1;
  BOOL hasBody_:1;
  PP_Head* head;
  PP_Body* body;
}
- (BOOL) hasHead;
- (BOOL) hasBody;
@property (readonly, retain) PP_Head* head;
@property (readonly, retain) PP_Body* body;

+ (PP_Package*) defaultInstance;
- (PP_Package*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PP_Package_Builder*) builder;
+ (PP_Package_Builder*) builder;
+ (PP_Package_Builder*) builderWithPrototype:(PP_Package*) prototype;
- (PP_Package_Builder*) toBuilder;

+ (PP_Package*) parseFromData:(NSData*) data;
+ (PP_Package*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PP_Package*) parseFromInputStream:(NSInputStream*) input;
+ (PP_Package*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PP_Package*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PP_Package*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PP_Package_Builder : PBGeneratedMessage_Builder {
@private
  PP_Package* result;
}

- (PP_Package*) defaultInstance;

- (PP_Package_Builder*) clear;
- (PP_Package_Builder*) clone;

- (PP_Package*) build;
- (PP_Package*) buildPartial;

- (PP_Package_Builder*) mergeFrom:(PP_Package*) other;
- (PP_Package_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PP_Package_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasHead;
- (PP_Head*) head;
- (PP_Package_Builder*) setHead:(PP_Head*) value;
- (PP_Package_Builder*) setHeadBuilder:(PP_Head_Builder*) builderForValue;
- (PP_Package_Builder*) mergeHead:(PP_Head*) value;
- (PP_Package_Builder*) clearHead;

- (BOOL) hasBody;
- (PP_Body*) body;
- (PP_Package_Builder*) setBody:(PP_Body*) value;
- (PP_Package_Builder*) setBodyBuilder:(PP_Body_Builder*) builderForValue;
- (PP_Package_Builder*) mergeBody:(PP_Body*) value;
- (PP_Package_Builder*) clearBody;
@end

