// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "PP_Test.pb.h"

@implementation PpTestRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [PpTestRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface PP_Test ()
@property int32_t age;
@property (retain) NSString* name;
@end

@implementation PP_Test

- (BOOL) hasAge {
  return !!hasAge_;
}
- (void) setHasAge:(BOOL) value_ {
  hasAge_ = !!value_;
}
@synthesize age;
- (BOOL) hasName {
  return !!hasName_;
}
- (void) setHasName:(BOOL) value_ {
  hasName_ = !!value_;
}
@synthesize name;
- (void) dealloc {
  self.name = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.age = 0;
    self.name = @"";
  }
  return self;
}
static PP_Test* defaultPP_TestInstance = nil;
+ (void) initialize {
  if (self == [PP_Test class]) {
    defaultPP_TestInstance = [[PP_Test alloc] init];
  }
}
+ (PP_Test*) defaultInstance {
  return defaultPP_TestInstance;
}
- (PP_Test*) defaultInstance {
  return defaultPP_TestInstance;
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasAge) {
    [output writeInt32:1 value:self.age];
  }
  if (self.hasName) {
    [output writeString:2 value:self.name];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size_ = memoizedSerializedSize;
  if (size_ != -1) {
    return size_;
  }

  size_ = 0;
  if (self.hasAge) {
    size_ += computeInt32Size(1, self.age);
  }
  if (self.hasName) {
    size_ += computeStringSize(2, self.name);
  }
  size_ += self.unknownFields.serializedSize;
  memoizedSerializedSize = size_;
  return size_;
}
+ (PP_Test*) parseFromData:(NSData*) data {
  return (PP_Test*)[[[PP_Test builder] mergeFromData:data] build];
}
+ (PP_Test*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_Test*)[[[PP_Test builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (PP_Test*) parseFromInputStream:(NSInputStream*) input {
  return (PP_Test*)[[[PP_Test builder] mergeFromInputStream:input] build];
}
+ (PP_Test*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_Test*)[[[PP_Test builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (PP_Test*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (PP_Test*)[[[PP_Test builder] mergeFromCodedInputStream:input] build];
}
+ (PP_Test*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_Test*)[[[PP_Test builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (PP_Test_Builder*) builder {
  return [[[PP_Test_Builder alloc] init] autorelease];
}
+ (PP_Test_Builder*) builderWithPrototype:(PP_Test*) prototype {
  return [[PP_Test builder] mergeFrom:prototype];
}
- (PP_Test_Builder*) builder {
  return [PP_Test builder];
}
- (PP_Test_Builder*) toBuilder {
  return [PP_Test builderWithPrototype:self];
}
- (void) writeDescriptionTo:(NSMutableString*) output withIndent:(NSString*) indent {
  if (self.hasAge) {
    [output appendFormat:@"%@%@: %@\n", indent, @"age", [NSNumber numberWithInt:self.age]];
  }
  if (self.hasName) {
    [output appendFormat:@"%@%@: %@\n", indent, @"name", self.name];
  }
  [self.unknownFields writeDescriptionTo:output withIndent:indent];
}
- (BOOL) isEqual:(id)other {
  if (other == self) {
    return YES;
  }
  if (![other isKindOfClass:[PP_Test class]]) {
    return NO;
  }
  PP_Test *otherMessage = other;
  return
      self.hasAge == otherMessage.hasAge &&
      (!self.hasAge || self.age == otherMessage.age) &&
      self.hasName == otherMessage.hasName &&
      (!self.hasName || [self.name isEqual:otherMessage.name]) &&
      (self.unknownFields == otherMessage.unknownFields || (self.unknownFields != nil && [self.unknownFields isEqual:otherMessage.unknownFields]));
}
- (NSUInteger) hash {
  NSUInteger hashCode = 7;
  if (self.hasAge) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.age] hash];
  }
  if (self.hasName) {
    hashCode = hashCode * 31 + [self.name hash];
  }
  hashCode = hashCode * 31 + [self.unknownFields hash];
  return hashCode;
}
@end

@interface PP_Test_Builder()
@property (retain) PP_Test* result;
@end

@implementation PP_Test_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[PP_Test alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (PP_Test_Builder*) clear {
  self.result = [[[PP_Test alloc] init] autorelease];
  return self;
}
- (PP_Test_Builder*) clone {
  return [PP_Test builderWithPrototype:result];
}
- (PP_Test*) defaultInstance {
  return [PP_Test defaultInstance];
}
- (PP_Test*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (PP_Test*) buildPartial {
  PP_Test* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (PP_Test_Builder*) mergeFrom:(PP_Test*) other {
  if (other == [PP_Test defaultInstance]) {
    return self;
  }
  if (other.hasAge) {
    [self setAge:other.age];
  }
  if (other.hasName) {
    [self setName:other.name];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (PP_Test_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (PP_Test_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
        [self setAge:[input readInt32]];
        break;
      }
      case 18: {
        [self setName:[input readString]];
        break;
      }
    }
  }
}
- (BOOL) hasAge {
  return result.hasAge;
}
- (int32_t) age {
  return result.age;
}
- (PP_Test_Builder*) setAge:(int32_t) value {
  result.hasAge = YES;
  result.age = value;
  return self;
}
- (PP_Test_Builder*) clearAge {
  result.hasAge = NO;
  result.age = 0;
  return self;
}
- (BOOL) hasName {
  return result.hasName;
}
- (NSString*) name {
  return result.name;
}
- (PP_Test_Builder*) setName:(NSString*) value {
  result.hasName = YES;
  result.name = value;
  return self;
}
- (PP_Test_Builder*) clearName {
  result.hasName = NO;
  result.name = @"";
  return self;
}
@end
