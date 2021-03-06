// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "PP_Pet.pb.h"

@implementation PpPetRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [PpPetRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface PP_Pet ()
@property int32_t uid;
@property int32_t petId;
@property (retain) NSString* petName;
@property int32_t level;
@property int32_t curExp;
@property int32_t totalExp;
@property int32_t curHp;
@property int32_t totalHp;
@property int32_t curMp;
@property int32_t totalMp;
@property int32_t state;
@property int32_t life;
@property int32_t grow;
@property int32_t feel;
@property int32_t age;
@property int32_t isVariation;
@property int32_t variationLevel;
@property int32_t power;
@property int32_t agile;
@property int32_t intellegence;
@property int32_t vigour;
@property int32_t endur;
@property int32_t attack;
@property int32_t defense;
@property int32_t magicDamage;
@property int32_t magicDefense;
@property int32_t tid;
@end

@implementation PP_Pet

- (BOOL) hasUid {
  return !!hasUid_;
}
- (void) setHasUid:(BOOL) value_ {
  hasUid_ = !!value_;
}
@synthesize uid;
- (BOOL) hasPetId {
  return !!hasPetId_;
}
- (void) setHasPetId:(BOOL) value_ {
  hasPetId_ = !!value_;
}
@synthesize petId;
- (BOOL) hasPetName {
  return !!hasPetName_;
}
- (void) setHasPetName:(BOOL) value_ {
  hasPetName_ = !!value_;
}
@synthesize petName;
- (BOOL) hasLevel {
  return !!hasLevel_;
}
- (void) setHasLevel:(BOOL) value_ {
  hasLevel_ = !!value_;
}
@synthesize level;
- (BOOL) hasCurExp {
  return !!hasCurExp_;
}
- (void) setHasCurExp:(BOOL) value_ {
  hasCurExp_ = !!value_;
}
@synthesize curExp;
- (BOOL) hasTotalExp {
  return !!hasTotalExp_;
}
- (void) setHasTotalExp:(BOOL) value_ {
  hasTotalExp_ = !!value_;
}
@synthesize totalExp;
- (BOOL) hasCurHp {
  return !!hasCurHp_;
}
- (void) setHasCurHp:(BOOL) value_ {
  hasCurHp_ = !!value_;
}
@synthesize curHp;
- (BOOL) hasTotalHp {
  return !!hasTotalHp_;
}
- (void) setHasTotalHp:(BOOL) value_ {
  hasTotalHp_ = !!value_;
}
@synthesize totalHp;
- (BOOL) hasCurMp {
  return !!hasCurMp_;
}
- (void) setHasCurMp:(BOOL) value_ {
  hasCurMp_ = !!value_;
}
@synthesize curMp;
- (BOOL) hasTotalMp {
  return !!hasTotalMp_;
}
- (void) setHasTotalMp:(BOOL) value_ {
  hasTotalMp_ = !!value_;
}
@synthesize totalMp;
- (BOOL) hasState {
  return !!hasState_;
}
- (void) setHasState:(BOOL) value_ {
  hasState_ = !!value_;
}
@synthesize state;
- (BOOL) hasLife {
  return !!hasLife_;
}
- (void) setHasLife:(BOOL) value_ {
  hasLife_ = !!value_;
}
@synthesize life;
- (BOOL) hasGrow {
  return !!hasGrow_;
}
- (void) setHasGrow:(BOOL) value_ {
  hasGrow_ = !!value_;
}
@synthesize grow;
- (BOOL) hasFeel {
  return !!hasFeel_;
}
- (void) setHasFeel:(BOOL) value_ {
  hasFeel_ = !!value_;
}
@synthesize feel;
- (BOOL) hasAge {
  return !!hasAge_;
}
- (void) setHasAge:(BOOL) value_ {
  hasAge_ = !!value_;
}
@synthesize age;
- (BOOL) hasIsVariation {
  return !!hasIsVariation_;
}
- (void) setHasIsVariation:(BOOL) value_ {
  hasIsVariation_ = !!value_;
}
@synthesize isVariation;
- (BOOL) hasVariationLevel {
  return !!hasVariationLevel_;
}
- (void) setHasVariationLevel:(BOOL) value_ {
  hasVariationLevel_ = !!value_;
}
@synthesize variationLevel;
- (BOOL) hasPower {
  return !!hasPower_;
}
- (void) setHasPower:(BOOL) value_ {
  hasPower_ = !!value_;
}
@synthesize power;
- (BOOL) hasAgile {
  return !!hasAgile_;
}
- (void) setHasAgile:(BOOL) value_ {
  hasAgile_ = !!value_;
}
@synthesize agile;
- (BOOL) hasIntellegence {
  return !!hasIntellegence_;
}
- (void) setHasIntellegence:(BOOL) value_ {
  hasIntellegence_ = !!value_;
}
@synthesize intellegence;
- (BOOL) hasVigour {
  return !!hasVigour_;
}
- (void) setHasVigour:(BOOL) value_ {
  hasVigour_ = !!value_;
}
@synthesize vigour;
- (BOOL) hasEndur {
  return !!hasEndur_;
}
- (void) setHasEndur:(BOOL) value_ {
  hasEndur_ = !!value_;
}
@synthesize endur;
- (BOOL) hasAttack {
  return !!hasAttack_;
}
- (void) setHasAttack:(BOOL) value_ {
  hasAttack_ = !!value_;
}
@synthesize attack;
- (BOOL) hasDefense {
  return !!hasDefense_;
}
- (void) setHasDefense:(BOOL) value_ {
  hasDefense_ = !!value_;
}
@synthesize defense;
- (BOOL) hasMagicDamage {
  return !!hasMagicDamage_;
}
- (void) setHasMagicDamage:(BOOL) value_ {
  hasMagicDamage_ = !!value_;
}
@synthesize magicDamage;
- (BOOL) hasMagicDefense {
  return !!hasMagicDefense_;
}
- (void) setHasMagicDefense:(BOOL) value_ {
  hasMagicDefense_ = !!value_;
}
@synthesize magicDefense;
- (BOOL) hasTid {
  return !!hasTid_;
}
- (void) setHasTid:(BOOL) value_ {
  hasTid_ = !!value_;
}
@synthesize tid;
- (void) dealloc {
  self.petName = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.uid = 0;
    self.petId = 0;
    self.petName = @"";
    self.level = 0;
    self.curExp = 0;
    self.totalExp = 0;
    self.curHp = 0;
    self.totalHp = 0;
    self.curMp = 0;
    self.totalMp = 0;
    self.state = 0;
    self.life = 0;
    self.grow = 0;
    self.feel = 0;
    self.age = 0;
    self.isVariation = 0;
    self.variationLevel = 0;
    self.power = 0;
    self.agile = 0;
    self.intellegence = 0;
    self.vigour = 0;
    self.endur = 0;
    self.attack = 0;
    self.defense = 0;
    self.magicDamage = 0;
    self.magicDefense = 0;
    self.tid = 0;
  }
  return self;
}
static PP_Pet* defaultPP_PetInstance = nil;
+ (void) initialize {
  if (self == [PP_Pet class]) {
    defaultPP_PetInstance = [[PP_Pet alloc] init];
  }
}
+ (PP_Pet*) defaultInstance {
  return defaultPP_PetInstance;
}
- (PP_Pet*) defaultInstance {
  return defaultPP_PetInstance;
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasUid) {
    [output writeInt32:1 value:self.uid];
  }
  if (self.hasPetId) {
    [output writeInt32:2 value:self.petId];
  }
  if (self.hasPetName) {
    [output writeString:3 value:self.petName];
  }
  if (self.hasLevel) {
    [output writeInt32:4 value:self.level];
  }
  if (self.hasCurExp) {
    [output writeInt32:5 value:self.curExp];
  }
  if (self.hasTotalExp) {
    [output writeInt32:6 value:self.totalExp];
  }
  if (self.hasCurHp) {
    [output writeInt32:7 value:self.curHp];
  }
  if (self.hasTotalHp) {
    [output writeInt32:8 value:self.totalHp];
  }
  if (self.hasCurMp) {
    [output writeInt32:9 value:self.curMp];
  }
  if (self.hasTotalMp) {
    [output writeInt32:10 value:self.totalMp];
  }
  if (self.hasState) {
    [output writeInt32:11 value:self.state];
  }
  if (self.hasLife) {
    [output writeInt32:12 value:self.life];
  }
  if (self.hasGrow) {
    [output writeInt32:13 value:self.grow];
  }
  if (self.hasFeel) {
    [output writeInt32:14 value:self.feel];
  }
  if (self.hasAge) {
    [output writeInt32:15 value:self.age];
  }
  if (self.hasIsVariation) {
    [output writeInt32:16 value:self.isVariation];
  }
  if (self.hasVariationLevel) {
    [output writeInt32:17 value:self.variationLevel];
  }
  if (self.hasPower) {
    [output writeInt32:18 value:self.power];
  }
  if (self.hasAgile) {
    [output writeInt32:19 value:self.agile];
  }
  if (self.hasIntellegence) {
    [output writeInt32:20 value:self.intellegence];
  }
  if (self.hasVigour) {
    [output writeInt32:21 value:self.vigour];
  }
  if (self.hasEndur) {
    [output writeInt32:22 value:self.endur];
  }
  if (self.hasAttack) {
    [output writeInt32:23 value:self.attack];
  }
  if (self.hasDefense) {
    [output writeInt32:24 value:self.defense];
  }
  if (self.hasMagicDamage) {
    [output writeInt32:25 value:self.magicDamage];
  }
  if (self.hasMagicDefense) {
    [output writeInt32:26 value:self.magicDefense];
  }
  if (self.hasTid) {
    [output writeInt32:27 value:self.tid];
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
  if (self.hasPetId) {
    size_ += computeInt32Size(2, self.petId);
  }
  if (self.hasPetName) {
    size_ += computeStringSize(3, self.petName);
  }
  if (self.hasLevel) {
    size_ += computeInt32Size(4, self.level);
  }
  if (self.hasCurExp) {
    size_ += computeInt32Size(5, self.curExp);
  }
  if (self.hasTotalExp) {
    size_ += computeInt32Size(6, self.totalExp);
  }
  if (self.hasCurHp) {
    size_ += computeInt32Size(7, self.curHp);
  }
  if (self.hasTotalHp) {
    size_ += computeInt32Size(8, self.totalHp);
  }
  if (self.hasCurMp) {
    size_ += computeInt32Size(9, self.curMp);
  }
  if (self.hasTotalMp) {
    size_ += computeInt32Size(10, self.totalMp);
  }
  if (self.hasState) {
    size_ += computeInt32Size(11, self.state);
  }
  if (self.hasLife) {
    size_ += computeInt32Size(12, self.life);
  }
  if (self.hasGrow) {
    size_ += computeInt32Size(13, self.grow);
  }
  if (self.hasFeel) {
    size_ += computeInt32Size(14, self.feel);
  }
  if (self.hasAge) {
    size_ += computeInt32Size(15, self.age);
  }
  if (self.hasIsVariation) {
    size_ += computeInt32Size(16, self.isVariation);
  }
  if (self.hasVariationLevel) {
    size_ += computeInt32Size(17, self.variationLevel);
  }
  if (self.hasPower) {
    size_ += computeInt32Size(18, self.power);
  }
  if (self.hasAgile) {
    size_ += computeInt32Size(19, self.agile);
  }
  if (self.hasIntellegence) {
    size_ += computeInt32Size(20, self.intellegence);
  }
  if (self.hasVigour) {
    size_ += computeInt32Size(21, self.vigour);
  }
  if (self.hasEndur) {
    size_ += computeInt32Size(22, self.endur);
  }
  if (self.hasAttack) {
    size_ += computeInt32Size(23, self.attack);
  }
  if (self.hasDefense) {
    size_ += computeInt32Size(24, self.defense);
  }
  if (self.hasMagicDamage) {
    size_ += computeInt32Size(25, self.magicDamage);
  }
  if (self.hasMagicDefense) {
    size_ += computeInt32Size(26, self.magicDefense);
  }
  if (self.hasTid) {
    size_ += computeInt32Size(27, self.tid);
  }
  size_ += self.unknownFields.serializedSize;
  memoizedSerializedSize = size_;
  return size_;
}
+ (PP_Pet*) parseFromData:(NSData*) data {
  return (PP_Pet*)[[[PP_Pet builder] mergeFromData:data] build];
}
+ (PP_Pet*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_Pet*)[[[PP_Pet builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (PP_Pet*) parseFromInputStream:(NSInputStream*) input {
  return (PP_Pet*)[[[PP_Pet builder] mergeFromInputStream:input] build];
}
+ (PP_Pet*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_Pet*)[[[PP_Pet builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (PP_Pet*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (PP_Pet*)[[[PP_Pet builder] mergeFromCodedInputStream:input] build];
}
+ (PP_Pet*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PP_Pet*)[[[PP_Pet builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (PP_Pet_Builder*) builder {
  return [[[PP_Pet_Builder alloc] init] autorelease];
}
+ (PP_Pet_Builder*) builderWithPrototype:(PP_Pet*) prototype {
  return [[PP_Pet builder] mergeFrom:prototype];
}
- (PP_Pet_Builder*) builder {
  return [PP_Pet builder];
}
- (PP_Pet_Builder*) toBuilder {
  return [PP_Pet builderWithPrototype:self];
}
- (void) writeDescriptionTo:(NSMutableString*) output withIndent:(NSString*) indent {
  if (self.hasUid) {
    [output appendFormat:@"%@%@: %@\n", indent, @"uid", [NSNumber numberWithInt:self.uid]];
  }
  if (self.hasPetId) {
    [output appendFormat:@"%@%@: %@\n", indent, @"petId", [NSNumber numberWithInt:self.petId]];
  }
  if (self.hasPetName) {
    [output appendFormat:@"%@%@: %@\n", indent, @"petName", self.petName];
  }
  if (self.hasLevel) {
    [output appendFormat:@"%@%@: %@\n", indent, @"level", [NSNumber numberWithInt:self.level]];
  }
  if (self.hasCurExp) {
    [output appendFormat:@"%@%@: %@\n", indent, @"curExp", [NSNumber numberWithInt:self.curExp]];
  }
  if (self.hasTotalExp) {
    [output appendFormat:@"%@%@: %@\n", indent, @"totalExp", [NSNumber numberWithInt:self.totalExp]];
  }
  if (self.hasCurHp) {
    [output appendFormat:@"%@%@: %@\n", indent, @"curHp", [NSNumber numberWithInt:self.curHp]];
  }
  if (self.hasTotalHp) {
    [output appendFormat:@"%@%@: %@\n", indent, @"totalHp", [NSNumber numberWithInt:self.totalHp]];
  }
  if (self.hasCurMp) {
    [output appendFormat:@"%@%@: %@\n", indent, @"curMp", [NSNumber numberWithInt:self.curMp]];
  }
  if (self.hasTotalMp) {
    [output appendFormat:@"%@%@: %@\n", indent, @"totalMp", [NSNumber numberWithInt:self.totalMp]];
  }
  if (self.hasState) {
    [output appendFormat:@"%@%@: %@\n", indent, @"state", [NSNumber numberWithInt:self.state]];
  }
  if (self.hasLife) {
    [output appendFormat:@"%@%@: %@\n", indent, @"life", [NSNumber numberWithInt:self.life]];
  }
  if (self.hasGrow) {
    [output appendFormat:@"%@%@: %@\n", indent, @"grow", [NSNumber numberWithInt:self.grow]];
  }
  if (self.hasFeel) {
    [output appendFormat:@"%@%@: %@\n", indent, @"feel", [NSNumber numberWithInt:self.feel]];
  }
  if (self.hasAge) {
    [output appendFormat:@"%@%@: %@\n", indent, @"age", [NSNumber numberWithInt:self.age]];
  }
  if (self.hasIsVariation) {
    [output appendFormat:@"%@%@: %@\n", indent, @"isVariation", [NSNumber numberWithInt:self.isVariation]];
  }
  if (self.hasVariationLevel) {
    [output appendFormat:@"%@%@: %@\n", indent, @"variationLevel", [NSNumber numberWithInt:self.variationLevel]];
  }
  if (self.hasPower) {
    [output appendFormat:@"%@%@: %@\n", indent, @"power", [NSNumber numberWithInt:self.power]];
  }
  if (self.hasAgile) {
    [output appendFormat:@"%@%@: %@\n", indent, @"agile", [NSNumber numberWithInt:self.agile]];
  }
  if (self.hasIntellegence) {
    [output appendFormat:@"%@%@: %@\n", indent, @"intellegence", [NSNumber numberWithInt:self.intellegence]];
  }
  if (self.hasVigour) {
    [output appendFormat:@"%@%@: %@\n", indent, @"vigour", [NSNumber numberWithInt:self.vigour]];
  }
  if (self.hasEndur) {
    [output appendFormat:@"%@%@: %@\n", indent, @"endur", [NSNumber numberWithInt:self.endur]];
  }
  if (self.hasAttack) {
    [output appendFormat:@"%@%@: %@\n", indent, @"attack", [NSNumber numberWithInt:self.attack]];
  }
  if (self.hasDefense) {
    [output appendFormat:@"%@%@: %@\n", indent, @"defense", [NSNumber numberWithInt:self.defense]];
  }
  if (self.hasMagicDamage) {
    [output appendFormat:@"%@%@: %@\n", indent, @"magicDamage", [NSNumber numberWithInt:self.magicDamage]];
  }
  if (self.hasMagicDefense) {
    [output appendFormat:@"%@%@: %@\n", indent, @"magicDefense", [NSNumber numberWithInt:self.magicDefense]];
  }
  if (self.hasTid) {
    [output appendFormat:@"%@%@: %@\n", indent, @"tid", [NSNumber numberWithInt:self.tid]];
  }
  [self.unknownFields writeDescriptionTo:output withIndent:indent];
}
- (BOOL) isEqual:(id)other {
  if (other == self) {
    return YES;
  }
  if (![other isKindOfClass:[PP_Pet class]]) {
    return NO;
  }
  PP_Pet *otherMessage = other;
  return
      self.hasUid == otherMessage.hasUid &&
      (!self.hasUid || self.uid == otherMessage.uid) &&
      self.hasPetId == otherMessage.hasPetId &&
      (!self.hasPetId || self.petId == otherMessage.petId) &&
      self.hasPetName == otherMessage.hasPetName &&
      (!self.hasPetName || [self.petName isEqual:otherMessage.petName]) &&
      self.hasLevel == otherMessage.hasLevel &&
      (!self.hasLevel || self.level == otherMessage.level) &&
      self.hasCurExp == otherMessage.hasCurExp &&
      (!self.hasCurExp || self.curExp == otherMessage.curExp) &&
      self.hasTotalExp == otherMessage.hasTotalExp &&
      (!self.hasTotalExp || self.totalExp == otherMessage.totalExp) &&
      self.hasCurHp == otherMessage.hasCurHp &&
      (!self.hasCurHp || self.curHp == otherMessage.curHp) &&
      self.hasTotalHp == otherMessage.hasTotalHp &&
      (!self.hasTotalHp || self.totalHp == otherMessage.totalHp) &&
      self.hasCurMp == otherMessage.hasCurMp &&
      (!self.hasCurMp || self.curMp == otherMessage.curMp) &&
      self.hasTotalMp == otherMessage.hasTotalMp &&
      (!self.hasTotalMp || self.totalMp == otherMessage.totalMp) &&
      self.hasState == otherMessage.hasState &&
      (!self.hasState || self.state == otherMessage.state) &&
      self.hasLife == otherMessage.hasLife &&
      (!self.hasLife || self.life == otherMessage.life) &&
      self.hasGrow == otherMessage.hasGrow &&
      (!self.hasGrow || self.grow == otherMessage.grow) &&
      self.hasFeel == otherMessage.hasFeel &&
      (!self.hasFeel || self.feel == otherMessage.feel) &&
      self.hasAge == otherMessage.hasAge &&
      (!self.hasAge || self.age == otherMessage.age) &&
      self.hasIsVariation == otherMessage.hasIsVariation &&
      (!self.hasIsVariation || self.isVariation == otherMessage.isVariation) &&
      self.hasVariationLevel == otherMessage.hasVariationLevel &&
      (!self.hasVariationLevel || self.variationLevel == otherMessage.variationLevel) &&
      self.hasPower == otherMessage.hasPower &&
      (!self.hasPower || self.power == otherMessage.power) &&
      self.hasAgile == otherMessage.hasAgile &&
      (!self.hasAgile || self.agile == otherMessage.agile) &&
      self.hasIntellegence == otherMessage.hasIntellegence &&
      (!self.hasIntellegence || self.intellegence == otherMessage.intellegence) &&
      self.hasVigour == otherMessage.hasVigour &&
      (!self.hasVigour || self.vigour == otherMessage.vigour) &&
      self.hasEndur == otherMessage.hasEndur &&
      (!self.hasEndur || self.endur == otherMessage.endur) &&
      self.hasAttack == otherMessage.hasAttack &&
      (!self.hasAttack || self.attack == otherMessage.attack) &&
      self.hasDefense == otherMessage.hasDefense &&
      (!self.hasDefense || self.defense == otherMessage.defense) &&
      self.hasMagicDamage == otherMessage.hasMagicDamage &&
      (!self.hasMagicDamage || self.magicDamage == otherMessage.magicDamage) &&
      self.hasMagicDefense == otherMessage.hasMagicDefense &&
      (!self.hasMagicDefense || self.magicDefense == otherMessage.magicDefense) &&
      self.hasTid == otherMessage.hasTid &&
      (!self.hasTid || self.tid == otherMessage.tid) &&
      (self.unknownFields == otherMessage.unknownFields || (self.unknownFields != nil && [self.unknownFields isEqual:otherMessage.unknownFields]));
}
- (NSUInteger) hash {
  NSUInteger hashCode = 7;
  if (self.hasUid) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.uid] hash];
  }
  if (self.hasPetId) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.petId] hash];
  }
  if (self.hasPetName) {
    hashCode = hashCode * 31 + [self.petName hash];
  }
  if (self.hasLevel) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.level] hash];
  }
  if (self.hasCurExp) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.curExp] hash];
  }
  if (self.hasTotalExp) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.totalExp] hash];
  }
  if (self.hasCurHp) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.curHp] hash];
  }
  if (self.hasTotalHp) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.totalHp] hash];
  }
  if (self.hasCurMp) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.curMp] hash];
  }
  if (self.hasTotalMp) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.totalMp] hash];
  }
  if (self.hasState) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.state] hash];
  }
  if (self.hasLife) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.life] hash];
  }
  if (self.hasGrow) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.grow] hash];
  }
  if (self.hasFeel) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.feel] hash];
  }
  if (self.hasAge) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.age] hash];
  }
  if (self.hasIsVariation) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.isVariation] hash];
  }
  if (self.hasVariationLevel) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.variationLevel] hash];
  }
  if (self.hasPower) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.power] hash];
  }
  if (self.hasAgile) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.agile] hash];
  }
  if (self.hasIntellegence) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.intellegence] hash];
  }
  if (self.hasVigour) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.vigour] hash];
  }
  if (self.hasEndur) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.endur] hash];
  }
  if (self.hasAttack) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.attack] hash];
  }
  if (self.hasDefense) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.defense] hash];
  }
  if (self.hasMagicDamage) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.magicDamage] hash];
  }
  if (self.hasMagicDefense) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.magicDefense] hash];
  }
  if (self.hasTid) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInt:self.tid] hash];
  }
  hashCode = hashCode * 31 + [self.unknownFields hash];
  return hashCode;
}
@end

@interface PP_Pet_Builder()
@property (retain) PP_Pet* result;
@end

@implementation PP_Pet_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[PP_Pet alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (PP_Pet_Builder*) clear {
  self.result = [[[PP_Pet alloc] init] autorelease];
  return self;
}
- (PP_Pet_Builder*) clone {
  return [PP_Pet builderWithPrototype:result];
}
- (PP_Pet*) defaultInstance {
  return [PP_Pet defaultInstance];
}
- (PP_Pet*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (PP_Pet*) buildPartial {
  PP_Pet* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (PP_Pet_Builder*) mergeFrom:(PP_Pet*) other {
  if (other == [PP_Pet defaultInstance]) {
    return self;
  }
  if (other.hasUid) {
    [self setUid:other.uid];
  }
  if (other.hasPetId) {
    [self setPetId:other.petId];
  }
  if (other.hasPetName) {
    [self setPetName:other.petName];
  }
  if (other.hasLevel) {
    [self setLevel:other.level];
  }
  if (other.hasCurExp) {
    [self setCurExp:other.curExp];
  }
  if (other.hasTotalExp) {
    [self setTotalExp:other.totalExp];
  }
  if (other.hasCurHp) {
    [self setCurHp:other.curHp];
  }
  if (other.hasTotalHp) {
    [self setTotalHp:other.totalHp];
  }
  if (other.hasCurMp) {
    [self setCurMp:other.curMp];
  }
  if (other.hasTotalMp) {
    [self setTotalMp:other.totalMp];
  }
  if (other.hasState) {
    [self setState:other.state];
  }
  if (other.hasLife) {
    [self setLife:other.life];
  }
  if (other.hasGrow) {
    [self setGrow:other.grow];
  }
  if (other.hasFeel) {
    [self setFeel:other.feel];
  }
  if (other.hasAge) {
    [self setAge:other.age];
  }
  if (other.hasIsVariation) {
    [self setIsVariation:other.isVariation];
  }
  if (other.hasVariationLevel) {
    [self setVariationLevel:other.variationLevel];
  }
  if (other.hasPower) {
    [self setPower:other.power];
  }
  if (other.hasAgile) {
    [self setAgile:other.agile];
  }
  if (other.hasIntellegence) {
    [self setIntellegence:other.intellegence];
  }
  if (other.hasVigour) {
    [self setVigour:other.vigour];
  }
  if (other.hasEndur) {
    [self setEndur:other.endur];
  }
  if (other.hasAttack) {
    [self setAttack:other.attack];
  }
  if (other.hasDefense) {
    [self setDefense:other.defense];
  }
  if (other.hasMagicDamage) {
    [self setMagicDamage:other.magicDamage];
  }
  if (other.hasMagicDefense) {
    [self setMagicDefense:other.magicDefense];
  }
  if (other.hasTid) {
    [self setTid:other.tid];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (PP_Pet_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (PP_Pet_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
      case 16: {
        [self setPetId:[input readInt32]];
        break;
      }
      case 26: {
        [self setPetName:[input readString]];
        break;
      }
      case 32: {
        [self setLevel:[input readInt32]];
        break;
      }
      case 40: {
        [self setCurExp:[input readInt32]];
        break;
      }
      case 48: {
        [self setTotalExp:[input readInt32]];
        break;
      }
      case 56: {
        [self setCurHp:[input readInt32]];
        break;
      }
      case 64: {
        [self setTotalHp:[input readInt32]];
        break;
      }
      case 72: {
        [self setCurMp:[input readInt32]];
        break;
      }
      case 80: {
        [self setTotalMp:[input readInt32]];
        break;
      }
      case 88: {
        [self setState:[input readInt32]];
        break;
      }
      case 96: {
        [self setLife:[input readInt32]];
        break;
      }
      case 104: {
        [self setGrow:[input readInt32]];
        break;
      }
      case 112: {
        [self setFeel:[input readInt32]];
        break;
      }
      case 120: {
        [self setAge:[input readInt32]];
        break;
      }
      case 128: {
        [self setIsVariation:[input readInt32]];
        break;
      }
      case 136: {
        [self setVariationLevel:[input readInt32]];
        break;
      }
      case 144: {
        [self setPower:[input readInt32]];
        break;
      }
      case 152: {
        [self setAgile:[input readInt32]];
        break;
      }
      case 160: {
        [self setIntellegence:[input readInt32]];
        break;
      }
      case 168: {
        [self setVigour:[input readInt32]];
        break;
      }
      case 176: {
        [self setEndur:[input readInt32]];
        break;
      }
      case 184: {
        [self setAttack:[input readInt32]];
        break;
      }
      case 192: {
        [self setDefense:[input readInt32]];
        break;
      }
      case 200: {
        [self setMagicDamage:[input readInt32]];
        break;
      }
      case 208: {
        [self setMagicDefense:[input readInt32]];
        break;
      }
      case 216: {
        [self setTid:[input readInt32]];
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
- (PP_Pet_Builder*) setUid:(int32_t) value {
  result.hasUid = YES;
  result.uid = value;
  return self;
}
- (PP_Pet_Builder*) clearUid {
  result.hasUid = NO;
  result.uid = 0;
  return self;
}
- (BOOL) hasPetId {
  return result.hasPetId;
}
- (int32_t) petId {
  return result.petId;
}
- (PP_Pet_Builder*) setPetId:(int32_t) value {
  result.hasPetId = YES;
  result.petId = value;
  return self;
}
- (PP_Pet_Builder*) clearPetId {
  result.hasPetId = NO;
  result.petId = 0;
  return self;
}
- (BOOL) hasPetName {
  return result.hasPetName;
}
- (NSString*) petName {
  return result.petName;
}
- (PP_Pet_Builder*) setPetName:(NSString*) value {
  result.hasPetName = YES;
  result.petName = value;
  return self;
}
- (PP_Pet_Builder*) clearPetName {
  result.hasPetName = NO;
  result.petName = @"";
  return self;
}
- (BOOL) hasLevel {
  return result.hasLevel;
}
- (int32_t) level {
  return result.level;
}
- (PP_Pet_Builder*) setLevel:(int32_t) value {
  result.hasLevel = YES;
  result.level = value;
  return self;
}
- (PP_Pet_Builder*) clearLevel {
  result.hasLevel = NO;
  result.level = 0;
  return self;
}
- (BOOL) hasCurExp {
  return result.hasCurExp;
}
- (int32_t) curExp {
  return result.curExp;
}
- (PP_Pet_Builder*) setCurExp:(int32_t) value {
  result.hasCurExp = YES;
  result.curExp = value;
  return self;
}
- (PP_Pet_Builder*) clearCurExp {
  result.hasCurExp = NO;
  result.curExp = 0;
  return self;
}
- (BOOL) hasTotalExp {
  return result.hasTotalExp;
}
- (int32_t) totalExp {
  return result.totalExp;
}
- (PP_Pet_Builder*) setTotalExp:(int32_t) value {
  result.hasTotalExp = YES;
  result.totalExp = value;
  return self;
}
- (PP_Pet_Builder*) clearTotalExp {
  result.hasTotalExp = NO;
  result.totalExp = 0;
  return self;
}
- (BOOL) hasCurHp {
  return result.hasCurHp;
}
- (int32_t) curHp {
  return result.curHp;
}
- (PP_Pet_Builder*) setCurHp:(int32_t) value {
  result.hasCurHp = YES;
  result.curHp = value;
  return self;
}
- (PP_Pet_Builder*) clearCurHp {
  result.hasCurHp = NO;
  result.curHp = 0;
  return self;
}
- (BOOL) hasTotalHp {
  return result.hasTotalHp;
}
- (int32_t) totalHp {
  return result.totalHp;
}
- (PP_Pet_Builder*) setTotalHp:(int32_t) value {
  result.hasTotalHp = YES;
  result.totalHp = value;
  return self;
}
- (PP_Pet_Builder*) clearTotalHp {
  result.hasTotalHp = NO;
  result.totalHp = 0;
  return self;
}
- (BOOL) hasCurMp {
  return result.hasCurMp;
}
- (int32_t) curMp {
  return result.curMp;
}
- (PP_Pet_Builder*) setCurMp:(int32_t) value {
  result.hasCurMp = YES;
  result.curMp = value;
  return self;
}
- (PP_Pet_Builder*) clearCurMp {
  result.hasCurMp = NO;
  result.curMp = 0;
  return self;
}
- (BOOL) hasTotalMp {
  return result.hasTotalMp;
}
- (int32_t) totalMp {
  return result.totalMp;
}
- (PP_Pet_Builder*) setTotalMp:(int32_t) value {
  result.hasTotalMp = YES;
  result.totalMp = value;
  return self;
}
- (PP_Pet_Builder*) clearTotalMp {
  result.hasTotalMp = NO;
  result.totalMp = 0;
  return self;
}
- (BOOL) hasState {
  return result.hasState;
}
- (int32_t) state {
  return result.state;
}
- (PP_Pet_Builder*) setState:(int32_t) value {
  result.hasState = YES;
  result.state = value;
  return self;
}
- (PP_Pet_Builder*) clearState {
  result.hasState = NO;
  result.state = 0;
  return self;
}
- (BOOL) hasLife {
  return result.hasLife;
}
- (int32_t) life {
  return result.life;
}
- (PP_Pet_Builder*) setLife:(int32_t) value {
  result.hasLife = YES;
  result.life = value;
  return self;
}
- (PP_Pet_Builder*) clearLife {
  result.hasLife = NO;
  result.life = 0;
  return self;
}
- (BOOL) hasGrow {
  return result.hasGrow;
}
- (int32_t) grow {
  return result.grow;
}
- (PP_Pet_Builder*) setGrow:(int32_t) value {
  result.hasGrow = YES;
  result.grow = value;
  return self;
}
- (PP_Pet_Builder*) clearGrow {
  result.hasGrow = NO;
  result.grow = 0;
  return self;
}
- (BOOL) hasFeel {
  return result.hasFeel;
}
- (int32_t) feel {
  return result.feel;
}
- (PP_Pet_Builder*) setFeel:(int32_t) value {
  result.hasFeel = YES;
  result.feel = value;
  return self;
}
- (PP_Pet_Builder*) clearFeel {
  result.hasFeel = NO;
  result.feel = 0;
  return self;
}
- (BOOL) hasAge {
  return result.hasAge;
}
- (int32_t) age {
  return result.age;
}
- (PP_Pet_Builder*) setAge:(int32_t) value {
  result.hasAge = YES;
  result.age = value;
  return self;
}
- (PP_Pet_Builder*) clearAge {
  result.hasAge = NO;
  result.age = 0;
  return self;
}
- (BOOL) hasIsVariation {
  return result.hasIsVariation;
}
- (int32_t) isVariation {
  return result.isVariation;
}
- (PP_Pet_Builder*) setIsVariation:(int32_t) value {
  result.hasIsVariation = YES;
  result.isVariation = value;
  return self;
}
- (PP_Pet_Builder*) clearIsVariation {
  result.hasIsVariation = NO;
  result.isVariation = 0;
  return self;
}
- (BOOL) hasVariationLevel {
  return result.hasVariationLevel;
}
- (int32_t) variationLevel {
  return result.variationLevel;
}
- (PP_Pet_Builder*) setVariationLevel:(int32_t) value {
  result.hasVariationLevel = YES;
  result.variationLevel = value;
  return self;
}
- (PP_Pet_Builder*) clearVariationLevel {
  result.hasVariationLevel = NO;
  result.variationLevel = 0;
  return self;
}
- (BOOL) hasPower {
  return result.hasPower;
}
- (int32_t) power {
  return result.power;
}
- (PP_Pet_Builder*) setPower:(int32_t) value {
  result.hasPower = YES;
  result.power = value;
  return self;
}
- (PP_Pet_Builder*) clearPower {
  result.hasPower = NO;
  result.power = 0;
  return self;
}
- (BOOL) hasAgile {
  return result.hasAgile;
}
- (int32_t) agile {
  return result.agile;
}
- (PP_Pet_Builder*) setAgile:(int32_t) value {
  result.hasAgile = YES;
  result.agile = value;
  return self;
}
- (PP_Pet_Builder*) clearAgile {
  result.hasAgile = NO;
  result.agile = 0;
  return self;
}
- (BOOL) hasIntellegence {
  return result.hasIntellegence;
}
- (int32_t) intellegence {
  return result.intellegence;
}
- (PP_Pet_Builder*) setIntellegence:(int32_t) value {
  result.hasIntellegence = YES;
  result.intellegence = value;
  return self;
}
- (PP_Pet_Builder*) clearIntellegence {
  result.hasIntellegence = NO;
  result.intellegence = 0;
  return self;
}
- (BOOL) hasVigour {
  return result.hasVigour;
}
- (int32_t) vigour {
  return result.vigour;
}
- (PP_Pet_Builder*) setVigour:(int32_t) value {
  result.hasVigour = YES;
  result.vigour = value;
  return self;
}
- (PP_Pet_Builder*) clearVigour {
  result.hasVigour = NO;
  result.vigour = 0;
  return self;
}
- (BOOL) hasEndur {
  return result.hasEndur;
}
- (int32_t) endur {
  return result.endur;
}
- (PP_Pet_Builder*) setEndur:(int32_t) value {
  result.hasEndur = YES;
  result.endur = value;
  return self;
}
- (PP_Pet_Builder*) clearEndur {
  result.hasEndur = NO;
  result.endur = 0;
  return self;
}
- (BOOL) hasAttack {
  return result.hasAttack;
}
- (int32_t) attack {
  return result.attack;
}
- (PP_Pet_Builder*) setAttack:(int32_t) value {
  result.hasAttack = YES;
  result.attack = value;
  return self;
}
- (PP_Pet_Builder*) clearAttack {
  result.hasAttack = NO;
  result.attack = 0;
  return self;
}
- (BOOL) hasDefense {
  return result.hasDefense;
}
- (int32_t) defense {
  return result.defense;
}
- (PP_Pet_Builder*) setDefense:(int32_t) value {
  result.hasDefense = YES;
  result.defense = value;
  return self;
}
- (PP_Pet_Builder*) clearDefense {
  result.hasDefense = NO;
  result.defense = 0;
  return self;
}
- (BOOL) hasMagicDamage {
  return result.hasMagicDamage;
}
- (int32_t) magicDamage {
  return result.magicDamage;
}
- (PP_Pet_Builder*) setMagicDamage:(int32_t) value {
  result.hasMagicDamage = YES;
  result.magicDamage = value;
  return self;
}
- (PP_Pet_Builder*) clearMagicDamage {
  result.hasMagicDamage = NO;
  result.magicDamage = 0;
  return self;
}
- (BOOL) hasMagicDefense {
  return result.hasMagicDefense;
}
- (int32_t) magicDefense {
  return result.magicDefense;
}
- (PP_Pet_Builder*) setMagicDefense:(int32_t) value {
  result.hasMagicDefense = YES;
  result.magicDefense = value;
  return self;
}
- (PP_Pet_Builder*) clearMagicDefense {
  result.hasMagicDefense = NO;
  result.magicDefense = 0;
  return self;
}
- (BOOL) hasTid {
  return result.hasTid;
}
- (int32_t) tid {
  return result.tid;
}
- (PP_Pet_Builder*) setTid:(int32_t) value {
  result.hasTid = YES;
  result.tid = value;
  return self;
}
- (PP_Pet_Builder*) clearTid {
  result.hasTid = NO;
  result.tid = 0;
  return self;
}
@end

