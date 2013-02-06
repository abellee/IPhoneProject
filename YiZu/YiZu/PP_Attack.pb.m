// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "PP_Attack.pb.h"

@implementation PpAttackRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [PpAttackRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    [PpGameControlRoot registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface PP_Attack ()
@property (retain) PBAppendableArray * gameControlArray;
@end

@implementation PP_Attack

@synthesize gameControlArray;
@dynamic gameControl;
- (void) dealloc {
  self.gameControlArray = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
  }
  return self;
}
static PP_Attack* defaultPP_AttackInstance = nil;
+ (void) initialize {
  if (self == [PP_Attack class]) {
    defaultPP_AttackInstance = [[PP_Attack alloc] init];
  }
}
+ (PP_Attack*) defaultInstance {
  return defaultPP_AttackInstance;
}
- (PP_Attack*) defaultInstance {
  return defaultPP_AttackInstance;
}
- (PBArray *)gameControl {
  return gameControlArray;
}
- (PP_GameControl*)gameControlAtIndex:(NSUInteger)index {
  return [gameControlArray objectAtIndex:index];
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  for (PP_GameControl *element in self.gameControlArray) {
    [output writeMessage:1 value:element];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size_ = memoizedSerializedSize;
  if (size_ != -1) {
    return size_;
  }

  size_ = 0;
  for (PP_GameControl *element in self.gameControlArray) {
    size_ += computeMessageSize(1, element);
  }
  size_ += self.unknownFields.serializedSize;
  memoizedSerializedSize = size_;
  return size_;
}
+ (PP_Attack*) parseFromData:(NSData*) data {
  return (PP_Attack*)[[[PP_Attack builder] mergeFromData:data] build];
}
+ (PP_Attack*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_Attack*)[[[PP_Attack builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (PP_Attack*) parseFromInputStream:(NSInputStream*) input {
  return (PP_Attack*)[[[PP_Attack builder] mergeFromInputStream:input] build];
}
+ (PP_Attack*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_Attack*)[[[PP_Attack builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (PP_Attack*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (PP_Attack*)[[[PP_Attack builder] mergeFromCodedInputStream:input] build];
}
+ (PP_Attack*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_Attack*)[[[PP_Attack builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (PP_Attack_Builder*) builder {
  return [[[PP_Attack_Builder alloc] init] autorelease];
}
+ (PP_Attack_Builder*) builderWithPrototype:(PP_Attack*) prototype {
  return [[PP_Attack builder] mergeFrom:prototype];
}
- (PP_Attack_Builder*) builder {
  return [PP_Attack builder];
}
- (PP_Attack_Builder*) toBuilder {
  return [PP_Attack builderWithPrototype:self];
}
- (void) writeDescriptionTo:(NSMutableString*) output withIndent:(NSString*) indent {
  for (PP_GameControl* element in self.gameControlArray) {
    [output appendFormat:@"%@%@ {\n", indent, @"gameControl"];
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
  if (![other isKindOfClass:[PP_Attack class]]) {
    return NO;
  }
  PP_Attack *otherMessage = other;
  return
      [self.gameControlArray isEqualToArray:otherMessage.gameControlArray] &&
      (self.unknownFields == otherMessage.unknownFields || (self.unknownFields != nil && [self.unknownFields isEqual:otherMessage.unknownFields]));
}
- (NSUInteger) hash {
  NSUInteger hashCode = 7;
  for (PP_GameControl* element in self.gameControlArray) {
    hashCode = hashCode * 31 + [element hash];
  }
  hashCode = hashCode * 31 + [self.unknownFields hash];
  return hashCode;
}
@end

@interface PP_Attack_Builder()
@property (retain) PP_Attack* result;
@end

@implementation PP_Attack_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[PP_Attack alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (PP_Attack_Builder*) clear {
  self.result = [[[PP_Attack alloc] init] autorelease];
  return self;
}
- (PP_Attack_Builder*) clone {
  return [PP_Attack builderWithPrototype:result];
}
- (PP_Attack*) defaultInstance {
  return [PP_Attack defaultInstance];
}
- (PP_Attack*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (PP_Attack*) buildPartial {
  PP_Attack* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (PP_Attack_Builder*) mergeFrom:(PP_Attack*) other {
  if (other == [PP_Attack defaultInstance]) {
    return self;
  }
  if (other.gameControlArray.count > 0) {
    if (result.gameControlArray == nil) {
      result.gameControlArray = [[other.gameControlArray copyWithZone:[other.gameControlArray zone]] autorelease];
    } else {
      [result.gameControlArray appendArray:other.gameControlArray];
    }
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (PP_Attack_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (PP_Attack_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
      case 10: {
        PP_GameControl_Builder* subBuilder = [PP_GameControl builder];
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self addGameControl:[subBuilder buildPartial]];
        break;
      }
    }
  }
}
- (PBAppendableArray *)gameControl {
  return result.gameControlArray;
}
- (PP_GameControl*)gameControlAtIndex:(NSUInteger)index {
  return [result gameControlAtIndex:index];
}
- (PP_Attack_Builder *)addGameControl:(PP_GameControl*)value {
  if (result.gameControlArray == nil) {
    result.gameControlArray = [PBAppendableArray arrayWithValueType:PBArrayValueTypeObject];
  }
  [result.gameControlArray addObject:value];
  return self;
}
- (PP_Attack_Builder *)setGameControlArray:(NSArray *)array {
  result.gameControlArray = [PBAppendableArray arrayWithArray:array valueType:PBArrayValueTypeObject];
  return self;
}
- (PP_Attack_Builder *)setGameControlValues:(const PP_GameControl* *)values count:(NSUInteger)count {
  result.gameControlArray = [PBAppendableArray arrayWithValues:values count:count valueType:PBArrayValueTypeObject];
  return self;
}
- (PP_Attack_Builder *)clearGameControl {
  result.gameControlArray = nil;
  return self;
}
@end
