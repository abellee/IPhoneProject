// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import <ProtocolBuffers/ProtocolBuffers.h>

@class PP_Body;
@class PP_Body_Builder;
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


@interface PpBodyRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface PP_Body : PBGeneratedMessage {
@private
  BOOL hasFuncName_:1;
  BOOL hasContent_:1;
  NSString* funcName;
  NSData* content;
}
- (BOOL) hasFuncName;
- (BOOL) hasContent;
@property (readonly, retain) NSString* funcName;
@property (readonly, retain) NSData* content;

+ (PP_Body*) defaultInstance;
- (PP_Body*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PP_Body_Builder*) builder;
+ (PP_Body_Builder*) builder;
+ (PP_Body_Builder*) builderWithPrototype:(PP_Body*) prototype;
- (PP_Body_Builder*) toBuilder;

+ (PP_Body*) parseFromData:(NSData*) data;
+ (PP_Body*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PP_Body*) parseFromInputStream:(NSInputStream*) input;
+ (PP_Body*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PP_Body*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PP_Body*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PP_Body_Builder : PBGeneratedMessage_Builder {
@private
  PP_Body* result;
}

- (PP_Body*) defaultInstance;

- (PP_Body_Builder*) clear;
- (PP_Body_Builder*) clone;

- (PP_Body*) build;
- (PP_Body*) buildPartial;

- (PP_Body_Builder*) mergeFrom:(PP_Body*) other;
- (PP_Body_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PP_Body_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasFuncName;
- (NSString*) funcName;
- (PP_Body_Builder*) setFuncName:(NSString*) value;
- (PP_Body_Builder*) clearFuncName;

- (BOOL) hasContent;
- (NSData*) content;
- (PP_Body_Builder*) setContent:(NSData*) value;
- (PP_Body_Builder*) clearContent;
@end
