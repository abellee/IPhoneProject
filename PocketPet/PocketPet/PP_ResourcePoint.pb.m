// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "PP_ResourcePoint.pb.h"

@implementation PpResourcePointRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [PpResourcePointRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    [PpResPointDataRoot registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface PP_ResourcePoint ()
@property int32_t resPointId;
@property int32_t uid;
@property (retain) NSString* resourceName;
@property (retain) NSString* resourceImg;
@property int32_t parentType;
@property int32_t resourceType;
@property int32_t resourceLevel;
@property int32_t perHour;
@property Float64 longitude;
@property Float64 latitude;
@property int32_t mapIp;
@property int32_t createTime;
@property (retain) PP_ResPointData* resPointData;
@end

@implementation PP_ResourcePoint

- (BOOL) hasResPointId {
  return !!hasResPointId_;
}
- (void) setHasResPointId:(BOOL) value_ {
  hasResPointId_ = !!value_;
}
@synthesize resPointId;
- (BOOL) hasUid {
  return !!hasUid_;
}
- (void) setHasUid:(BOOL) value_ {
  hasUid_ = !!value_;
}
@synthesize uid;
- (BOOL) hasResourceName {
  return !!hasResourceName_;
}
- (void) setHasResourceName:(BOOL) value_ {
  hasResourceName_ = !!value_;
}
@synthesize resourceName;
- (BOOL) hasResourceImg {
  return !!hasResourceImg_;
}
- (void) setHasResourceImg:(BOOL) value_ {
  hasResourceImg_ = !!value_;
}
@synthesize resourceImg;
- (BOOL) hasParentType {
  return !!hasParentType_;
}
- (void) setHasParentType:(BOOL) value_ {
  hasParentType_ = !!value_;
}
@synthesize parentType;
- (BOOL) hasResourceType {
  return !!hasResourceType_;
}
- (void) setHasResourceType:(BOOL) value_ {
  hasResourceType_ = !!value_;
}
@synthesize resourceType;
- (BOOL) hasResourceLevel {
  return !!hasResourceLevel_;
}
- (void) setHasResourceLevel:(BOOL) value_ {
  hasResourceLevel_ = !!value_;
}
@synthesize resourceLevel;
- (BOOL) hasPerHour {
  return !!hasPerHour_;
}
- (void) setHasPerHour:(BOOL) value_ {
  hasPerHour_ = !!value_;
}
@synthesize perHour;
- (BOOL) hasLongitude {
  return !!hasLongitude_;
}
- (void) setHasLongitude:(BOOL) value_ {
  hasLongitude_ = !!value_;
}
@synthesize longitude;
- (BOOL) hasLatitude {
  return !!hasLatitude_;
}
- (void) setHasLatitude:(BOOL) value_ {
  hasLatitude_ = !!value_;
}
@synthesize latitude;
- (BOOL) hasMapIp {
  return !!hasMapIp_;
}
- (void) setHasMapIp:(BOOL) value_ {
  hasMapIp_ = !!value_;
}
@synthesize mapIp;
- (BOOL) hasCreateTime {
  return !!hasCreateTime_;
}
- (void) setHasCreateTime:(BOOL) value_ {
  hasCreateTime_ = !!value_;
}
@synthesize createTime;
- (BOOL) hasResPointData {
  return !!hasResPointData_;
}
- (void) setHasResPointData:(BOOL) value_ {
  hasResPointData_ = !!value_;
}
@synthesize resPointData;
- (void) dealloc {
  self.resourceName = nil;
  self.resourceImg = nil;
  self.resPointData = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.resPointId = 0;
    self.uid = 0;
    self.resourceName = @"";
    self.resourceImg = @"";
    self.parentType = 0;
    self.resourceType = 0;
    self.resourceLevel = 0;
    self.perHour = 0;
    self.longitude = 0;
    self.latitude = 0;
    self.mapIp = 0;
    self.createTime = 0;
    self.resPointData = [PP_ResPointData defaultInstance];
  }
  return self;
}
static PP_ResourcePoint* defaultPP_ResourcePointInstance = nil;
+ (void) initialize {
  if (self == [PP_ResourcePoint class]) {
    defaultPP_ResourcePointInstance = [[PP_ResourcePoint alloc] init];
  }
}
+ (PP_ResourcePoint*) defaultInstance {
  return defaultPP_ResourcePointInstance;
}
- (PP_ResourcePoint*) defaultInstance {
  return defaultPP_ResourcePointInstance;
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasResPointId) {
    [output writeInt32:1 value:self.resPointId];
  }
  if (self.hasUid) {
    [output writeInt32:2 value:self.uid];
  }
  if (self.hasResourceName) {
    [output writeString:3 value:self.resourceName];
  }
  if (self.hasResourceImg) {
    [output writeString:4 value:self.resourceImg];
  }
  if (self.hasParentType) {
    [output writeInt32:5 value:self.parentType];
  }
  if (self.hasResourceType) {
    [output writeInt32:6 value:self.resourceType];
  }
  if (self.hasResourceLevel) {
    [output writeInt32:7 value:self.resourceLevel];
  }
  if (self.hasPerHour) {
    [output writeInt32:8 value:self.perHour];
  }
  if (self.hasLongitude) {
    [output writeDouble:9 value:self.longitude];
  }
  if (self.hasLatitude) {
    [output writeDouble:10 value:self.latitude];
  }
  if (self.hasMapIp) {
    [output writeInt32:11 value:self.mapIp];
  }
  if (self.hasCreateTime) {
    [output writeInt32:12 value:self.createTime];
  }
  if (self.hasResPointData) {
    [output writeMessage:13 value:self.resPointData];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size_ = memoizedSerializedSize;
  if (size_ != -1) {
    return size_;
  }

  size_ = 0;
  if (self.hasResPointId) {
    size_ += computeInt32Size(1, self.resPointId);
  }
  if (self.hasUid) {
    size_ += computeInt32Size(2, self.uid);
  }
  if (self.hasResourceName) {
    size_ += computeStringSize(3, self.resourceName);
  }
  if (self.hasResourceImg) {
    size_ += computeStringSize(4, self.resourceImg);
  }
  if (self.hasParentType) {
    size_ += computeInt32Size(5, self.parentType);
  }
  if (self.hasResourceType) {
    size_ += computeInt32Size(6, self.resourceType);
  }
  if (self.hasResourceLevel) {
    size_ += computeInt32Size(7, self.resourceLevel);
  }
  if (self.hasPerHour) {
    size_ += computeInt32Size(8, self.perHour);
  }
  if (self.hasLongitude) {
    size_ += computeDoubleSize(9, self.longitude);
  }
  if (self.hasLatitude) {
    size_ += computeDoubleSize(10, self.latitude);
  }
  if (self.hasMapIp) {
    size_ += computeInt32Size(11, self.mapIp);
  }
  if (self.hasCreateTime) {
    size_ += computeInt32Size(12, self.createTime);
  }
  if (self.hasResPointData) {
    size_ += computeMessageSize(13, self.resPointData);
  }
  size_ += self.unknownFields.serializedSize;
  memoizedSerializedSize = size_;
  return size_;
}
+ (PP_ResourcePoint*) parseFromData:(NSData*) data {
  return (PP_ResourcePoint*)[[[PP_ResourcePoint builder] mergeFromData:data] build];
}
+ (PP_ResourcePoint*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_ResourcePoint*)[[[PP_ResourcePoint builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (PP_ResourcePoint*) parseFromInputStream:(NSInputStream*) input {
  return (PP_ResourcePoint*)[[[PP_ResourcePoint builder] mergeFromInputStream:input] build];
}
+ (PP_ResourcePoint*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_ResourcePoint*)[[[PP_ResourcePoint builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (PP_ResourcePoint*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (PP_ResourcePoint*)[[[PP_ResourcePoint builder] mergeFromCodedInputStream:input] build];
}
+ (PP_ResourcePoint*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_ResourcePoint*)[[[PP_ResourcePoint builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (PP_ResourcePoint_Builder*) builder {
  return [[[PP_ResourcePoint_Builder alloc] init] autorelease];
}
+ (PP_ResourcePoint_Builder*) builderWithPrototype:(PP_ResourcePoint*) prototype {
  return [[PP_ResourcePoint builder] mergeFrom:prototype];
}
- (PP_ResourcePoint_Builder*) builder {
  return [PP_ResourcePoint builder];
}
- (PP_ResourcePoint_Builder*) toBuilder {
  return [PP_ResourcePoint builderWithPrototype:self];
}
- (void) writeDescriptionTo:(NSMutableString*) output withIndent:(NSString*) indent {
  if (self.hasResPointId) {
    [output appendFormat:@"%@%@: %@\n", indent, @"resPointId", [NSNumber numberWithInt:self.resPointId]];
  }
  if (self.hasUid) {
    [output appendFormat:@"%@%@: %@\n", indent, @"uid", [NSNumber numberWithInt:self.uid]];
  }
  if (self.hasResourceName) {
    [output appendFormat:@"%@%@: %@\n", indent, @"resourceName", self.resourceName];
  }
  if (self.hasResourceImg) {
    [output appendFormat:@"%@%@: %@\n", indent, @"resourceImg", self.resourceImg];
  }
  if (self.hasParentType) {
    [output appendFormat:@"%@%@: %@\n", indent, @"parentType", [NSNumber numberWithInt:self.parentType]];
  }
  if (self.hasResourceType) {
    [output appendFormat:@"%@%@: %@\n", indent, @"resourceType", [NSNumber numberWithInt:self.resourceType]];
  }
  if (self.hasResourceLevel) {
    [output appendFormat:@"%@%@: %@\n", indent, @"resourceLevel", [NSNumber numberWithInt:self.resourceLevel]];
  }
  if (self.hasPerHour) {
    [output appendFormat:@"%@%@: %@\n", indent, @"perHour", [NSNumber numberWithInt:self.perHour]];
  }
  if (self.hasLongitude) {
    [output appendFormat:@"%@%@: %@\n", indent, @"longitude", [NSNumber numberWithDouble:self.longitude]];
  }
  if (self.hasLatitude) {
    [output appendFormat:@"%@%@: %@\n", indent, @"latitude", [NSNumber numberWithDouble:self.latitude]];
  }
  if (self.hasMapIp) {
    [output appendFormat:@"%@%@: %@\n", indent, @"mapIp", [NSNumber numberWithInt:self.mapIp]];
  }
  if (self.hasCreateTime) {
    [output appendFormat:@"%@%@: %@\n", indent, @"createTime", [NSNumber numberWithInt:self.createTime]];
  }
  if (self.hasResPointData) {
    [output appendFormat:@"%@%@ {\n", indent, @"resPointData"];
    [self.resPointData writeDescriptionTo:output
                         withIndent:[NSString stringWithFormat:@"%@  ", indent]];
    [output appendFormat:@"%@}\n", indent];
  }
  [self.unknownFields writeDescriptionTo:output withIndent:indent];
}
- (BOOL) isEqual:(id)other {
  if (other == self) {
    return YES;
  }
  if (![other isKindOfClass:[PP_ResourcePoint class]]) {
    return NO;
  }
  PP_ResourcePoint *otherMessage = other;
  return
      self.hasResPointId == otherMessage.hasResPointId &&
      (!self.hasResPointId || self.resPointId == otherMessage.resPointId) &&
      self.hasUid == otherMessage.hasUid &&
      (!self.hasUid || self.uid == otherMessage.uid) &&
      self.hasResourceName == otherMessage.hasResourceName &&
      (!self.hasResourceName || [self.resourceName isEqual:otherMessage.resourceName]) &&
      self.hasResourceImg == otherMessage.hasResourceImg &&
      (!self.hasResourceImg || [self.resourceImg isEqual:otherMessage.resourceImg]) &&
      self.hasParentType == otherMessage.hasParentType &&
      (!self.hasParentType || self.parentType == otherMessage.parentType) &&
      self.hasResourceType == otherMessage.hasResourceType &&
      (!self.hasResourceType || self.resourceType == otherMessage.resourceType) &&
      self.hasResourceLevel == otherMessage.hasResourceLevel &&
      (!self.hasResourceLevel || self.resourceLevel == otherMessage.resourceLevel) &&
      self.hasPerHour == otherMessage.hasPerHour &&
      (!self.hasPerHour || self.perHour == otherMessage.perHour) &&
      self.hasLongitude == otherMessage.hasLongitude &&
      (!self.hasLongitude || self.longitude == otherMessage.longitude) &&
      self.hasLatitude == otherMessage.hasLatitude &&
      (!self.hasLatitude || self.latitude == otherMessage.latitude) &&
      self.hasMapIp == otherMessage.hasMapIp &&
      (!self.hasMapIp || self.mapIp == otherMessage.mapIp) &&
      self.hasCreateTime == otherMessage.hasCreateTime &&
      (!self.hasCreateTime || self.createTime == otherMessage.createTime) &&
      self.hasResPointData == otherMessage.hasResPointData &&
      (!self.hasResPointData || [self.resPointData isEqual:otherMessage.resPointData]) &&
      (self.unknownFields == otherMessage.unknownFields || (self.unknownFields != nil && [self.unknownFields isEqual:otherMessage.unknownFields]));
}
- (NSUInteger) hash {
  NSUInteger hashCode = 7;
  if (self.hasResPointId) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.resPointId] hash];
  }
  if (self.hasUid) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.uid] hash];
  }
  if (self.hasResourceName) {
    hashCode = hashCode * 31 + [self.resourceName hash];
  }
  if (self.hasResourceImg) {
    hashCode = hashCode * 31 + [self.resourceImg hash];
  }
  if (self.hasParentType) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.parentType] hash];
  }
  if (self.hasResourceType) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.resourceType] hash];
  }
  if (self.hasResourceLevel) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.resourceLevel] hash];
  }
  if (self.hasPerHour) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.perHour] hash];
  }
  if (self.hasLongitude) {
    hashCode = hashCode * 31 + [[NSNumber numberWithDouble:self.longitude] hash];
  }
  if (self.hasLatitude) {
    hashCode = hashCode * 31 + [[NSNumber numberWithDouble:self.latitude] hash];
  }
  if (self.hasMapIp) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.mapIp] hash];
  }
  if (self.hasCreateTime) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.createTime] hash];
  }
  if (self.hasResPointData) {
    hashCode = hashCode * 31 + [self.resPointData hash];
  }
  hashCode = hashCode * 31 + [self.unknownFields hash];
  return hashCode;
}
@end

@interface PP_ResourcePoint_Builder()
@property (retain) PP_ResourcePoint* result;
@end

@implementation PP_ResourcePoint_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[PP_ResourcePoint alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (PP_ResourcePoint_Builder*) clear {
  self.result = [[[PP_ResourcePoint alloc] init] autorelease];
  return self;
}
- (PP_ResourcePoint_Builder*) clone {
  return [PP_ResourcePoint builderWithPrototype:result];
}
- (PP_ResourcePoint*) defaultInstance {
  return [PP_ResourcePoint defaultInstance];
}
- (PP_ResourcePoint*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (PP_ResourcePoint*) buildPartial {
  PP_ResourcePoint* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (PP_ResourcePoint_Builder*) mergeFrom:(PP_ResourcePoint*) other {
  if (other == [PP_ResourcePoint defaultInstance]) {
    return self;
  }
  if (other.hasResPointId) {
    [self setResPointId:other.resPointId];
  }
  if (other.hasUid) {
    [self setUid:other.uid];
  }
  if (other.hasResourceName) {
    [self setResourceName:other.resourceName];
  }
  if (other.hasResourceImg) {
    [self setResourceImg:other.resourceImg];
  }
  if (other.hasParentType) {
    [self setParentType:other.parentType];
  }
  if (other.hasResourceType) {
    [self setResourceType:other.resourceType];
  }
  if (other.hasResourceLevel) {
    [self setResourceLevel:other.resourceLevel];
  }
  if (other.hasPerHour) {
    [self setPerHour:other.perHour];
  }
  if (other.hasLongitude) {
    [self setLongitude:other.longitude];
  }
  if (other.hasLatitude) {
    [self setLatitude:other.latitude];
  }
  if (other.hasMapIp) {
    [self setMapIp:other.mapIp];
  }
  if (other.hasCreateTime) {
    [self setCreateTime:other.createTime];
  }
  if (other.hasResPointData) {
    [self mergeResPointData:other.resPointData];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (PP_ResourcePoint_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (PP_ResourcePoint_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
        [self setResPointId:[input readInt32]];
        break;
      }
      case 16: {
        [self setUid:[input readInt32]];
        break;
      }
      case 26: {
        [self setResourceName:[input readString]];
        break;
      }
      case 34: {
        [self setResourceImg:[input readString]];
        break;
      }
      case 40: {
        [self setParentType:[input readInt32]];
        break;
      }
      case 48: {
        [self setResourceType:[input readInt32]];
        break;
      }
      case 56: {
        [self setResourceLevel:[input readInt32]];
        break;
      }
      case 64: {
        [self setPerHour:[input readInt32]];
        break;
      }
      case 73: {
        [self setLongitude:[input readDouble]];
        break;
      }
      case 81: {
        [self setLatitude:[input readDouble]];
        break;
      }
      case 88: {
        [self setMapIp:[input readInt32]];
        break;
      }
      case 96: {
        [self setCreateTime:[input readInt32]];
        break;
      }
      case 106: {
        PP_ResPointData_Builder* subBuilder = [PP_ResPointData builder];
        if (self.hasResPointData) {
          [subBuilder mergeFrom:self.resPointData];
        }
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self setResPointData:[subBuilder buildPartial]];
        break;
      }
    }
  }
}
- (BOOL) hasResPointId {
  return result.hasResPointId;
}
- (int32_t) resPointId {
  return result.resPointId;
}
- (PP_ResourcePoint_Builder*) setResPointId:(int32_t) value {
  result.hasResPointId = YES;
  result.resPointId = value;
  return self;
}
- (PP_ResourcePoint_Builder*) clearResPointId {
  result.hasResPointId = NO;
  result.resPointId = 0;
  return self;
}
- (BOOL) hasUid {
  return result.hasUid;
}
- (int32_t) uid {
  return result.uid;
}
- (PP_ResourcePoint_Builder*) setUid:(int32_t) value {
  result.hasUid = YES;
  result.uid = value;
  return self;
}
- (PP_ResourcePoint_Builder*) clearUid {
  result.hasUid = NO;
  result.uid = 0;
  return self;
}
- (BOOL) hasResourceName {
  return result.hasResourceName;
}
- (NSString*) resourceName {
  return result.resourceName;
}
- (PP_ResourcePoint_Builder*) setResourceName:(NSString*) value {
  result.hasResourceName = YES;
  result.resourceName = value;
  return self;
}
- (PP_ResourcePoint_Builder*) clearResourceName {
  result.hasResourceName = NO;
  result.resourceName = @"";
  return self;
}
- (BOOL) hasResourceImg {
  return result.hasResourceImg;
}
- (NSString*) resourceImg {
  return result.resourceImg;
}
- (PP_ResourcePoint_Builder*) setResourceImg:(NSString*) value {
  result.hasResourceImg = YES;
  result.resourceImg = value;
  return self;
}
- (PP_ResourcePoint_Builder*) clearResourceImg {
  result.hasResourceImg = NO;
  result.resourceImg = @"";
  return self;
}
- (BOOL) hasParentType {
  return result.hasParentType;
}
- (int32_t) parentType {
  return result.parentType;
}
- (PP_ResourcePoint_Builder*) setParentType:(int32_t) value {
  result.hasParentType = YES;
  result.parentType = value;
  return self;
}
- (PP_ResourcePoint_Builder*) clearParentType {
  result.hasParentType = NO;
  result.parentType = 0;
  return self;
}
- (BOOL) hasResourceType {
  return result.hasResourceType;
}
- (int32_t) resourceType {
  return result.resourceType;
}
- (PP_ResourcePoint_Builder*) setResourceType:(int32_t) value {
  result.hasResourceType = YES;
  result.resourceType = value;
  return self;
}
- (PP_ResourcePoint_Builder*) clearResourceType {
  result.hasResourceType = NO;
  result.resourceType = 0;
  return self;
}
- (BOOL) hasResourceLevel {
  return result.hasResourceLevel;
}
- (int32_t) resourceLevel {
  return result.resourceLevel;
}
- (PP_ResourcePoint_Builder*) setResourceLevel:(int32_t) value {
  result.hasResourceLevel = YES;
  result.resourceLevel = value;
  return self;
}
- (PP_ResourcePoint_Builder*) clearResourceLevel {
  result.hasResourceLevel = NO;
  result.resourceLevel = 0;
  return self;
}
- (BOOL) hasPerHour {
  return result.hasPerHour;
}
- (int32_t) perHour {
  return result.perHour;
}
- (PP_ResourcePoint_Builder*) setPerHour:(int32_t) value {
  result.hasPerHour = YES;
  result.perHour = value;
  return self;
}
- (PP_ResourcePoint_Builder*) clearPerHour {
  result.hasPerHour = NO;
  result.perHour = 0;
  return self;
}
- (BOOL) hasLongitude {
  return result.hasLongitude;
}
- (Float64) longitude {
  return result.longitude;
}
- (PP_ResourcePoint_Builder*) setLongitude:(Float64) value {
  result.hasLongitude = YES;
  result.longitude = value;
  return self;
}
- (PP_ResourcePoint_Builder*) clearLongitude {
  result.hasLongitude = NO;
  result.longitude = 0;
  return self;
}
- (BOOL) hasLatitude {
  return result.hasLatitude;
}
- (Float64) latitude {
  return result.latitude;
}
- (PP_ResourcePoint_Builder*) setLatitude:(Float64) value {
  result.hasLatitude = YES;
  result.latitude = value;
  return self;
}
- (PP_ResourcePoint_Builder*) clearLatitude {
  result.hasLatitude = NO;
  result.latitude = 0;
  return self;
}
- (BOOL) hasMapIp {
  return result.hasMapIp;
}
- (int32_t) mapIp {
  return result.mapIp;
}
- (PP_ResourcePoint_Builder*) setMapIp:(int32_t) value {
  result.hasMapIp = YES;
  result.mapIp = value;
  return self;
}
- (PP_ResourcePoint_Builder*) clearMapIp {
  result.hasMapIp = NO;
  result.mapIp = 0;
  return self;
}
- (BOOL) hasCreateTime {
  return result.hasCreateTime;
}
- (int32_t) createTime {
  return result.createTime;
}
- (PP_ResourcePoint_Builder*) setCreateTime:(int32_t) value {
  result.hasCreateTime = YES;
  result.createTime = value;
  return self;
}
- (PP_ResourcePoint_Builder*) clearCreateTime {
  result.hasCreateTime = NO;
  result.createTime = 0;
  return self;
}
- (BOOL) hasResPointData {
  return result.hasResPointData;
}
- (PP_ResPointData*) resPointData {
  return result.resPointData;
}
- (PP_ResourcePoint_Builder*) setResPointData:(PP_ResPointData*) value {
  result.hasResPointData = YES;
  result.resPointData = value;
  return self;
}
- (PP_ResourcePoint_Builder*) setResPointDataBuilder:(PP_ResPointData_Builder*) builderForValue {
  return [self setResPointData:[builderForValue build]];
}
- (PP_ResourcePoint_Builder*) mergeResPointData:(PP_ResPointData*) value {
  if (result.hasResPointData &&
      result.resPointData != [PP_ResPointData defaultInstance]) {
    result.resPointData =
      [[[PP_ResPointData builderWithPrototype:result.resPointData] mergeFrom:value] buildPartial];
  } else {
    result.resPointData = value;
  }
  result.hasResPointData = YES;
  return self;
}
- (PP_ResourcePoint_Builder*) clearResPointData {
  result.hasResPointData = NO;
  result.resPointData = [PP_ResPointData defaultInstance];
  return self;
}
@end

