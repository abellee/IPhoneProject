//
//  ResourceInitializer.m
//  PocketPet
//
//  Created by Lee Abel on 13-5-6.
//
//

#import "ResourceInitializer.h"
#import "SystemConfig.h"
#import "InstanceConfig.h"
#import "Global.h"
#import "Monster.h"
#import "PetData.h"

@implementation ResourceInitializer

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (void)initInstanceConfigList
{
    [self performSelectorInBackground:@selector(initInstanceConfigListFromFile) withObject:nil];
}

- (void)initInstanceConfigListFromFile
{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"all" ofType:@"fb"];
    NSFileHandle* fileHandle = [NSFileHandle fileHandleForReadingAtPath:path];
    NSData* numData = [fileHandle readDataOfLength:4];
    int allNum;
    [numData getBytes:&allNum];
    int dataLen = allNum * 20;
    [fileHandle seekToFileOffset:4];
    NSData* allData = [fileHandle readDataOfLength:dataLen];
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < allNum; i++) {
        int tag;
        int mainStart;
        int mainLen;
        int subStart;
        int subLen;
        
        [allData getBytes:&tag range:NSMakeRange(i * 20, 4)];
        [allData getBytes:&mainStart range:NSMakeRange(i * 20 + 4, 4)];
        [allData getBytes:&mainLen range:NSMakeRange(i * 20 + 8, 4)];
        [allData getBytes:&subStart range:NSMakeRange(i * 20 + 12, 4)];
        [allData getBytes:&subLen range:NSMakeRange(i * 20 + 16, 4)];
        
        InstanceConfig* config = [[InstanceConfig alloc] init];
        [config instanceId:tag];
        [config instanceName:@""];
        [config dataRange:NSMakeRange(mainStart + dataLen + 4, mainLen)];
        [config battleRange:NSMakeRange(subStart + dataLen + 4, subLen)];
        [array addObject:config];
        [config release];
    }
    [[Global sharedGlobal] instanceList:array];
    [fileHandle closeFile];
}

- (void)initMainPetConfigList
{
    [self performSelectorInBackground:@selector(initMainPetConfigListFromFile) withObject:nil];
}

- (void)initMainPetConfigListFromFile
{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"all" ofType:@"mp"];
    NSFileHandle* fileHandle = [NSFileHandle fileHandleForReadingAtPath:path];
    NSData* numData = [fileHandle readDataOfLength:4];
    int allNum;
    [numData getBytes:&allNum];
    int dataLen = allNum * 20;
    [fileHandle seekToFileOffset:4];
    NSData* allData = [fileHandle readDataOfLength:dataLen];
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < allNum; i++) {
        int tag;
        int mainStart;
        int mainLen;
        int subStart;
        int subLen;
        
        [allData getBytes:&tag range:NSMakeRange(i * 20, 4)];
        [allData getBytes:&mainStart range:NSMakeRange(i * 20 + 4, 4)];
        [allData getBytes:&mainLen range:NSMakeRange(i * 20 + 8, 4)];
        [allData getBytes:&subStart range:NSMakeRange(i * 20 + 12, 4)];
        [allData getBytes:&subLen range:NSMakeRange(i * 20 + 16, 4)];
        
        InstanceConfig* config = [[InstanceConfig alloc] init];
        [config instanceId:tag];
        [config instanceName:@""];
        [config dataRange:NSMakeRange(mainStart + dataLen + 4, mainLen)];
        [config battleRange:NSMakeRange(subStart + dataLen + 4, subLen)];
        [array addObject:config];
        [config release];
    }
    [[Global sharedGlobal] mainPetList:array];
    [fileHandle closeFile];
}

- (void)initPetConfigList
{
    [self performSelectorInBackground:@selector(initPetConfigListFromFile) withObject:nil];
}

- (void)initPetConfigListFromFile
{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"all" ofType:@"p"];
    NSFileHandle* fileHandle = [NSFileHandle fileHandleForReadingAtPath:path];
    NSData* numData = [fileHandle readDataOfLength:4];
    int allNum;
    [numData getBytes:&allNum];
    int dataLen = allNum * 12;
    [fileHandle seekToFileOffset:4];
    NSData* allData = [fileHandle readDataOfLength:dataLen];
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < allNum; i++) {
        int tag;
        int mainStart;
        int mainLen;
        
        [allData getBytes:&tag range:NSMakeRange(i * 12, 4)];
        [allData getBytes:&mainStart range:NSMakeRange(i * 12 + 4, 4)];
        [allData getBytes:&mainLen range:NSMakeRange(i * 12 + 8, 4)];
        
        InstanceConfig* config = [[InstanceConfig alloc] init];
        [config instanceId:tag];
        [config instanceName:@""];
        [config dataRange:NSMakeRange(mainStart + dataLen + 4, mainLen)];
        [array addObject:config];
        [config release];
    }
    [[Global sharedGlobal] petList:array];
    [fileHandle closeFile];
}

- (void)initPetTemplate
{
    [self performSelectorInBackground:@selector(initPetTemplateFromFile) withObject:nil];
}

- (void)initPetTemplateFromFile
{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"pet" ofType:@"tp"];
    NSFileHandle* fileHandle = [NSFileHandle fileHandleForReadingAtPath:path];
    NSData* numData = [fileHandle readDataOfLength:4];
    int allNum;
    [numData getBytes:&allNum length:sizeof(int)];
    int dataLen = allNum * (28 * 4 + 20);
    [fileHandle seekToFileOffset:4];
    NSData* allData = [fileHandle readDataOfLength:dataLen];
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < allNum; i++) {
        int petId;
        NSString* petName;
        int petSex;
        int sysPetLV;
        int level;
        int hp;
        int mp;
        int life;
        int grow;
        int feel;
        int variationLV;
        int isVariation;
        int power;
        int agile;
        int intelligence;
        int vigour;
        int endur;
        int attack;
        int defense;
        int magicDamage;
        int magicDef;
        int attackLV;
        int defLV;
        int magicLV;
        int magicDefLV;
        int version;
        int mapId;
        int isBoss;
        int isNPC;
        int isSys;
        
        int baseLen = i * 28 * 4;
        [allData getBytes:&petId range:NSMakeRange(baseLen, 4)];
        
        NSData* petNameData = [allData subdataWithRange:NSMakeRange(baseLen + 4, 20)];
        petName = [[NSString alloc] initWithData:petNameData encoding:NSUTF8StringEncoding];
        
        [allData getBytes:&petSex range:NSMakeRange(baseLen + 24, 4)];
        [allData getBytes:&sysPetLV range:NSMakeRange(baseLen + 28, 4)];
        [allData getBytes:&level range:NSMakeRange(baseLen + 32, 4)];
        [allData getBytes:&hp range:NSMakeRange(baseLen + 36, 4)];
        [allData getBytes:&mp range:NSMakeRange(baseLen + 40, 4)];
        [allData getBytes:&life range:NSMakeRange(baseLen + 44, 4)];
        [allData getBytes:&grow range:NSMakeRange(baseLen + 48, 4)];
        [allData getBytes:&feel range:NSMakeRange(baseLen + 52, 4)];
        [allData getBytes:&variationLV range:NSMakeRange(baseLen + 56, 4)];
        [allData getBytes:&isVariation range:NSMakeRange(baseLen + 60, 4)];
        [allData getBytes:&power range:NSMakeRange(baseLen + 64, 4)];
        [allData getBytes:&agile range:NSMakeRange(baseLen + 68, 4)];
        [allData getBytes:&intelligence range:NSMakeRange(baseLen + 72, 4)];
        [allData getBytes:&vigour range:NSMakeRange(baseLen + 76, 4)];
        [allData getBytes:&endur range:NSMakeRange(baseLen + 80, 4)];
        [allData getBytes:&attack range:NSMakeRange(baseLen + 84, 4)];
        [allData getBytes:&defense range:NSMakeRange(baseLen + 88, 4)];
        [allData getBytes:&magicDamage range:NSMakeRange(baseLen + 92, 4)];
        [allData getBytes:&magicDef range:NSMakeRange(baseLen + 96, 4)];
        [allData getBytes:&attackLV range:NSMakeRange(baseLen + 100, 4)];
        [allData getBytes:&defLV range:NSMakeRange(baseLen + 104, 4)];
        [allData getBytes:&magicLV range:NSMakeRange(baseLen + 108, 4)];
        [allData getBytes:&magicDefLV range:NSMakeRange(baseLen + 112, 4)];
        [allData getBytes:&version range:NSMakeRange(baseLen + 116, 4)];
        [allData getBytes:&mapId range:NSMakeRange(baseLen + 120, 4)];
        [allData getBytes:&isBoss range:NSMakeRange(baseLen + 124, 4)];
        [allData getBytes:&isNPC range:NSMakeRange(baseLen + 128, 4)];
        [allData getBytes:&isSys range:NSMakeRange(baseLen + 132, 4)];
        
        PetData* petData = [[PetData alloc] init];
        [petData tid:petId];
        [petData nickname:petName];
        [petData sex:petSex];
        [petData sys_level:sysPetLV];
        [petData level:level];
        [petData hp:hp];
        [petData mp:mp];
        [petData life:life];
        [petData grow:grow];
        [petData feel:feel];
        [petData variation_level:variationLV];
        [petData isVariation:isVariation == 0 ? NO : YES];
        [petData power:power];
        [petData agile:agile];
        [petData intellegence:intelligence];
        [petData vigour:vigour];
        [petData endur:endur];
        [petData attack:attack];
        [petData defense:defense];
        [petData magic_damage:magicDamage];
        [petData magic_defense:magicDef];
        [petData attack_level:attackLV];
        [petData defense_level:defLV];
        [petData magic_level:magicLV];
        [petData magic_defense_level:magicDefLV];
        [petData version:version];
        [petData map_id:mapId];
        [petData is_boss:isBoss];
        [petData is_npc:isNPC];
        [petData is_system:isSys];
        
        [array addObject:petData];
        [petData release];
        [petName release];
    }
    [[Global sharedGlobal] petTemplateDataList:array];
    [fileHandle closeFile];
}

- (void)initPublicResource
{
    
}

- (void)initUserInterface
{
    
}

@end
