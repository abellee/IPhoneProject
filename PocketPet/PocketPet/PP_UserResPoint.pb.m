// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "PP_UserResPoint.pb.h"

@implementation PpUserResPointRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [PpUserResPointRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    [PpResourcePointRoot registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface PP_UserResPoint ()
@property int32_t uid;
@property (retain) PP_ResourcePoint* resPoint;
@property int32_t versionId;
@property int32_t createTime;
@end

@implementation PP_UserResPoint

- (BOOL) hasUid {
  return !!hasUid_;
}
- (void) setHasUid:(BOOL) value_ {
  hasUid_ = !!value_;
}
@synthesize uid;
- (BOOL) hasResPoint {
  return !!hasResPoint_;
}
- (void) setHasResPoint:(BOOL) value_ {
  hasResPoint_ = !!value_;
}
@synthesize resPoint;
- (BOOL) hasVersionId {
  return !!hasVersionId_;
}
- (void) setHasVersionId:(BOOL) value_ {
  hasVersionId_ = !!value_;
}
@synthesize versionId;
- (BOOL) hasCreateTime {
  return !!hasCreateTime_;
}
- (void) setHasCreateTime:(BOOL) value_ {
  hasCreateTime_ = !!value_;
}
@synthesize createTime;
- (void) dealloc {
  self.resPoint = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.uid = 0;
    self.resPoint = [PP_ResourcePoint defaultInstance];
    self.versionId = 0;
    self.createTime = 0;
  }
  return self;
}
static PP_UserResPoint* defaultPP_UserResPointInstance = nil;
+ (void) initialize {
  if (self == [PP_UserResPoint class]) {
    defaultPP_UserResPointInstance = [[PP_UserResPoint alloc] init];
  }
}
+ (PP_UserResPoint*) defaultInstance {
  return defaultPP_UserResPointInstance;
}
- (PP_UserResPoint*) defaultInstance {
  return defaultPP_UserResPointInstance;
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasUid) {
    [output writeInt32:1 value:self.uid];
  }
  if (self.hasResPoint) {
    [output writeMessage:2 value:self.resPoint];
  }
  if (self.hasVersionId) {
    [output writeInt32:3 value:self.versionId];
  }
  if (self.hasCreateTime) {
    [output writeInt32:4 value:self.createTime];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size_ = memoizedSerializedSize;
  if (size_ != -1) {
    return size_;
  }

  size_ = 0;
  if (self.hasUid) {
    size_ += computeInt32Size(1, self.uid);
  }
  if (self.hasResPoint) {
    size_ += computeMessageSize(2, self.resPoint);
  }
  if (self.hasVersionId) {
    size_ += computeInt32Size(3, self.versionId);
  }
  if (self.hasCreateTime) {
    size_ += computeInt32Size(4, self.createTime);
  }
  size_ += self.unknownFields.serializedSize;
  memoizedSerializedSize = size_;
  return size_;
}
+ (PP_UserResPoint*) parseFromData:(NSData*) data {
  return (PP_UserResPoint*)[[[PP_UserResPoint builder] mergeFromData:data] build];
}
+ (PP_UserResPoint*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_UserResPoint*)[[[PP_UserResPoint builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (PP_UserResPoint*) parseFromInputStream:(NSInputStream*) input {
  return (PP_UserResPoint*)[[[PP_UserResPoint builder] mergeFromInputStream:input] build];
}
+ (PP_UserResPoint*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_UserResPoint*)[[[PP_UserResPoint builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (PP_UserResPoint*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (PP_UserResPoint*)[[[PP_UserResPoint builder] mergeFromCodedInputStream:input] build];
}
+ (PP_UserResPoint*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_UserResPoint*)[[[PP_UserResPoint builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (PP_UserResPoint_Builder*) builder {
  return [[[PP_UserResPoint_Builder alloc] init] autorelease];
}
+ (PP_UserResPoint_Builder*) builderWithPrototype:(PP_UserResPoint*) prototype {
  return [[PP_UserResPoint builder] mergeFrom:prototype];
}
- (PP_UserResPoint_Builder*) builder {
  return [PP_UserResPoint builder];
}
- (PP_UserResPoint_Builder*) toBuilder {
  return [PP_UserResPoint builderWithPrototype:self];
}
- (void) writeDescriptionTo:(NSMutableString*) output withIndent:(NSString*) indent {
  if (self.hasUid) {
    [output appendFormat:@"%@%@: %@\n", indent, @"uid", [NSNumber numberWithInt:self.uid]];
  }
  if (self.hasResPoint) {
    [output appendFormat:@"%@%@ {\n", indent, @"resPoint"];
    [self.resPoint writeDescriptionTo:output
                         withIndent:[NSString stringWithFormat:@"%@  ", indent]];
    [output appendFormat:@"%@}\n", indent];
  }
  if (self.hasVersionId) {
    [output appendFormat:@"%@%@: %@\n", indent, @"versionId", [NSNumber numberWithInt:self.versionId]];
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
  if (![other isKindOfClass:[PP_UserResPoint class]]) {
    return NO;
  }
  PP_UserResPoint *otherMessage = other;
  return
      self.hasUid == otherMessage.hasUid &&
      (!self.hasUid || self.uid == otherMessage.uid) &&
      self.hasResPoint == otherMessage.hasResPoint &&
      (!self.hasResPoint || [self.resPoint isEqual:otherMessage.resPoint]) &&
      self.hasVersionId == otherMessage.hasVersionId &&
      (!self.hasVersionId || self.versionId == otherMessage.versionId) &&
      self.hasCreateTime == otherMessage.hasCreateTime &&
      (!self.hasCreateTime || self.createTime == otherMessage.createTime) &&
      (self.unknownFields == otherMessage.unknownFields || (self.unknownFields != nil && [self.unknownFields isEqual:otherMessage.unknownFields]));
}
- (NSUInteger) hash {
  NSUInteger hashCode = 7;
  if (self.hasUid) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.uid] hash];
  }
  if (self.hasResPoint) {
    hashCode = hashCode * 31 + [self.resPoint hash];
  }
  if (self.hasVersionId) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.versionId] hash];
  }
  if (self.hasCreateTime) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.createTime] hash];
  }
  hashCode = hashCode * 31 + [self.unknownFields hash];
  return hashCode;
}
@end

@interface PP_UserResPoint_Builder()
@property (retain) PP_UserResPoint* result;
@end

@implementation PP_UserResPoint_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[PP_UserResPoint alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (PP_UserResPoint_Builder*) clear {
  self.result = [[[PP_UserResPoint alloc] init] autorelease];
  return self;
}
- (PP_UserResPoint_Builder*) clone {
  return [PP_UserResPoint builderWithPrototype:result];
}
- (PP_UserResPoint*) defaultInstance {
  return [PP_UserResPoint defaultInstance];
}
- (PP_UserResPoint*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (PP_UserResPoint*) buildPartial {
  PP_UserResPoint* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (PP_UserResPoint_Builder*) mergeFrom:(PP_UserResPoint*) other {
  if (other == [PP_UserResPoint defaultInstance]) {
    return self;
  }
  if (other.hasUid) {
    [self setUid:other.uid];
  }
  if (other.hasResPoint) {
    [self mergeResPoint:other.resPoint];
  }
  if (other.hasVersionId) {
    [self setVersionId:other.versionId];
  }
  if (other.hasCreateTime) {
    [self setCreateTime:other.createTime];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (PP_UserResPoint_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (PP_UserResPoint_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
        [self setUid:[input readInt32]];
        break;
      }
      case 18: {
        PP_ResourcePoint_Builder* subBuilder = [PP_ResourcePoint builder];
        if (self.hasResPoint) {
          [subBuilder mergeFrom:self.resPoint];
        }
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self setResPoint:[subBuilder buildPartial]];
        break;
      }
      case 24: {
        [self setVersionId:[input readInt32]];
        break;
      }
      case 32: {
        [self setCreateTime:[input readInt32]];
        break;
      }
    }
  }
}
- (BOOL) hasUid {
  return result.hasUid;
}
- (int32_t) uid {
  return result.uid;
}
- (PP_UserResPoint_Builder*) setUid:(int32_t) value {
  result.hasUid = YES;
  result.uid = value;
  return self;
}
- (PP_UserResPoint_Builder*) clearUid {
  result.hasUid = NO;
  result.uid = 0;
  return self;
}
- (BOOL) hasResPoint {
  return result.hasResPoint;
}
- (PP_ResourcePoint*) resPoint {
  return result.resPoint;
}
- (PP_UserResPoint_Builder*) setResPoint:(PP_ResourcePoint*) value {
  result.hasResPoint = YES;
  result.resPoint = value;
  return self;
}
- (PP_UserResPoint_Builder*) setResPointBuilder:(PP_ResourcePoint_Builder*) builderForValue {
  return [self setResPoint:[builderForValue build]];
}
- (PP_UserResPoint_Builder*) mergeResPoint:(PP_ResourcePoint*) value {
  if (result.hasResPoint &&
      result.resPoint != [PP_ResourcePoint defaultInstance]) {
    result.resPoint =
      [[[PP_ResourcePoint builderWithPrototype:result.resPoint] mergeFrom:value] buildPartial];
  } else {
    result.resPoint = value;
  }
  result.hasResPoint = YES;
  return self;
}
- (PP_UserResPoint_Builder*) clearResPoint {
  result.hasResPoint = NO;
  result.resPoint = [PP_ResourcePoint defaultInstance];
  return self;
}
- (BOOL) hasVersionId {
  return result.hasVersionId;
}
- (int32_t) versionId {
  return result.versionId;
}
- (PP_UserResPoint_Builder*) setVersionId:(int32_t) value {
  result.hasVersionId = YES;
  result.versionId = value;
  return self;
}
- (PP_UserResPoint_Builder*) clearVersionId {
  result.hasVersionId = NO;
  result.versionId = 0;
  return self;
}
- (BOOL) hasCreateTime {
  return result.hasCreateTime;
}
- (int32_t) createTime {
  return result.createTime;
}
- (PP_UserResPoint_Builder*) setCreateTime:(int32_t) value {
  result.hasCreateTime = YES;
  result.createTime = value;
  return self;
}
- (PP_UserResPoint_Builder*) clearCreateTime {
  result.hasCreateTime = NO;
  result.createTime = 0;
  return self;
}
@end

