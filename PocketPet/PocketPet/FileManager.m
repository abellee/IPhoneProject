//
//  FileManager.m
//  PocketPet
//
//  Created by Lee Abel on 13-4-26.
//
//

#import "FileManager.h"
#import "Utils.h"
#import "InstanceImages.h"
#import "InstanceConfig.h"
#import "SystemConfig.h"

@implementation FileManager

@synthesize delegate;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)init
{
    if (self = [super init]) {
        writeList = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}

- (void)writeData:(NSString *)str andPath:(NSString *)path
{
    if (isWriting) {
        [writeList addObject:[NSArray arrayWithObjects:str, path, nil]];
        return;
    }
    isWriting = YES;
    [self performSelectorInBackground:@selector(writeDataInBackground:) withObject:[NSArray arrayWithObjects:str, path, nil]];
}

- (void)checkWriteList
{
    if ([writeList count]) {
        NSArray* arr = [[writeList objectAtIndex:0] retain];
        [writeList removeObjectAtIndex:0];
        isWriting = YES;
        [self writeDataInBackground:arr];
        [arr release];
    }else{
        if (delegate && [delegate respondsToSelector:@selector(writeDataComplete)]) {
            [delegate performSelector:@selector(writeDataComplete)];
        }
    }
}

- (void)writeDataInBackground:(NSArray*)data
{
    NSString* str = [data objectAtIndex:0];
    NSString* path = [data objectAtIndex:1];
    NSData* content = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        NSFileHandle* fileHandler = [NSFileHandle fileHandleForWritingAtPath:path];
        [fileHandler seekToEndOfFile];
        [fileHandler writeData:content];
        [fileHandler closeFile];
    }else{
        [fileManager createFileAtPath:path contents:content attributes:nil];
    }
    isWriting = NO;
    [self checkWriteList];
}

- (void)deleteFile:(NSString *)path
{
    NSFileManager* fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:path error:nil];
}

- (NSData*)readData:(NSString *)path
{
    NSData* data = [NSData dataWithContentsOfFile:path];
    return data;
}

- (BOOL)folderExist:(NSString *)path
{
    NSFileManager* fileManager = [NSFileManager defaultManager];
    BOOL isDir = YES;
    return [fileManager fileExistsAtPath:path isDirectory:&isDir];
}

- (BOOL)createFolder:(NSString *)dir
{
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSError* error;
    return [fileManager createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:&error];
}

- (void)writeUserLog:(NSString *)str
{
    NSString* folderPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"ulogs"];
    if (![self folderExist:folderPath]) {
        [self createFolder:folderPath];
    }
    NSString* fileName = [Utils yearMonthDayStr];
    NSString* tempPath = [folderPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.ulog", fileName]];
    int num = [self sizeIsValid:tempPath andFolder:folderPath];
    if (num == 0) {
        [self writeData:str andPath:tempPath];
    }else{
        [self writeData:str andPath:[folderPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@-%d.ulog", fileName, num]]];
    }
}

- (NSMutableArray*)getUserLog
{
    NSMutableArray* arr = [NSMutableArray arrayWithCapacity:0];
    NSString* folderPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"ulogs"];
    if ([self folderExist:folderPath]) {
        NSFileManager* fileManager = [NSFileManager defaultManager];
        NSArray* files = [fileManager subpathsAtPath:folderPath];
        for (NSString* fileName in files) {
            if ([[fileName pathExtension] isEqualToString:@"ulog"]) {
                NSString* filePath = [folderPath stringByAppendingPathComponent:fileName];
                NSData* data = [self readData:filePath];
                NSString* str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                NSMutableDictionary* dict = [NSMutableDictionary dictionaryWithCapacity:0];
                [dict setObject:filePath forKey:kFilePath];
                [dict setObject:str forKey:kFileData];
                [arr addObject:dict];
                [str release];
            }
        }
    }
    return arr;
}

- (int)sizeIsValid:(NSString*)path andFolder:(NSString*)folderPath
{
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSDictionary* dict = [fileManager attributesOfItemAtPath:path error:nil];
    if ([[dict objectForKey:NSFileSize] intValue] < 20) {
        return 0;
    }
    NSArray* files = [fileManager subpathsAtPath:folderPath];
    return [files count];
}

- (void)getInstanceImagesByInstanceConfig:(InstanceConfig *)config
{
    [self performSelectorInBackground:@selector(getInstanceImagesInBackground:) withObject:config];
}

- (void)getInstanceImagesInBackground:(InstanceConfig *)config
{
    NSString* filePath = [[NSBundle mainBundle] pathForResource:ALL_FB ofType:@"fb"];
    NSFileHandle* fileHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    [fileHandle seekToFileOffset:config.dataRange.location];
    NSData* defaultData = [fileHandle readDataOfLength:config.dataRange.length];
    [fileHandle seekToFileOffset:config.battleRange.location];
    NSData* battleData = [fileHandle readDataOfLength:config.battleRange.length];

    UIImage* defaultImage = [UIImage imageWithData:defaultData];
    UIImage* battleImage = [UIImage imageWithData:battleData];
    
    InstanceImages* instanceImages = [[[InstanceImages alloc] init] autorelease];
    [instanceImages instanceId:config.instanceId];
    [instanceImages firstImageData:defaultImage];
    [instanceImages secondImageData:battleImage];
    
    [fileHandle closeFile];
    [self performSelectorOnMainThread:@selector(getInstanceImagesComplete:) withObject:instanceImages waitUntilDone:YES];
}

- (void)getInstanceImagesComplete:(InstanceImages*)instanceImages
{
    if (delegate && [delegate respondsToSelector:@selector(getInstanceImageComplete:)]) {
        [delegate performSelector:@selector(getInstanceImageComplete:) withObject:instanceImages];
    }
}

//主宠
- (void)getMainPetImagesByPetConfigs:(NSMutableArray *)configList
{
    [self performSelectorInBackground:@selector(getMainPetImagesInBackground:) withObject:configList];
}

- (void)getMainPetImagesInBackground:(NSMutableArray*)configList
{
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:0];
    NSString* filePath = [[NSBundle mainBundle] pathForResource:ALL_MAIN_PET ofType:@"mp"];
    NSFileHandle* fileHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    for (int i = 0; i < configList.count; i++) {
        InstanceConfig* config = [configList objectAtIndex:i];
        [fileHandle seekToFileOffset:config.dataRange.location];
        NSData* defaultData = [fileHandle readDataOfLength:config.dataRange.length];
        [fileHandle seekToFileOffset:config.battleRange.location];
        NSData* battleData = [fileHandle readDataOfLength:config.battleRange.length];
        
        UIImage* defaultImage = [UIImage imageWithData:defaultData];
        UIImage* battleImage = [UIImage imageWithData:battleData];
        
        InstanceImages* petImages = [[InstanceImages alloc] init];
        [petImages instanceId:config.instanceId];
        [petImages firstImageData:defaultImage];
        [petImages secondImageData:battleImage];
        
        [array addObject:petImages];
        [petImages release];
    }
    [fileHandle closeFile];
    [self performSelectorOnMainThread:@selector(getMainPetImagesComplete:) withObject:array waitUntilDone:YES];
}

- (void)getMainPetImagesComplete:(NSMutableArray*)array
{
    if (delegate && [delegate respondsToSelector:@selector(getMainPetImagesComplete:)]) {
        [delegate performSelector:@selector(getMainPetImagesComplete:) withObject:array];
    }
}

//宠物
- (void)getPetImagesByPetConfigs:(NSMutableArray *)configList
{
    [self performSelectorInBackground:@selector(getPetImagesInBackground:) withObject:configList];
}

- (void)getPetImagesInBackground:(NSMutableArray*)configList
{
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:0];
    NSString* filePath = [[NSBundle mainBundle] pathForResource:ALL_PET ofType:@"p"];
    NSFileHandle* fileHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    for (int i = 0; i < configList.count; i++) {
        InstanceConfig* config = [configList objectAtIndex:i];
        [fileHandle seekToFileOffset:config.dataRange.location];
        NSData* defaultData = [fileHandle readDataOfLength:config.dataRange.length];
        
        UIImage* defaultImage = [UIImage imageWithData:defaultData];
        
        InstanceImages* petImages = [[InstanceImages alloc] init];
        [petImages instanceId:config.instanceId];
        [petImages firstImageData:defaultImage];
        
        [array addObject:petImages];
        [petImages release];
    }
    [fileHandle closeFile];
    [self performSelectorOnMainThread:@selector(getPetImagesComplete:) withObject:array waitUntilDone:YES];
}

- (void)getPetImagesComplete:(NSMutableArray*)array
{
    if (delegate && [delegate respondsToSelector:@selector(getPetImagesComplete:)]) {
        [delegate performSelector:@selector(getPetImagesComplete:) withObject:array];
    }
}

@end
