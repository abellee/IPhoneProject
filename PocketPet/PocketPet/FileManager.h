//
//  FileManager.h
//  PocketPet
//
//  Created by Lee Abel on 13-4-26.
//
//

#import <Foundation/Foundation.h>
#import "FileManagerDelegate.h"

#define kFilePath @"filePath"
#define kFileData @"fileData"

@interface FileManager : NSObject
{
    NSMutableArray* writeList;
    BOOL isWriting;
}

@property (nonatomic, assign, getter = delegate, setter = delegate:) id<FileManagerDelegate> delegate;

- (void)writeData:(NSString*)str andPath:(NSString*)path;
- (void)deleteFile:(NSString*)path;
- (NSData*)readData:(NSString*)path;
- (BOOL)folderExist:(NSString*)path;
- (BOOL)createFolder:(NSString*)dir;
- (void)writeUserLog:(NSString*)str;
- (NSMutableArray*)getUserLog;

@end
