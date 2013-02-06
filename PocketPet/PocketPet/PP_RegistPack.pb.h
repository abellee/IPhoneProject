// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import <ProtocolBuffers/ProtocolBuffers.h>

#import "PP_Account.pb.h"

@class PP_Account;
@class PP_Account_Builder;
@class PP_RegistPack;
@class PP_RegistPack_Builder;
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


@interface PpRegistPackRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface PP_RegistPack : PBGeneratedMessage {
@private
  BOOL hasNickname_:1;
  BOOL hasAvatarImg_:1;
  BOOL hasDuid_:1;
  BOOL hasAccount_:1;
  NSString* nickname;
  NSString* avatarImg;
  NSString* duid;
  PP_Account* account;
}
- (BOOL) hasAccount;
- (BOOL) hasNickname;
- (BOOL) hasAvatarImg;
- (BOOL) hasDuid;
@property (readonly, retain) PP_Account* account;
@property (readonly, retain) NSString* nickname;
@property (readonly, retain) NSString* avatarImg;
@property (readonly, retain) NSString* duid;

+ (PP_RegistPack*) defaultInstance;
- (PP_RegistPack*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PP_RegistPack_Builder*) builder;
+ (PP_RegistPack_Builder*) builder;
+ (PP_RegistPack_Builder*) builderWithPrototype:(PP_RegistPack*) prototype;
- (PP_RegistPack_Builder*) toBuilder;

+ (PP_RegistPack*) parseFromData:(NSData*) data;
+ (PP_RegistPack*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PP_RegistPack*) parseFromInputStream:(NSInputStream*) input;
+ (PP_RegistPack*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PP_RegistPack*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PP_RegistPack*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PP_RegistPack_Builder : PBGeneratedMessage_Builder {
@private
  PP_RegistPack* result;
}

- (PP_RegistPack*) defaultInstance;

- (PP_RegistPack_Builder*) clear;
- (PP_RegistPack_Builder*) clone;

- (PP_RegistPack*) build;
- (PP_RegistPack*) buildPartial;

- (PP_RegistPack_Builder*) mergeFrom:(PP_RegistPack*) other;
- (PP_RegistPack_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PP_RegistPack_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasAccount;
- (PP_Account*) account;
- (PP_RegistPack_Builder*) setAccount:(PP_Account*) value;
- (PP_RegistPack_Builder*) setAccountBuilder:(PP_Account_Builder*) builderForValue;
- (PP_RegistPack_Builder*) mergeAccount:(PP_Account*) value;
- (PP_RegistPack_Builder*) clearAccount;

- (BOOL) hasNickname;
- (NSString*) nickname;
- (PP_RegistPack_Builder*) setNickname:(NSString*) value;
- (PP_RegistPack_Builder*) clearNickname;

- (BOOL) hasAvatarImg;
- (NSString*) avatarImg;
- (PP_RegistPack_Builder*) setAvatarImg:(NSString*) value;
- (PP_RegistPack_Builder*) clearAvatarImg;

- (BOOL) hasDuid;
- (NSString*) duid;
- (PP_RegistPack_Builder*) setDuid:(NSString*) value;
- (PP_RegistPack_Builder*) clearDuid;
@end

