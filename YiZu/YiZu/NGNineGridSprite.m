//
//  NGNineGridSprite.m
//  Created by Nick Gravelyn
//
//  Distributed under terms of MIT License:
//  http://www.opensource.org/licenses/mit-license.php
//

#import "NGNineGridSprite.h"

@interface NGNineGridSprite ()
{
    CGSize _contentSize;
    CGSize _cornerSize;
    
    CCSprite *corners[4];
    CCSprite *horizontalEdges[2];
    CCSprite *verticalEdges[2];
    CCSprite *center;
}
- (void)updateChildScales;
- (void)updateChildPositions;
@end

@implementation NGNineGridSprite

- (id)initWithSpriteFrame:(CCSpriteFrame *)frame andCornerSize:(CGSize)cornerSize
{
    if (self = [super init])
    {
        _contentSize = CGSizeMake(0, 0);
        _cornerSize = cornerSize;
        
        // we're going to put all the pieces into a batch node so all 9 pieces are drawn at once
        CCSpriteBatchNode *batchNode = [CCSpriteBatchNode batchNodeWithTexture:frame.texture capacity:9];
        [self addChild:batchNode];
        
        // temporary rect variable used all over during construction
        CGRect tempRect;
        
        // create the four corner sprites
        tempRect = CGRectMake(frame.rect.origin.x, frame.rect.origin.y, cornerSize.width, cornerSize.height);
        corners[0] = [CCSprite spriteWithTexture:frame.texture rect:tempRect];
        corners[0].anchorPoint = ccp(0, 1);
        corners[0].position = ccp(0, frame.rect.size.height);
        [batchNode addChild:corners[0]];
        
        tempRect.origin = CGPointMake(frame.rect.origin.x + frame.rect.size.width - cornerSize.width, 
                                      frame.rect.origin.y);
        corners[1] = [CCSprite spriteWithTexture:frame.texture rect:tempRect];
        corners[1].anchorPoint = ccp(1, 1);
        corners[1].position = ccp(frame.rect.size.width, frame.rect.size.height);
        [batchNode addChild:corners[1]];
        
        tempRect.origin = CGPointMake(frame.rect.origin.x, 
                                      frame.rect.origin.y + frame.rect.size.height - cornerSize.height);
        corners[2] = [CCSprite spriteWithTexture:frame.texture rect:tempRect];
        corners[2].anchorPoint = ccp(0, 0);
        corners[2].position = ccp(0, 0);
        [batchNode addChild:corners[2]];
        
        tempRect.origin = CGPointMake(frame.rect.origin.x + frame.rect.size.width - cornerSize.width, 
                                      frame.rect.origin.y + frame.rect.size.height - cornerSize.height);
        corners[3] = [CCSprite spriteWithTexture:frame.texture rect:tempRect];
        corners[3].anchorPoint = ccp(1, 0);
        corners[3].position = ccp(frame.rect.size.width, 0);
        [batchNode addChild:corners[3]];
        
        // create the horizontal edges
        tempRect = CGRectMake(frame.rect.origin.x + cornerSize.width, frame.rect.origin.y,
                              frame.rect.size.width - (cornerSize.width * 2), cornerSize.height);
        horizontalEdges[0] = [CCSprite spriteWithTexture:frame.texture rect:tempRect];
        horizontalEdges[0].anchorPoint = ccp(0, 1);
        horizontalEdges[0].position = ccp(cornerSize.width, frame.rect.size.height);
        [batchNode addChild:horizontalEdges[0]];
        
        tempRect.origin = CGPointMake(frame.rect.origin.x + cornerSize.width, frame.rect.origin.y + frame.rect.size.height - cornerSize.height);
        horizontalEdges[1] = [CCSprite spriteWithTexture:frame.texture rect:tempRect];
        horizontalEdges[1].anchorPoint = ccp(0, 0);
        horizontalEdges[1].position = ccp(cornerSize.width, 0);
        [batchNode addChild:horizontalEdges[1]];
        
        // create the vertical edges
        tempRect = CGRectMake(frame.rect.origin.x, frame.rect.origin.y + cornerSize.height,
                              cornerSize.width, frame.rect.size.height - (cornerSize.height * 2));
        verticalEdges[0] = [CCSprite spriteWithTexture:frame.texture rect:tempRect];
        verticalEdges[0].anchorPoint = ccp(0, 0);
        verticalEdges[0].position = ccp(0, cornerSize.height);
        [batchNode addChild:verticalEdges[0]];
        
        tempRect.origin = CGPointMake(frame.rect.origin.x + frame.rect.size.width - cornerSize.width, frame.rect.origin.y + cornerSize.height);
        verticalEdges[1] = [CCSprite spriteWithTexture:frame.texture rect:tempRect];
        verticalEdges[1].anchorPoint = ccp(1, 0);
        verticalEdges[1].position = ccp(frame.rect.size.width, cornerSize.height);
        [batchNode addChild:verticalEdges[1]];
        
        // create the center
        tempRect = CGRectMake(frame.rect.origin.x + cornerSize.width, frame.rect.origin.y + cornerSize.height,
                              frame.rect.size.width - (cornerSize.width * 2), frame.rect.size.height - (cornerSize.height * 2));
        center = [CCSprite spriteWithTexture:frame.texture rect:tempRect];
        center.anchorPoint = ccp(0, 0);
        center.position = ccp(cornerSize.width, cornerSize.height);
        [batchNode addChild:center];
        
        // set up default size which handles all scaling and positioning of the sprites
        self.contentSize = frame.rect.size;
    }
    return self;
}

- (void)setContentSize:(CGSize)contentSize
{
    // always maintain integer size
    contentSize.width = roundf(contentSize.width);
    contentSize.height = roundf(contentSize.height);
    
    // if the content size is different, store it and update both scale and position of children
    if (_contentSize.width != contentSize.width || _contentSize.height != contentSize.height)
    {
        _contentSize = contentSize;
        [self updateChildScales];
        [self updateChildPositions];
    }
}

- (CGSize)contentSize
{
    return _contentSize;
}

- (void)setAnchorPoint:(CGPoint)anchorPoint
{
    // get the old anchor point
    CGPoint oldAnchorPoint = self.anchorPoint;
    
    // if anchor point changed, store it and update position of children
    if (oldAnchorPoint.x != anchorPoint.x || oldAnchorPoint.y != anchorPoint.y)
    {
        [super setAnchorPoint:anchorPoint];
        [self updateChildPositions];
    }
}

- (void)updateChildScales
{
    // adjust the width to account for corners
    int adjustedWidth = _contentSize.width - (_cornerSize.width * 2);
    
    // adjust the X scale of the horizontal edges and center
    horizontalEdges[0].scaleX = adjustedWidth / horizontalEdges[0].contentSize.width;
    horizontalEdges[1].scaleX = adjustedWidth / horizontalEdges[1].contentSize.width;
    center.scaleX = adjustedWidth / center.contentSize.width;
    
    
    // adjust the height to account for corners
    int adjustedHeight = _contentSize.height - (_cornerSize.height * 2);
    
    // adjust the Y scale of the vertical edges and center
    verticalEdges[0].scaleY = adjustedHeight / verticalEdges[0].contentSize.height;
    verticalEdges[1].scaleY = adjustedHeight / verticalEdges[1].contentSize.height;
    center.scaleY = adjustedHeight / center.contentSize.height;
}

- (void)updateChildPositions
{
    // use the anchor to adjust all positions
    CGPoint anchorShift = CGPointMake(-self.anchorPoint.x * _contentSize.width, -self.anchorPoint.y * _contentSize.height);
    
    // update all the corners
    corners[0].position = ccpAdd(ccp(0, _contentSize.height), anchorShift);
    corners[1].position = ccpAdd(ccp(_contentSize.width, _contentSize.height), anchorShift);
    corners[2].position = ccpAdd(ccp(0, 0), anchorShift);
    corners[3].position = ccpAdd(ccp(_contentSize.width, 0), anchorShift);
    
    // update the horizontal edges
    horizontalEdges[0].position = ccpAdd(ccp(_cornerSize.width, _contentSize.height), anchorShift);
    horizontalEdges[1].position = ccpAdd(ccp(_cornerSize.width, 0), anchorShift);
    
    // update the vertical edges
    verticalEdges[0].position = ccpAdd(ccp(0, _cornerSize.height), anchorShift);
    verticalEdges[1].position = ccpAdd(ccp(_contentSize.width, _cornerSize.height), anchorShift);
    
    // update the center
    center.position = ccpAdd(ccp(_cornerSize.width, _cornerSize.height), anchorShift);
}

+ (NGNineGridSprite *)spriteWithSpriteFrame:(CCSpriteFrame *)frame andCornerSize:(CGSize)cornerSize
{
    return [[[NGNineGridSprite alloc] initWithSpriteFrame:frame andCornerSize:cornerSize] autorelease];
}

@end
