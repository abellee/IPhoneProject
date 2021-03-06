// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import <ProtocolBuffers/ProtocolBuffers.h>

#import "PP_LiveChildSkill.pb.h"

@class PP_ChildSkillData;
@class PP_ChildSkillData_Builder;
@class PP_LiveChildSkill;
@class PP_LiveChildSkill_Builder;
@class PP_LiveSkill;
@class PP_LiveSkill_Builder;
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


@interface PpLiveSkillRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface PP_LiveSkill : PBGeneratedMessage {
@private
  BOOL hasSkillId_:1;
  BOOL hasReqLevel_:1;
  BOOL hasReqElement_:1;
  BOOL hasReqSex_:1;
  BOOL hasReqTask_:1;
  BOOL hasCreateTime_:1;
  BOOL hasSkillName_:1;
  int32_t skillId;
  int32_t reqLevel;
  int32_t reqElement;
  int32_t reqSex;
  int32_t reqTask;
  int32_t createTime;
  NSString* skillName;
  PBAppendableArray * childSkillsArray;
}
- (BOOL) hasSkillId;
- (BOOL) hasSkillName;
- (BOOL) hasReqLevel;
- (BOOL) hasReqElement;
- (BOOL) hasReqSex;
- (BOOL) hasReqTask;
- (BOOL) hasCreateTime;
@property (readonly) int32_t skillId;
@property (readonly, retain) NSString* skillName;
@property (readonly) int32_t reqLevel;
@property (readonly) int32_t reqElement;
@property (readonly) int32_t reqSex;
@property (readonly) int32_t reqTask;
@property (readonly) int32_t createTime;
@property (readonly, retain) PBArray * childSkills;
- (PP_LiveChildSkill*)childSkillsAtIndex:(NSUInteger)index;

+ (PP_LiveSkill*) defaultInstance;
- (PP_LiveSkill*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PP_LiveSkill_Builder*) builder;
+ (PP_LiveSkill_Builder*) builder;
+ (PP_LiveSkill_Builder*) builderWithPrototype:(PP_LiveSkill*) prototype;
- (PP_LiveSkill_Builder*) toBuilder;

+ (PP_LiveSkill*) parseFromData:(NSData*) data;
+ (PP_LiveSkill*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PP_LiveSkill*) parseFromInputStream:(NSInputStream*) input;
+ (PP_LiveSkill*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PP_LiveSkill*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PP_LiveSkill*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PP_LiveSkill_Builder : PBGeneratedMessage_Builder {
@private
  PP_LiveSkill* result;
}

- (PP_LiveSkill*) defaultInstance;

- (PP_LiveSkill_Builder*) clear;
- (PP_LiveSkill_Builder*) clone;

- (PP_LiveSkill*) build;
- (PP_LiveSkill*) buildPartial;

- (PP_LiveSkill_Builder*) mergeFrom:(PP_LiveSkill*) other;
- (PP_LiveSkill_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PP_LiveSkill_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasSkillId;
- (int32_t) skillId;
- (PP_LiveSkill_Builder*) setSkillId:(int32_t) value;
- (PP_LiveSkill_Builder*) clearSkillId;

- (BOOL) hasSkillName;
- (NSString*) skillName;
- (PP_LiveSkill_Builder*) setSkillName:(NSString*) value;
- (PP_LiveSkill_Builder*) clearSkillName;

- (BOOL) hasReqLevel;
- (int32_t) reqLevel;
- (PP_LiveSkill_Builder*) setReqLevel:(int32_t) value;
- (PP_LiveSkill_Builder*) clearReqLevel;

- (BOOL) hasReqElement;
- (int32_t) reqElement;
- (PP_LiveSkill_Builder*) setReqElement:(int32_t) value;
- (PP_LiveSkill_Builder*) clearReqElement;

- (BOOL) hasReqSex;
- (int32_t) reqSex;
- (PP_LiveSkill_Builder*) setReqSex:(int32_t) value;
- (PP_LiveSkill_Builder*) clearReqSex;

- (BOOL) hasReqTask;
- (int32_t) reqTask;
- (PP_LiveSkill_Builder*) setReqTask:(int32_t) value;
- (PP_LiveSkill_Builder*) clearReqTask;

- (BOOL) hasCreateTime;
- (int32_t) createTime;
- (PP_LiveSkill_Builder*) setCreateTime:(int32_t) value;
- (PP_LiveSkill_Builder*) clearCreateTime;

- (PBAppendableArray *)childSkills;
- (PP_LiveChildSkill*)childSkillsAtIndex:(NSUInteger)index;
- (PP_LiveSkill_Builder *)addChildSkills:(PP_LiveChildSkill*)value;
- (PP_LiveSkill_Builder *)setChildSkillsArray:(NSArray *)array;
- (PP_LiveSkill_Builder *)setChildSkillsValues:(const PP_LiveChildSkill* *)values count:(NSUInteger)count;
- (PP_LiveSkill_Builder *)clearChildSkills;
@end

