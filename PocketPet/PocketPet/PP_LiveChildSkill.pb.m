// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "PP_LiveChildSkill.pb.h"

@implementation PpLiveChildSkillRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [PpLiveChildSkillRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    [PpChildSkillDataRoot registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface PP_LiveChildSkill ()
@property int32_t skillId;
@property int32_t liveSkillId;
@property (retain) NSString* skillName;
@property int32_t reqPractise;
@property int32_t reqLevel;
@property int32_t reqFormula;
@property (retain) NSString* skillDes;
@property (retain) NSString* skillIcon;
@property int32_t targetItemId;
@property int32_t createTime;
@property (retain) PBAppendableArray * skillDataArray;
@end

@implementation PP_LiveChildSkill

- (BOOL) hasSkillId {
  return !!hasSkillId_;
}
- (void) setHasSkillId:(BOOL) value_ {
  hasSkillId_ = !!value_;
}
@synthesize skillId;
- (BOOL) hasLiveSkillId {
  return !!hasLiveSkillId_;
}
- (void) setHasLiveSkillId:(BOOL) value_ {
  hasLiveSkillId_ = !!value_;
}
@synthesize liveSkillId;
- (BOOL) hasSkillName {
  return !!hasSkillName_;
}
- (void) setHasSkillName:(BOOL) value_ {
  hasSkillName_ = !!value_;
}
@synthesize skillName;
- (BOOL) hasReqPractise {
  return !!hasReqPractise_;
}
- (void) setHasReqPractise:(BOOL) value_ {
  hasReqPractise_ = !!value_;
}
@synthesize reqPractise;
- (BOOL) hasReqLevel {
  return !!hasReqLevel_;
}
- (void) setHasReqLevel:(BOOL) value_ {
  hasReqLevel_ = !!value_;
}
@synthesize reqLevel;
- (BOOL) hasReqFormula {
  return !!hasReqFormula_;
}
- (void) setHasReqFormula:(BOOL) value_ {
  hasReqFormula_ = !!value_;
}
@synthesize reqFormula;
- (BOOL) hasSkillDes {
  return !!hasSkillDes_;
}
- (void) setHasSkillDes:(BOOL) value_ {
  hasSkillDes_ = !!value_;
}
@synthesize skillDes;
- (BOOL) hasSkillIcon {
  return !!hasSkillIcon_;
}
- (void) setHasSkillIcon:(BOOL) value_ {
  hasSkillIcon_ = !!value_;
}
@synthesize skillIcon;
- (BOOL) hasTargetItemId {
  return !!hasTargetItemId_;
}
- (void) setHasTargetItemId:(BOOL) value_ {
  hasTargetItemId_ = !!value_;
}
@synthesize targetItemId;
- (BOOL) hasCreateTime {
  return !!hasCreateTime_;
}
- (void) setHasCreateTime:(BOOL) value_ {
  hasCreateTime_ = !!value_;
}
@synthesize createTime;
@synthesize skillDataArray;
@dynamic skillData;
- (void) dealloc {
  self.skillName = nil;
  self.skillDes = nil;
  self.skillIcon = nil;
  self.skillDataArray = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.skillId = 0;
    self.liveSkillId = 0;
    self.skillName = @"";
    self.reqPractise = 0;
    self.reqLevel = 0;
    self.reqFormula = 0;
    self.skillDes = @"";
    self.skillIcon = @"";
    self.targetItemId = 0;
    self.createTime = 0;
  }
  return self;
}
static PP_LiveChildSkill* defaultPP_LiveChildSkillInstance = nil;
+ (void) initialize {
  if (self == [PP_LiveChildSkill class]) {
    defaultPP_LiveChildSkillInstance = [[PP_LiveChildSkill alloc] init];
  }
}
+ (PP_LiveChildSkill*) defaultInstance {
  return defaultPP_LiveChildSkillInstance;
}
- (PP_LiveChildSkill*) defaultInstance {
  return defaultPP_LiveChildSkillInstance;
}
- (PBArray *)skillData {
  return skillDataArray;
}
- (PP_ChildSkillData*)skillDataAtIndex:(NSUInteger)index {
  return [skillDataArray objectAtIndex:index];
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasSkillId) {
    [output writeInt32:1 value:self.skillId];
  }
  if (self.hasLiveSkillId) {
    [output writeInt32:2 value:self.liveSkillId];
  }
  if (self.hasSkillName) {
    [output writeString:3 value:self.skillName];
  }
  if (self.hasReqPractise) {
    [output writeInt32:4 value:self.reqPractise];
  }
  if (self.hasReqLevel) {
    [output writeInt32:5 value:self.reqLevel];
  }
  if (self.hasReqFormula) {
    [output writeInt32:6 value:self.reqFormula];
  }
  if (self.hasSkillDes) {
    [output writeString:7 value:self.skillDes];
  }
  if (self.hasSkillIcon) {
    [output writeString:8 value:self.skillIcon];
  }
  if (self.hasTargetItemId) {
    [output writeInt32:9 value:self.targetItemId];
  }
  if (self.hasCreateTime) {
    [output writeInt32:10 value:self.createTime];
  }
  for (PP_ChildSkillData *element in self.skillDataArray) {
    [output writeMessage:11 value:element];
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
  if (self.hasLiveSkillId) {
    size_ += computeInt32Size(2, self.liveSkillId);
  }
  if (self.hasSkillName) {
    size_ += computeStringSize(3, self.skillName);
  }
  if (self.hasReqPractise) {
    size_ += computeInt32Size(4, self.reqPractise);
  }
  if (self.hasReqLevel) {
    size_ += computeInt32Size(5, self.reqLevel);
  }
  if (self.hasReqFormula) {
    size_ += computeInt32Size(6, self.reqFormula);
  }
  if (self.hasSkillDes) {
    size_ += computeStringSize(7, self.skillDes);
  }
  if (self.hasSkillIcon) {
    size_ += computeStringSize(8, self.skillIcon);
  }
  if (self.hasTargetItemId) {
    size_ += computeInt32Size(9, self.targetItemId);
  }
  if (self.hasCreateTime) {
    size_ += computeInt32Size(10, self.createTime);
  }
  for (PP_ChildSkillData *element in self.skillDataArray) {
    size_ += computeMessageSize(11, element);
  }
  size_ += self.unknownFields.serializedSize;
  memoizedSerializedSize = size_;
  return size_;
}
+ (PP_LiveChildSkill*) parseFromData:(NSData*) data {
  return (PP_LiveChildSkill*)[[[PP_LiveChildSkill builder] mergeFromData:data] build];
}
+ (PP_LiveChildSkill*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_LiveChildSkill*)[[[PP_LiveChildSkill builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (PP_LiveChildSkill*) parseFromInputStream:(NSInputStream*) input {
  return (PP_LiveChildSkill*)[[[PP_LiveChildSkill builder] mergeFromInputStream:input] build];
}
+ (PP_LiveChildSkill*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_LiveChildSkill*)[[[PP_LiveChildSkill builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (PP_LiveChildSkill*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (PP_LiveChildSkill*)[[[PP_LiveChildSkill builder] mergeFromCodedInputStream:input] build];
}
+ (PP_LiveChildSkill*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_LiveChildSkill*)[[[PP_LiveChildSkill builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (PP_LiveChildSkill_Builder*) builder {
  return [[[PP_LiveChildSkill_Builder alloc] init] autorelease];
}
+ (PP_LiveChildSkill_Builder*) builderWithPrototype:(PP_LiveChildSkill*) prototype {
  return [[PP_LiveChildSkill builder] mergeFrom:prototype];
}
- (PP_LiveChildSkill_Builder*) builder {
  return [PP_LiveChildSkill builder];
}
- (PP_LiveChildSkill_Builder*) toBuilder {
  return [PP_LiveChildSkill builderWithPrototype:self];
}
- (void) writeDescriptionTo:(NSMutableString*) output withIndent:(NSString*) indent {
  if (self.hasSkillId) {
    [output appendFormat:@"%@%@: %@\n", indent, @"skillId", [NSNumber numberWithInt:self.skillId]];
  }
  if (self.hasLiveSkillId) {
    [output appendFormat:@"%@%@: %@\n", indent, @"liveSkillId", [NSNumber numberWithInt:self.liveSkillId]];
  }
  if (self.hasSkillName) {
    [output appendFormat:@"%@%@: %@\n", indent, @"skillName", self.skillName];
  }
  if (self.hasReqPractise) {
    [output appendFormat:@"%@%@: %@\n", indent, @"reqPractise", [NSNumber numberWithInt:self.reqPractise]];
  }
  if (self.hasReqLevel) {
    [output appendFormat:@"%@%@: %@\n", indent, @"reqLevel", [NSNumber numberWithInt:self.reqLevel]];
  }
  if (self.hasReqFormula) {
    [output appendFormat:@"%@%@: %@\n", indent, @"reqFormula", [NSNumber numberWithInt:self.reqFormula]];
  }
  if (self.hasSkillDes) {
    [output appendFormat:@"%@%@: %@\n", indent, @"skillDes", self.skillDes];
  }
  if (self.hasSkillIcon) {
    [output appendFormat:@"%@%@: %@\n", indent, @"skillIcon", self.skillIcon];
  }
  if (self.hasTargetItemId) {
    [output appendFormat:@"%@%@: %@\n", indent, @"targetItemId", [NSNumber numberWithInt:self.targetItemId]];
  }
  if (self.hasCreateTime) {
    [output appendFormat:@"%@%@: %@\n", indent, @"createTime", [NSNumber numberWithInt:self.createTime]];
  }
  for (PP_ChildSkillData* element in self.skillDataArray) {
    [output appendFormat:@"%@%@ {\n", indent, @"skillData"];
    [element writeDescriptionTo:output
                     withIndent:[NSString stringWithFormat:@"%@  ", indent]];
    [output appendFormat:@"%@}\n", indent];
  }
  [self.unknownFields writeDescriptionTo:output withIndent:indent];
}
- (BOOL) isEqual:(id)other {
  if (other == self) {
    return YES;
  }
  if (![other isKindOfClass:[PP_LiveChildSkill class]]) {
    return NO;
  }
  PP_LiveChildSkill *otherMessage = other;
  return
      self.hasSkillId == otherMessage.hasSkillId &&
      (!self.hasSkillId || self.skillId == otherMessage.skillId) &&
      self.hasLiveSkillId == otherMessage.hasLiveSkillId &&
      (!self.hasLiveSkillId || self.liveSkillId == otherMessage.liveSkillId) &&
      self.hasSkillName == otherMessage.hasSkillName &&
      (!self.hasSkillName || [self.skillName isEqual:otherMessage.skillName]) &&
      self.hasReqPractise == otherMessage.hasReqPractise &&
      (!self.hasReqPractise || self.reqPractise == otherMessage.reqPractise) &&
      self.hasReqLevel == otherMessage.hasReqLevel &&
      (!self.hasReqLevel || self.reqLevel == otherMessage.reqLevel) &&
      self.hasReqFormula == otherMessage.hasReqFormula &&
      (!self.hasReqFormula || self.reqFormula == otherMessage.reqFormula) &&
      self.hasSkillDes == otherMessage.hasSkillDes &&
      (!self.hasSkillDes || [self.skillDes isEqual:otherMessage.skillDes]) &&
      self.hasSkillIcon == otherMessage.hasSkillIcon &&
      (!self.hasSkillIcon || [self.skillIcon isEqual:otherMessage.skillIcon]) &&
      self.hasTargetItemId == otherMessage.hasTargetItemId &&
      (!self.hasTargetItemId || self.targetItemId == otherMessage.targetItemId) &&
      self.hasCreateTime == otherMessage.hasCreateTime &&
      (!self.hasCreateTime || self.createTime == otherMessage.createTime) &&
      [self.skillDataArray isEqualToArray:otherMessage.skillDataArray] &&
      (self.unknownFields == otherMessage.unknownFields || (self.unknownFields != nil && [self.unknownFields isEqual:otherMessage.unknownFields]));
}
- (NSUInteger) hash {
  NSUInteger hashCode = 7;
  if (self.hasSkillId) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.skillId] hash];
  }
  if (self.hasLiveSkillId) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.liveSkillId] hash];
  }
  if (self.hasSkillName) {
    hashCode = hashCode * 31 + [self.skillName hash];
  }
  if (self.hasReqPractise) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.reqPractise] hash];
  }
  if (self.hasReqLevel) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.reqLevel] hash];
  }
  if (self.hasReqFormula) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.reqFormula] hash];
  }
  if (self.hasSkillDes) {
    hashCode = hashCode * 31 + [self.skillDes hash];
  }
  if (self.hasSkillIcon) {
    hashCode = hashCode * 31 + [self.skillIcon hash];
  }
  if (self.hasTargetItemId) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.targetItemId] hash];
  }
  if (self.hasCreateTime) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.createTime] hash];
  }
  for (PP_ChildSkillData* element in self.skillDataArray) {
    hashCode = hashCode * 31 + [element hash];
  }
  hashCode = hashCode * 31 + [self.unknownFields hash];
  return hashCode;
}
@end

@interface PP_LiveChildSkill_Builder()
@property (retain) PP_LiveChildSkill* result;
@end

@implementation PP_LiveChildSkill_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[PP_LiveChildSkill alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (PP_LiveChildSkill_Builder*) clear {
  self.result = [[[PP_LiveChildSkill alloc] init] autorelease];
  return self;
}
- (PP_LiveChildSkill_Builder*) clone {
  return [PP_LiveChildSkill builderWithPrototype:result];
}
- (PP_LiveChildSkill*) defaultInstance {
  return [PP_LiveChildSkill defaultInstance];
}
- (PP_LiveChildSkill*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (PP_LiveChildSkill*) buildPartial {
  PP_LiveChildSkill* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (PP_LiveChildSkill_Builder*) mergeFrom:(PP_LiveChildSkill*) other {
  if (other == [PP_LiveChildSkill defaultInstance]) {
    return self;
  }
  if (other.hasSkillId) {
    [self setSkillId:other.skillId];
  }
  if (other.hasLiveSkillId) {
    [self setLiveSkillId:other.liveSkillId];
  }
  if (other.hasSkillName) {
    [self setSkillName:other.skillName];
  }
  if (other.hasReqPractise) {
    [self setReqPractise:other.reqPractise];
  }
  if (other.hasReqLevel) {
    [self setReqLevel:other.reqLevel];
  }
  if (other.hasReqFormula) {
    [self setReqFormula:other.reqFormula];
  }
  if (other.hasSkillDes) {
    [self setSkillDes:other.skillDes];
  }
  if (other.hasSkillIcon) {
    [self setSkillIcon:other.skillIcon];
  }
  if (other.hasTargetItemId) {
    [self setTargetItemId:other.targetItemId];
  }
  if (other.hasCreateTime) {
    [self setCreateTime:other.createTime];
  }
  if (other.skillDataArray.count > 0) {
    if (result.skillDataArray == nil) {
      result.skillDataArray = [[other.skillDataArray copyWithZone:[other.skillDataArray zone]] autorelease];
    } else {
      [result.skillDataArray appendArray:other.skillDataArray];
    }
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (PP_LiveChildSkill_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (PP_LiveChildSkill_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
        [self setLiveSkillId:[input readInt32]];
        break;
      }
      case 26: {
        [self setSkillName:[input readString]];
        break;
      }
      case 32: {
        [self setReqPractise:[input readInt32]];
        break;
      }
      case 40: {
        [self setReqLevel:[input readInt32]];
        break;
      }
      case 48: {
        [self setReqFormula:[input readInt32]];
        break;
      }
      case 58: {
        [self setSkillDes:[input readString]];
        break;
      }
      case 66: {
        [self setSkillIcon:[input readString]];
        break;
      }
      case 72: {
        [self setTargetItemId:[input readInt32]];
        break;
      }
      case 80: {
        [self setCreateTime:[input readInt32]];
        break;
      }
      case 90: {
        PP_ChildSkillData_Builder* subBuilder = [PP_ChildSkillData builder];
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self addSkillData:[subBuilder buildPartial]];
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
- (PP_LiveChildSkill_Builder*) setSkillId:(int32_t) value {
  result.hasSkillId = YES;
  result.skillId = value;
  return self;
}
- (PP_LiveChildSkill_Builder*) clearSkillId {
  result.hasSkillId = NO;
  result.skillId = 0;
  return self;
}
- (BOOL) hasLiveSkillId {
  return result.hasLiveSkillId;
}
- (int32_t) liveSkillId {
  return result.liveSkillId;
}
- (PP_LiveChildSkill_Builder*) setLiveSkillId:(int32_t) value {
  result.hasLiveSkillId = YES;
  result.liveSkillId = value;
  return self;
}
- (PP_LiveChildSkill_Builder*) clearLiveSkillId {
  result.hasLiveSkillId = NO;
  result.liveSkillId = 0;
  return self;
}
- (BOOL) hasSkillName {
  return result.hasSkillName;
}
- (NSString*) skillName {
  return result.skillName;
}
- (PP_LiveChildSkill_Builder*) setSkillName:(NSString*) value {
  result.hasSkillName = YES;
  result.skillName = value;
  return self;
}
- (PP_LiveChildSkill_Builder*) clearSkillName {
  result.hasSkillName = NO;
  result.skillName = @"";
  return self;
}
- (BOOL) hasReqPractise {
  return result.hasReqPractise;
}
- (int32_t) reqPractise {
  return result.reqPractise;
}
- (PP_LiveChildSkill_Builder*) setReqPractise:(int32_t) value {
  result.hasReqPractise = YES;
  result.reqPractise = value;
  return self;
}
- (PP_LiveChildSkill_Builder*) clearReqPractise {
  result.hasReqPractise = NO;
  result.reqPractise = 0;
  return self;
}
- (BOOL) hasReqLevel {
  return result.hasReqLevel;
}
- (int32_t) reqLevel {
  return result.reqLevel;
}
- (PP_LiveChildSkill_Builder*) setReqLevel:(int32_t) value {
  result.hasReqLevel = YES;
  result.reqLevel = value;
  return self;
}
- (PP_LiveChildSkill_Builder*) clearReqLevel {
  result.hasReqLevel = NO;
  result.reqLevel = 0;
  return self;
}
- (BOOL) hasReqFormula {
  return result.hasReqFormula;
}
- (int32_t) reqFormula {
  return result.reqFormula;
}
- (PP_LiveChildSkill_Builder*) setReqFormula:(int32_t) value {
  result.hasReqFormula = YES;
  result.reqFormula = value;
  return self;
}
- (PP_LiveChildSkill_Builder*) clearReqFormula {
  result.hasReqFormula = NO;
  result.reqFormula = 0;
  return self;
}
- (BOOL) hasSkillDes {
  return result.hasSkillDes;
}
- (NSString*) skillDes {
  return result.skillDes;
}
- (PP_LiveChildSkill_Builder*) setSkillDes:(NSString*) value {
  result.hasSkillDes = YES;
  result.skillDes = value;
  return self;
}
- (PP_LiveChildSkill_Builder*) clearSkillDes {
  result.hasSkillDes = NO;
  result.skillDes = @"";
  return self;
}
- (BOOL) hasSkillIcon {
  return result.hasSkillIcon;
}
- (NSString*) skillIcon {
  return result.skillIcon;
}
- (PP_LiveChildSkill_Builder*) setSkillIcon:(NSString*) value {
  result.hasSkillIcon = YES;
  result.skillIcon = value;
  return self;
}
- (PP_LiveChildSkill_Builder*) clearSkillIcon {
  result.hasSkillIcon = NO;
  result.skillIcon = @"";
  return self;
}
- (BOOL) hasTargetItemId {
  return result.hasTargetItemId;
}
- (int32_t) targetItemId {
  return result.targetItemId;
}
- (PP_LiveChildSkill_Builder*) setTargetItemId:(int32_t) value {
  result.hasTargetItemId = YES;
  result.targetItemId = value;
  return self;
}
- (PP_LiveChildSkill_Builder*) clearTargetItemId {
  result.hasTargetItemId = NO;
  result.targetItemId = 0;
  return self;
}
- (BOOL) hasCreateTime {
  return result.hasCreateTime;
}
- (int32_t) createTime {
  return result.createTime;
}
- (PP_LiveChildSkill_Builder*) setCreateTime:(int32_t) value {
  result.hasCreateTime = YES;
  result.createTime = value;
  return self;
}
- (PP_LiveChildSkill_Builder*) clearCreateTime {
  result.hasCreateTime = NO;
  result.createTime = 0;
  return self;
}
- (PBAppendableArray *)skillData {
  return result.skillDataArray;
}
- (PP_ChildSkillData*)skillDataAtIndex:(NSUInteger)index {
  return [result skillDataAtIndex:index];
}
- (PP_LiveChildSkill_Builder *)addSkillData:(PP_ChildSkillData*)value {
  if (result.skillDataArray == nil) {
    result.skillDataArray = [PBAppendableArray arrayWithValueType:PBArrayValueTypeObject];
  }
  [result.skillDataArray addObject:value];
  return self;
}
- (PP_LiveChildSkill_Builder *)setSkillDataArray:(NSArray *)array {
  result.skillDataArray = [PBAppendableArray arrayWithArray:array valueType:PBArrayValueTypeObject];
  return self;
}
- (PP_LiveChildSkill_Builder *)setSkillDataValues:(const PP_ChildSkillData* *)values count:(NSUInteger)count {
  result.skillDataArray = [PBAppendableArray arrayWithValues:values count:count valueType:PBArrayValueTypeObject];
  return self;
}
- (PP_LiveChildSkill_Builder *)clearSkillData {
  result.skillDataArray = nil;
  return self;
}
@end

