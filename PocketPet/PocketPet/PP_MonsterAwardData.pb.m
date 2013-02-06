// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "PP_MonsterAwardData.pb.h"

@implementation PpMonsterAwardDataRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [PpMonsterAwardDataRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface PP_MonsterAwardData ()
@property int32_t awardId;
@property int32_t monsterId;
@property int32_t itemId;
@property int32_t itemNum;
@property int32_t itemType;
@property int32_t parentType;
@property int32_t rate;
@property int32_t createTime;
@end

@implementation PP_MonsterAwardData

- (BOOL) hasAwardId {
  return !!hasAwardId_;
}
- (void) setHasAwardId:(BOOL) value_ {
  hasAwardId_ = !!value_;
}
@synthesize awardId;
- (BOOL) hasMonsterId {
  return !!hasMonsterId_;
}
- (void) setHasMonsterId:(BOOL) value_ {
  hasMonsterId_ = !!value_;
}
@synthesize monsterId;
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
- (BOOL) hasItemType {
  return !!hasItemType_;
}
- (void) setHasItemType:(BOOL) value_ {
  hasItemType_ = !!value_;
}
@synthesize itemType;
- (BOOL) hasParentType {
  return !!hasParentType_;
}
- (void) setHasParentType:(BOOL) value_ {
  hasParentType_ = !!value_;
}
@synthesize parentType;
- (BOOL) hasRate {
  return !!hasRate_;
}
- (void) setHasRate:(BOOL) value_ {
  hasRate_ = !!value_;
}
@synthesize rate;
- (BOOL) hasCreateTime {
  return !!hasCreateTime_;
}
- (void) setHasCreateTime:(BOOL) value_ {
  hasCreateTime_ = !!value_;
}
@synthesize createTime;
- (void) dealloc {
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.awardId = 0;
    self.monsterId = 0;
    self.itemId = 0;
    self.itemNum = 0;
    self.itemType = 0;
    self.parentType = 0;
    self.rate = 0;
    self.createTime = 0;
  }
  return self;
}
static PP_MonsterAwardData* defaultPP_MonsterAwardDataInstance = nil;
+ (void) initialize {
  if (self == [PP_MonsterAwardData class]) {
    defaultPP_MonsterAwardDataInstance = [[PP_MonsterAwardData alloc] init];
  }
}
+ (PP_MonsterAwardData*) defaultInstance {
  return defaultPP_MonsterAwardDataInstance;
}
- (PP_MonsterAwardData*) defaultInstance {
  return defaultPP_MonsterAwardDataInstance;
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasAwardId) {
    [output writeInt32:1 value:self.awardId];
  }
  if (self.hasMonsterId) {
    [output writeInt32:2 value:self.monsterId];
  }
  if (self.hasItemId) {
    [output writeInt32:3 value:self.itemId];
  }
  if (self.hasItemNum) {
    [output writeInt32:4 value:self.itemNum];
  }
  if (self.hasItemType) {
    [output writeInt32:5 value:self.itemType];
  }
  if (self.hasParentType) {
    [output writeInt32:6 value:self.parentType];
  }
  if (self.hasRate) {
    [output writeInt32:7 value:self.rate];
  }
  if (self.hasCreateTime) {
    [output writeInt32:8 value:self.createTime];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size_ = memoizedSerializedSize;
  if (size_ != -1) {
    return size_;
  }

  size_ = 0;
  if (self.hasAwardId) {
    size_ += computeInt32Size(1, self.awardId);
  }
  if (self.hasMonsterId) {
    size_ += computeInt32Size(2, self.monsterId);
  }
  if (self.hasItemId) {
    size_ += computeInt32Size(3, self.itemId);
  }
  if (self.hasItemNum) {
    size_ += computeInt32Size(4, self.itemNum);
  }
  if (self.hasItemType) {
    size_ += computeInt32Size(5, self.itemType);
  }
  if (self.hasParentType) {
    size_ += computeInt32Size(6, self.parentType);
  }
  if (self.hasRate) {
    size_ += computeInt32Size(7, self.rate);
  }
  if (self.hasCreateTime) {
    size_ += computeInt32Size(8, self.createTime);
  }
  size_ += self.unknownFields.serializedSize;
  memoizedSerializedSize = size_;
  return size_;
}
+ (PP_MonsterAwardData*) parseFromData:(NSData*) data {
  return (PP_MonsterAwardData*)[[[PP_MonsterAwardData builder] mergeFromData:data] build];
}
+ (PP_MonsterAwardData*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_MonsterAwardData*)[[[PP_MonsterAwardData builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (PP_MonsterAwardData*) parseFromInputStream:(NSInputStream*) input {
  return (PP_MonsterAwardData*)[[[PP_MonsterAwardData builder] mergeFromInputStream:input] build];
}
+ (PP_MonsterAwardData*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_MonsterAwardData*)[[[PP_MonsterAwardData builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (PP_MonsterAwardData*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (PP_MonsterAwardData*)[[[PP_MonsterAwardData builder] mergeFromCodedInputStream:input] build];
}
+ (PP_MonsterAwardData*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_MonsterAwardData*)[[[PP_MonsterAwardData builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (PP_MonsterAwardData_Builder*) builder {
  return [[[PP_MonsterAwardData_Builder alloc] init] autorelease];
}
+ (PP_MonsterAwardData_Builder*) builderWithPrototype:(PP_MonsterAwardData*) prototype {
  return [[PP_MonsterAwardData builder] mergeFrom:prototype];
}
- (PP_MonsterAwardData_Builder*) builder {
  return [PP_MonsterAwardData builder];
}
- (PP_MonsterAwardData_Builder*) toBuilder {
  return [PP_MonsterAwardData builderWithPrototype:self];
}
- (void) writeDescriptionTo:(NSMutableString*) output withIndent:(NSString*) indent {
  if (self.hasAwardId) {
    [output appendFormat:@"%@%@: %@\n", indent, @"awardId", [NSNumber numberWithInt:self.awardId]];
  }
  if (self.hasMonsterId) {
    [output appendFormat:@"%@%@: %@\n", indent, @"monsterId", [NSNumber numberWithInt:self.monsterId]];
  }
  if (self.hasItemId) {
    [output appendFormat:@"%@%@: %@\n", indent, @"itemId", [NSNumber numberWithInt:self.itemId]];
  }
  if (self.hasItemNum) {
    [output appendFormat:@"%@%@: %@\n", indent, @"itemNum", [NSNumber numberWithInt:self.itemNum]];
  }
  if (self.hasItemType) {
    [output appendFormat:@"%@%@: %@\n", indent, @"itemType", [NSNumber numberWithInt:self.itemType]];
  }
  if (self.hasParentType) {
    [output appendFormat:@"%@%@: %@\n", indent, @"parentType", [NSNumber numberWithInt:self.parentType]];
  }
  if (self.hasRate) {
    [output appendFormat:@"%@%@: %@\n", indent, @"rate", [NSNumber numberWithInt:self.rate]];
  }
  if (self.hasCreateTime) {
    [output appendFormat:@"%@%@: %@\n", indent, @"createTime", [NSNumber numberWithInt:self.createTime]];
  }
  [self.unknownFields writeDescriptionTo:output withIndent:indent];
}
- (BOOL) isEqual:(id)other {
  if (other == self) {
    return YES;
  }
  if (![other isKindOfClass:[PP_MonsterAwardData class]]) {
    return NO;
  }
  PP_MonsterAwardData *otherMessage = other;
  return
      self.hasAwardId == otherMessage.hasAwardId &&
      (!self.hasAwardId || self.awardId == otherMessage.awardId) &&
      self.hasMonsterId == otherMessage.hasMonsterId &&
      (!self.hasMonsterId || self.monsterId == otherMessage.monsterId) &&
      self.hasItemId == otherMessage.hasItemId &&
      (!self.hasItemId || self.itemId == otherMessage.itemId) &&
      self.hasItemNum == otherMessage.hasItemNum &&
      (!self.hasItemNum || self.itemNum == otherMessage.itemNum) &&
      self.hasItemType == otherMessage.hasItemType &&
      (!self.hasItemType || self.itemType == otherMessage.itemType) &&
      self.hasParentType == otherMessage.hasParentType &&
      (!self.hasParentType || self.parentType == otherMessage.parentType) &&
      self.hasRate == otherMessage.hasRate &&
      (!self.hasRate || self.rate == otherMessage.rate) &&
      self.hasCreateTime == otherMessage.hasCreateTime &&
      (!self.hasCreateTime || self.createTime == otherMessage.createTime) &&
      (self.unknownFields == otherMessage.unknownFields || (self.unknownFields != nil && [self.unknownFields isEqual:otherMessage.unknownFields]));
}
- (NSUInteger) hash {
  NSUInteger hashCode = 7;
  if (self.hasAwardId) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.awardId] hash];
  }
  if (self.hasMonsterId) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.monsterId] hash];
  }
  if (self.hasItemId) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.itemId] hash];
  }
  if (self.hasItemNum) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.itemNum] hash];
  }
  if (self.hasItemType) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.itemType] hash];
  }
  if (self.hasParentType) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.parentType] hash];
  }
  if (self.hasRate) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.rate] hash];
  }
  if (self.hasCreateTime) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.createTime] hash];
  }
  hashCode = hashCode * 31 + [self.unknownFields hash];
  return hashCode;
}
@end

@interface PP_MonsterAwardData_Builder()
@property (retain) PP_MonsterAwardData* result;
@end

@implementation PP_MonsterAwardData_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[PP_MonsterAwardData alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (PP_MonsterAwardData_Builder*) clear {
  self.result = [[[PP_MonsterAwardData alloc] init] autorelease];
  return self;
}
- (PP_MonsterAwardData_Builder*) clone {
  return [PP_MonsterAwardData builderWithPrototype:result];
}
- (PP_MonsterAwardData*) defaultInstance {
  return [PP_MonsterAwardData defaultInstance];
}
- (PP_MonsterAwardData*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (PP_MonsterAwardData*) buildPartial {
  PP_MonsterAwardData* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (PP_MonsterAwardData_Builder*) mergeFrom:(PP_MonsterAwardData*) other {
  if (other == [PP_MonsterAwardData defaultInstance]) {
    return self;
  }
  if (other.hasAwardId) {
    [self setAwardId:other.awardId];
  }
  if (other.hasMonsterId) {
    [self setMonsterId:other.monsterId];
  }
  if (other.hasItemId) {
    [self setItemId:other.itemId];
  }
  if (other.hasItemNum) {
    [self setItemNum:other.itemNum];
  }
  if (other.hasItemType) {
    [self setItemType:other.itemType];
  }
  if (other.hasParentType) {
    [self setParentType:other.parentType];
  }
  if (other.hasRate) {
    [self setRate:other.rate];
  }
  if (other.hasCreateTime) {
    [self setCreateTime:other.createTime];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (PP_MonsterAwardData_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (PP_MonsterAwardData_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
        [self setAwardId:[input readInt32]];
        break;
      }
      case 16: {
        [self setMonsterId:[input readInt32]];
        break;
      }
      case 24: {
        [self setItemId:[input readInt32]];
        break;
      }
      case 32: {
        [self setItemNum:[input readInt32]];
        break;
      }
      case 40: {
        [self setItemType:[input readInt32]];
        break;
      }
      case 48: {
        [self setParentType:[input readInt32]];
        break;
      }
      case 56: {
        [self setRate:[input readInt32]];
        break;
      }
      case 64: {
        [self setCreateTime:[input readInt32]];
        break;
      }
    }
  }
}
- (BOOL) hasAwardId {
  return result.hasAwardId;
}
- (int32_t) awardId {
  return result.awardId;
}
- (PP_MonsterAwardData_Builder*) setAwardId:(int32_t) value {
  result.hasAwardId = YES;
  result.awardId = value;
  return self;
}
- (PP_MonsterAwardData_Builder*) clearAwardId {
  result.hasAwardId = NO;
  result.awardId = 0;
  return self;
}
- (BOOL) hasMonsterId {
  return result.hasMonsterId;
}
- (int32_t) monsterId {
  return result.monsterId;
}
- (PP_MonsterAwardData_Builder*) setMonsterId:(int32_t) value {
  result.hasMonsterId = YES;
  result.monsterId = value;
  return self;
}
- (PP_MonsterAwardData_Builder*) clearMonsterId {
  result.hasMonsterId = NO;
  result.monsterId = 0;
  return self;
}
- (BOOL) hasItemId {
  return result.hasItemId;
}
- (int32_t) itemId {
  return result.itemId;
}
- (PP_MonsterAwardData_Builder*) setItemId:(int32_t) value {
  result.hasItemId = YES;
  result.itemId = value;
  return self;
}
- (PP_MonsterAwardData_Builder*) clearItemId {
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
- (PP_MonsterAwardData_Builder*) setItemNum:(int32_t) value {
  result.hasItemNum = YES;
  result.itemNum = value;
  return self;
}
- (PP_MonsterAwardData_Builder*) clearItemNum {
  result.hasItemNum = NO;
  result.itemNum = 0;
  return self;
}
- (BOOL) hasItemType {
  return result.hasItemType;
}
- (int32_t) itemType {
  return result.itemType;
}
- (PP_MonsterAwardData_Builder*) setItemType:(int32_t) value {
  result.hasItemType = YES;
  result.itemType = value;
  return self;
}
- (PP_MonsterAwardData_Builder*) clearItemType {
  result.hasItemType = NO;
  result.itemType = 0;
  return self;
}
- (BOOL) hasParentType {
  return result.hasParentType;
}
- (int32_t) parentType {
  return result.parentType;
}
- (PP_MonsterAwardData_Builder*) setParentType:(int32_t) value {
  result.hasParentType = YES;
  result.parentType = value;
  return self;
}
- (PP_MonsterAwardData_Builder*) clearParentType {
  result.hasParentType = NO;
  result.parentType = 0;
  return self;
}
- (BOOL) hasRate {
  return result.hasRate;
}
- (int32_t) rate {
  return result.rate;
}
- (PP_MonsterAwardData_Builder*) setRate:(int32_t) value {
  result.hasRate = YES;
  result.rate = value;
  return self;
}
- (PP_MonsterAwardData_Builder*) clearRate {
  result.hasRate = NO;
  result.rate = 0;
  return self;
}
- (BOOL) hasCreateTime {
  return result.hasCreateTime;
}
- (int32_t) createTime {
  return result.createTime;
}
- (PP_MonsterAwardData_Builder*) setCreateTime:(int32_t) value {
  result.hasCreateTime = YES;
  result.createTime = value;
  return self;
}
- (PP_MonsterAwardData_Builder*) clearCreateTime {
  result.hasCreateTime = NO;
  result.createTime = 0;
  return self;
}
@end

