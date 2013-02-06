// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "PP_ChildSkillData.pb.h"

@implementation PpChildSkillDataRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [PpChildSkillDataRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface PP_ChildSkillData ()
@property int32_t skillId;
@property int32_t itemId;
@property int32_t itemNum;
@end

@implementation PP_ChildSkillData

- (BOOL) hasSkillId {
  return !!hasSkillId_;
}
- (void) setHasSkillId:(BOOL) value_ {
  hasSkillId_ = !!value_;
}
@synthesize skillId;
- (BOOL) hasItemId {
  return !!hasItemId_;
}
- (void) setHasItemId:(BOOL) value_ {
  hasItemId_ = !!value_;
}
@synthesize itemId;
- (BOOL) hasItemNum {
  return !!hasItemNum_;
}
- (void) setHasItemNum:(BOOL) value_ {
  hasItemNum_ = !!value_;
}
@synthesize itemNum;
- (void) dealloc {
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.skillId = 0;
    self.itemId = 0;
    self.itemNum = 0;
  }
  return self;
}
static PP_ChildSkillData* defaultPP_ChildSkillDataInstance = nil;
+ (void) initialize {
  if (self == [PP_ChildSkillData class]) {
    defaultPP_ChildSkillDataInstance = [[PP_ChildSkillData alloc] init];
  }
}
+ (PP_ChildSkillData*) defaultInstance {
  return defaultPP_ChildSkillDataInstance;
}
- (PP_ChildSkillData*) defaultInstance {
  return defaultPP_ChildSkillDataInstance;
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasSkillId) {
    [output writeInt32:1 value:self.skillId];
  }
  if (self.hasItemId) {
    [output writeInt32:2 value:self.itemId];
  }
  if (self.hasItemNum) {
    [output writeInt32:3 value:self.itemNum];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size_ = memoizedSerializedSize;
  if (size_ != -1) {
    return size_;
  }

  size_ = 0;
  if (self.hasSkillId) {
    size_ += computeInt32Size(1, self.skillId);
  }
  if (self.hasItemId) {
    size_ += computeInt32Size(2, self.itemId);
  }
  if (self.hasItemNum) {
    size_ += computeInt32Size(3, self.itemNum);
  }
  size_ += self.unknownFields.serializedSize;
  memoizedSerializedSize = size_;
  return size_;
}
+ (PP_ChildSkillData*) parseFromData:(NSData*) data {
  return (PP_ChildSkillData*)[[[PP_ChildSkillData builder] mergeFromData:data] build];
}
+ (PP_ChildSkillData*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_ChildSkillData*)[[[PP_ChildSkillData builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (PP_ChildSkillData*) parseFromInputStream:(NSInputStream*) input {
  return (PP_ChildSkillData*)[[[PP_ChildSkillData builder] mergeFromInputStream:input] build];
}
+ (PP_ChildSkillData*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_ChildSkillData*)[[[PP_ChildSkillData builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (PP_ChildSkillData*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (PP_ChildSkillData*)[[[PP_ChildSkillData builder] mergeFromCodedInputStream:input] build];
}
+ (PP_ChildSkillData*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_ChildSkillData*)[[[PP_ChildSkillData builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (PP_ChildSkillData_Builder*) builder {
  return [[[PP_ChildSkillData_Builder alloc] init] autorelease];
}
+ (PP_ChildSkillData_Builder*) builderWithPrototype:(PP_ChildSkillData*) prototype {
  return [[PP_ChildSkillData builder] mergeFrom:prototype];
}
- (PP_ChildSkillData_Builder*) builder {
  return [PP_ChildSkillData builder];
}
- (PP_ChildSkillData_Builder*) toBuilder {
  return [PP_ChildSkillData builderWithPrototype:self];
}
- (void) writeDescriptionTo:(NSMutableString*) output withIndent:(NSString*) indent {
  if (self.hasSkillId) {
    [output appendFormat:@"%@%@: %@\n", indent, @"skillId", [NSNumber numberWithInt:self.skillId]];
  }
  if (self.hasItemId) {
    [output appendFormat:@"%@%@: %@\n", indent, @"itemId", [NSNumber numberWithInt:self.itemId]];
  }
  if (self.hasItemNum) {
    [output appendFormat:@"%@%@: %@\n", indent, @"itemNum", [NSNumber numberWithInt:self.itemNum]];
  }
  [self.unknownFields writeDescriptionTo:output withIndent:indent];
}
- (BOOL) isEqual:(id)other {
  if (other == self) {
    return YES;
  }
  if (![other isKindOfClass:[PP_ChildSkillData class]]) {
    return NO;
  }
  PP_ChildSkillData *otherMessage = other;
  return
      self.hasSkillId == otherMessage.hasSkillId &&
      (!self.hasSkillId || self.skillId == otherMessage.skillId) &&
      self.hasItemId == otherMessage.hasItemId &&
      (!self.hasItemId || self.itemId == otherMessage.itemId) &&
      self.hasItemNum == otherMessage.hasItemNum &&
      (!self.hasItemNum || self.itemNum == otherMessage.itemNum) &&
      (self.unknownFields == otherMessage.unknownFields || (self.unknownFields != nil && [self.unknownFields isEqual:otherMessage.unknownFields]));
}
- (NSUInteger) hash {
  NSUInteger hashCode = 7;
  if (self.hasSkillId) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.skillId] hash];
  }
  if (self.hasItemId) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.itemId] hash];
  }
  if (self.hasItemNum) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.itemNum] hash];
  }
  hashCode = hashCode * 31 + [self.unknownFields hash];
  return hashCode;
}
@end

@interface PP_ChildSkillData_Builder()
@property (retain) PP_ChildSkillData* result;
@end

@implementation PP_ChildSkillData_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[PP_ChildSkillData alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (PP_ChildSkillData_Builder*) clear {
  self.result = [[[PP_ChildSkillData alloc] init] autorelease];
  return self;
}
- (PP_ChildSkillData_Builder*) clone {
  return [PP_ChildSkillData builderWithPrototype:result];
}
- (PP_ChildSkillData*) defaultInstance {
  return [PP_ChildSkillData defaultInstance];
}
- (PP_ChildSkillData*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (PP_ChildSkillData*) buildPartial {
  PP_ChildSkillData* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (PP_ChildSkillData_Builder*) mergeFrom:(PP_ChildSkillData*) other {
  if (other == [PP_ChildSkillData defaultInstance]) {
    return self;
  }
  if (other.hasSkillId) {
    [self setSkillId:other.skillId];
  }
  if (other.hasItemId) {
    [self setItemId:other.itemId];
  }
  if (other.hasItemNum) {
    [self setItemNum:other.itemNum];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (PP_ChildSkillData_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (PP_ChildSkillData_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSet_Builder* unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 8: {
        [self setSkillId:[input readInt32]];
        break;
      }
      case 16: {
        [self setItemId:[input readInt32]];
        break;
      }
      case 24: {
        [self setItemNum:[input readInt32]];
        break;
      }
    }
  }
}
- (BOOL) hasSkillId {
  return result.hasSkillId;
}
- (int32_t) skillId {
  return result.skillId;
}
- (PP_ChildSkillData_Builder*) setSkillId:(int32_t) value {
  result.hasSkillId = YES;
  result.skillId = value;
  return self;
}
- (PP_ChildSkillData_Builder*) clearSkillId {
  result.hasSkillId = NO;
  result.skillId = 0;
  return self;
}
- (BOOL) hasItemId {
  return result.hasItemId;
}
- (int32_t) itemId {
  return result.itemId;
}
- (PP_ChildSkillData_Builder*) setItemId:(int32_t) value {
  result.hasItemId = YES;
  result.itemId = value;
  return self;
}
- (PP_ChildSkillData_Builder*) clearItemId {
  result.hasItemId = NO;
  result.itemId = 0;
  return self;
}
- (BOOL) hasItemNum {
  return result.hasItemNum;
}
- (int32_t) itemNum {
  return result.itemNum;
}
- (PP_ChildSkillData_Builder*) setItemNum:(int32_t) value {
  result.hasItemNum = YES;
  result.itemNum = value;
  return self;
}
- (PP_ChildSkillData_Builder*) clearItemNum {
  result.hasItemNum = NO;
  result.itemNum = 0;
  return self;
}
@end
