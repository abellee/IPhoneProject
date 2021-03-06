// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "PP_InstanceData.pb.h"

@implementation PpInstanceDataRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [PpInstanceDataRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface PP_InstanceData ()
@property int32_t instanceDataId;
@property int32_t instanceId;
@property int32_t gateNum;
@property int32_t monsterId;
@property int32_t monsterLevel;
@property int32_t monsterNum;
@property int32_t createTime;
@end

@implementation PP_InstanceData

- (BOOL) hasInstanceDataId {
  return !!hasInstanceDataId_;
}
- (void) setHasInstanceDataId:(BOOL) value_ {
  hasInstanceDataId_ = !!value_;
}
@synthesize instanceDataId;
- (BOOL) hasInstanceId {
  return !!hasInstanceId_;
}
- (void) setHasInstanceId:(BOOL) value_ {
  hasInstanceId_ = !!value_;
}
@synthesize instanceId;
- (BOOL) hasGateNum {
  return !!hasGateNum_;
}
- (void) setHasGateNum:(BOOL) value_ {
  hasGateNum_ = !!value_;
}
@synthesize gateNum;
- (BOOL) hasMonsterId {
  return !!hasMonsterId_;
}
- (void) setHasMonsterId:(BOOL) value_ {
  hasMonsterId_ = !!value_;
}
@synthesize monsterId;
- (BOOL) hasMonsterLevel {
  return !!hasMonsterLevel_;
}
- (void) setHasMonsterLevel:(BOOL) value_ {
  hasMonsterLevel_ = !!value_;
}
@synthesize monsterLevel;
- (BOOL) hasMonsterNum {
  return !!hasMonsterNum_;
}
- (void) setHasMonsterNum:(BOOL) value_ {
  hasMonsterNum_ = !!value_;
}
@synthesize monsterNum;
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
    self.instanceDataId = 0;
    self.instanceId = 0;
    self.gateNum = 0;
    self.monsterId = 0;
    self.monsterLevel = 0;
    self.monsterNum = 0;
    self.createTime = 0;
  }
  return self;
}
static PP_InstanceData* defaultPP_InstanceDataInstance = nil;
+ (void) initialize {
  if (self == [PP_InstanceData class]) {
    defaultPP_InstanceDataInstance = [[PP_InstanceData alloc] init];
  }
}
+ (PP_InstanceData*) defaultInstance {
  return defaultPP_InstanceDataInstance;
}
- (PP_InstanceData*) defaultInstance {
  return defaultPP_InstanceDataInstance;
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasInstanceDataId) {
    [output writeInt32:1 value:self.instanceDataId];
  }
  if (self.hasInstanceId) {
    [output writeInt32:2 value:self.instanceId];
  }
  if (self.hasGateNum) {
    [output writeInt32:4 value:self.gateNum];
  }
  if (self.hasMonsterId) {
    [output writeInt32:5 value:self.monsterId];
  }
  if (self.hasMonsterLevel) {
    [output writeInt32:6 value:self.monsterLevel];
  }
  if (self.hasMonsterNum) {
    [output writeInt32:7 value:self.monsterNum];
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
  if (self.hasInstanceDataId) {
    size_ += computeInt32Size(1, self.instanceDataId);
  }
  if (self.hasInstanceId) {
    size_ += computeInt32Size(2, self.instanceId);
  }
  if (self.hasGateNum) {
    size_ += computeInt32Size(4, self.gateNum);
  }
  if (self.hasMonsterId) {
    size_ += computeInt32Size(5, self.monsterId);
  }
  if (self.hasMonsterLevel) {
    size_ += computeInt32Size(6, self.monsterLevel);
  }
  if (self.hasMonsterNum) {
    size_ += computeInt32Size(7, self.monsterNum);
  }
  if (self.hasCreateTime) {
    size_ += computeInt32Size(8, self.createTime);
  }
  size_ += self.unknownFields.serializedSize;
  memoizedSerializedSize = size_;
  return size_;
}
+ (PP_InstanceData*) parseFromData:(NSData*) data {
  return (PP_InstanceData*)[[[PP_InstanceData builder] mergeFromData:data] build];
}
+ (PP_InstanceData*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_InstanceData*)[[[PP_InstanceData builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (PP_InstanceData*) parseFromInputStream:(NSInputStream*) input {
  return (PP_InstanceData*)[[[PP_InstanceData builder] mergeFromInputStream:input] build];
}
+ (PP_InstanceData*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_InstanceData*)[[[PP_InstanceData builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (PP_InstanceData*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (PP_InstanceData*)[[[PP_InstanceData builder] mergeFromCodedInputStream:input] build];
}
+ (PP_InstanceData*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_InstanceData*)[[[PP_InstanceData builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (PP_InstanceData_Builder*) builder {
  return [[[PP_InstanceData_Builder alloc] init] autorelease];
}
+ (PP_InstanceData_Builder*) builderWithPrototype:(PP_InstanceData*) prototype {
  return [[PP_InstanceData builder] mergeFrom:prototype];
}
- (PP_InstanceData_Builder*) builder {
  return [PP_InstanceData builder];
}
- (PP_InstanceData_Builder*) toBuilder {
  return [PP_InstanceData builderWithPrototype:self];
}
- (void) writeDescriptionTo:(NSMutableString*) output withIndent:(NSString*) indent {
  if (self.hasInstanceDataId) {
    [output appendFormat:@"%@%@: %@\n", indent, @"instanceDataId", [NSNumber numberWithInt:self.instanceDataId]];
  }
  if (self.hasInstanceId) {
    [output appendFormat:@"%@%@: %@\n", indent, @"instanceId", [NSNumber numberWithInt:self.instanceId]];
  }
  if (self.hasGateNum) {
    [output appendFormat:@"%@%@: %@\n", indent, @"gateNum", [NSNumber numberWithInt:self.gateNum]];
  }
  if (self.hasMonsterId) {
    [output appendFormat:@"%@%@: %@\n", indent, @"monsterId", [NSNumber numberWithInt:self.monsterId]];
  }
  if (self.hasMonsterLevel) {
    [output appendFormat:@"%@%@: %@\n", indent, @"monsterLevel", [NSNumber numberWithInt:self.monsterLevel]];
  }
  if (self.hasMonsterNum) {
    [output appendFormat:@"%@%@: %@\n", indent, @"monsterNum", [NSNumber numberWithInt:self.monsterNum]];
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
  if (![other isKindOfClass:[PP_InstanceData class]]) {
    return NO;
  }
  PP_InstanceData *otherMessage = other;
  return
      self.hasInstanceDataId == otherMessage.hasInstanceDataId &&
      (!self.hasInstanceDataId || self.instanceDataId == otherMessage.instanceDataId) &&
      self.hasInstanceId == otherMessage.hasInstanceId &&
      (!self.hasInstanceId || self.instanceId == otherMessage.instanceId) &&
      self.hasGateNum == otherMessage.hasGateNum &&
      (!self.hasGateNum || self.gateNum == otherMessage.gateNum) &&
      self.hasMonsterId == otherMessage.hasMonsterId &&
      (!self.hasMonsterId || self.monsterId == otherMessage.monsterId) &&
      self.hasMonsterLevel == otherMessage.hasMonsterLevel &&
      (!self.hasMonsterLevel || self.monsterLevel == otherMessage.monsterLevel) &&
      self.hasMonsterNum == otherMessage.hasMonsterNum &&
      (!self.hasMonsterNum || self.monsterNum == otherMessage.monsterNum) &&
      self.hasCreateTime == otherMessage.hasCreateTime &&
      (!self.hasCreateTime || self.createTime == otherMessage.createTime) &&
      (self.unknownFields == otherMessage.unknownFields || (self.unknownFields != nil && [self.unknownFields isEqual:otherMessage.unknownFields]));
}
- (NSUInteger) hash {
  NSUInteger hashCode = 7;
  if (self.hasInstanceDataId) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.instanceDataId] hash];
  }
  if (self.hasInstanceId) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.instanceId] hash];
  }
  if (self.hasGateNum) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.gateNum] hash];
  }
  if (self.hasMonsterId) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.monsterId] hash];
  }
  if (self.hasMonsterLevel) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.monsterLevel] hash];
  }
  if (self.hasMonsterNum) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.monsterNum] hash];
  }
  if (self.hasCreateTime) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.createTime] hash];
  }
  hashCode = hashCode * 31 + [self.unknownFields hash];
  return hashCode;
}
@end

@interface PP_InstanceData_Builder()
@property (retain) PP_InstanceData* result;
@end

@implementation PP_InstanceData_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[PP_InstanceData alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (PP_InstanceData_Builder*) clear {
  self.result = [[[PP_InstanceData alloc] init] autorelease];
  return self;
}
- (PP_InstanceData_Builder*) clone {
  return [PP_InstanceData builderWithPrototype:result];
}
- (PP_InstanceData*) defaultInstance {
  return [PP_InstanceData defaultInstance];
}
- (PP_InstanceData*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (PP_InstanceData*) buildPartial {
  PP_InstanceData* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (PP_InstanceData_Builder*) mergeFrom:(PP_InstanceData*) other {
  if (other == [PP_InstanceData defaultInstance]) {
    return self;
  }
  if (other.hasInstanceDataId) {
    [self setInstanceDataId:other.instanceDataId];
  }
  if (other.hasInstanceId) {
    [self setInstanceId:other.instanceId];
  }
  if (other.hasGateNum) {
    [self setGateNum:other.gateNum];
  }
  if (other.hasMonsterId) {
    [self setMonsterId:other.monsterId];
  }
  if (other.hasMonsterLevel) {
    [self setMonsterLevel:other.monsterLevel];
  }
  if (other.hasMonsterNum) {
    [self setMonsterNum:other.monsterNum];
  }
  if (other.hasCreateTime) {
    [self setCreateTime:other.createTime];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (PP_InstanceData_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (PP_InstanceData_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
        [self setInstanceDataId:[input readInt32]];
        break;
      }
      case 16: {
        [self setInstanceId:[input readInt32]];
        break;
      }
      case 32: {
        [self setGateNum:[input readInt32]];
        break;
      }
      case 40: {
        [self setMonsterId:[input readInt32]];
        break;
      }
      case 48: {
        [self setMonsterLevel:[input readInt32]];
        break;
      }
      case 56: {
        [self setMonsterNum:[input readInt32]];
        break;
      }
      case 64: {
        [self setCreateTime:[input readInt32]];
        break;
      }
    }
  }
}
- (BOOL) hasInstanceDataId {
  return result.hasInstanceDataId;
}
- (int32_t) instanceDataId {
  return result.instanceDataId;
}
- (PP_InstanceData_Builder*) setInstanceDataId:(int32_t) value {
  result.hasInstanceDataId = YES;
  result.instanceDataId = value;
  return self;
}
- (PP_InstanceData_Builder*) clearInstanceDataId {
  result.hasInstanceDataId = NO;
  result.instanceDataId = 0;
  return self;
}
- (BOOL) hasInstanceId {
  return result.hasInstanceId;
}
- (int32_t) instanceId {
  return result.instanceId;
}
- (PP_InstanceData_Builder*) setInstanceId:(int32_t) value {
  result.hasInstanceId = YES;
  result.instanceId = value;
  return self;
}
- (PP_InstanceData_Builder*) clearInstanceId {
  result.hasInstanceId = NO;
  result.instanceId = 0;
  return self;
}
- (BOOL) hasGateNum {
  return result.hasGateNum;
}
- (int32_t) gateNum {
  return result.gateNum;
}
- (PP_InstanceData_Builder*) setGateNum:(int32_t) value {
  result.hasGateNum = YES;
  result.gateNum = value;
  return self;
}
- (PP_InstanceData_Builder*) clearGateNum {
  result.hasGateNum = NO;
  result.gateNum = 0;
  return self;
}
- (BOOL) hasMonsterId {
  return result.hasMonsterId;
}
- (int32_t) monsterId {
  return result.monsterId;
}
- (PP_InstanceData_Builder*) setMonsterId:(int32_t) value {
  result.hasMonsterId = YES;
  result.monsterId = value;
  return self;
}
- (PP_InstanceData_Builder*) clearMonsterId {
  result.hasMonsterId = NO;
  result.monsterId = 0;
  return self;
}
- (BOOL) hasMonsterLevel {
  return result.hasMonsterLevel;
}
- (int32_t) monsterLevel {
  return result.monsterLevel;
}
- (PP_InstanceData_Builder*) setMonsterLevel:(int32_t) value {
  result.hasMonsterLevel = YES;
  result.monsterLevel = value;
  return self;
}
- (PP_InstanceData_Builder*) clearMonsterLevel {
  result.hasMonsterLevel = NO;
  result.monsterLevel = 0;
  return self;
}
- (BOOL) hasMonsterNum {
  return result.hasMonsterNum;
}
- (int32_t) monsterNum {
  return result.monsterNum;
}
- (PP_InstanceData_Builder*) setMonsterNum:(int32_t) value {
  result.hasMonsterNum = YES;
  result.monsterNum = value;
  return self;
}
- (PP_InstanceData_Builder*) clearMonsterNum {
  result.hasMonsterNum = NO;
  result.monsterNum = 0;
  return self;
}
- (BOOL) hasCreateTime {
  return result.hasCreateTime;
}
- (int32_t) createTime {
  return result.createTime;
}
- (PP_InstanceData_Builder*) setCreateTime:(int32_t) value {
  result.hasCreateTime = YES;
  result.createTime = value;
  return self;
}
- (PP_InstanceData_Builder*) clearCreateTime {
  result.hasCreateTime = NO;
  result.createTime = 0;
  return self;
}
@end

