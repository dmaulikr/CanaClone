//
//  BuildingProps.m
//  CanaClone
//
//  Created by Josh Click on 1/3/13.
//
//

#import "BuildingProps.h"


static NSString * ImgAntenna1 = @"antenna.png";
static NSString * ImgAntenna2 = @"antenna2.png";
static NSString * ImgAntenna3 = @"antenna3.png";
static NSString * ImgAntenna4 = @"antenna4.png";
static NSString * ImgAntenna5 = @"antenna5.png";
static NSString * ImgAntenna6 = @"antenna6.png";
static NSString * ImgDishes = @"dishes.png";
static NSString * ImgAC = @"ac.png";
static NSString * ImgSkyLight = @"skylight.png";
static NSString * ImgReservoir = @"reservoir.png";
static NSString * ImgPipe1 = @"pipe1.png";
static NSString * ImgPipe2 = @"pipe2.png";
static NSString * ImgEscape = @"escape.png";
static NSString * ImgAccess = @"access.png";
static NSString * ImgFence = @"fence.png";

@implementation BuildingProps


/*
- (void) reset
{
	
	//[self clear];
	int i;
	int n;
	//passed = FALSE;
	
	int wallType = [FlxU random]*4;//[walls count];
	int windowType = [FlxU random]*4;//[windows count];
	
	type = ROOF;
	int types[] = {HALLWAY, COLLAPSE, BOMB, CRANE, BILLBOARD, LEG};
	if (curIndex == nextIndex) {
		type = types[nextType];
		nextIndex += 3 + [FlxU random] * 5;
		nextType = [FlxU random] * 6;
	}
	
	
	//type = BOMB;
	//type = BILLBOARD;
	//type = CRANE;
	//type = HALLWAY;
	
	//NSLog(@"curIndex: %d", curIndex);
	
	if (curIndex == 0) {
		self.x = -4*tileSize;
		self.y = 5*tileSize;
		self.width = 60*tileSize;
		self.height = 480-5*tileSize;
		type = HALLWAY;
	} else if (curIndex == 1) {
		self.x = seq.x + seq.width + 10*tileSize;
		self.y = 15*tileSize;
		self.width = 42*tileSize;
		self.height = 480-15*tileSize;
	}
	
	int hallHeight = 0;
	if (type == HALLWAY) {
		if (player.velocity.x > 640)
			hallHeight = 7;
		else if (player.velocity.x > 480)
			hallHeight = 6;
		else if (player.velocity.x > 320)
			hallHeight = 5;
		else if(curIndex > 0)
			hallHeight = 4;
		else
			hallHeight = 3;
	}
	
	FlxTileblock * mainBlock;
	CGFloat screenTiles = ceil(FlxG.width/tileSize)+2;
	CGFloat maxGap = ((player.velocity.x*0.75)/decSize)*0.75;
	CGFloat minGap = maxGap * 0.4;
	if(minGap < 4)
		minGap = 4;
	CGFloat fg = [FlxU random];
	CGFloat gap = (CGFloat)((int)(minGap + fg*(maxGap-minGap)));
	CGFloat minW = screenTiles-gap;
	if ((minW < 15) && (player.velocity.x < player.maxVelocity.x*0.8))
		minW = 15;
	else if (minW < 6)
		minW = 6;
	CGFloat maxW = minW*2;
	CGFloat maxJ = seq.y/tileSize-2-hallHeight;
	CGFloat mpj = 6*player.jumpLimit/0.35;
	if (maxJ > mpj) maxJ = mpj;
	if (maxJ > 0) maxJ = ceil(maxJ*(1-fg));
	CGFloat maxDrop = seq.height/tileSize-4;
	if (maxDrop > 10)
		maxDrop = 10;
	if (curIndex > 1) {
		self.x = seq.x + seq.width + gap*tileSize;
		CGFloat drop = (CGFloat)((int)([FlxU random]*maxDrop-maxJ));
		if (type == HALLWAY && gap > 10) drop = 0;
		if (drop == 0)
			drop--;
		self.y = seq.y + drop*tileSize;
		self.height = 480-self.y;
		self.width = floor(minW+[FlxU random]*maxW)*tileSize;
	}
	
	// 1 - If collapsing is likely going to kill the player, just don't do it
	// 2 - Only bomb roofs that are pretty wide
	// 3 - Don't put cranes right on the very bottom, that's dumb
	
	if ((type == COLLAPSE && self.width/self.height > player.velocity.x*0.015) ||
		(type == BOMB && self.width < player.velocity.x * 1.5) ||
		(type == CRANE && (self.height < tileSize*2 || self.width < tileSize*24)) ||
		(type == LEG && self.width > tileSize*28) ){
		type = ROOF;
		nextIndex = curIndex+1;
	}
	
	//Make sure crane and billboard and leg are on the right offset
	if (type == LEG) {
		// the main collision block for this sequence
		int legWidth = 120;
		mainBlock = [FlxTileblock tileblockWithX:self.x + (self.width - legWidth)/2 y:seq.y + 3 width:legWidth+20 height:480];
		//[mBlocks addObject:mainBlock];
		[blocks add:mainBlock];
		[layer add:mainBlock];
	}
	else if ((type == CRANE) || (type == BILLBOARD)) {
		self.width = (ceil(self.width/(tileSize*2)))*tileSize*2;
		
		//Tweak the size of the billboard
		if(type == BILLBOARD)
		{
			hallHeight = (3+(int)([FlxU random]*5))*tileSize*2;
			if(self.width > hallHeight*2)
			{
				int diff = self.width - hallHeight*2;
				if(diff > 4*tileSize)
					self.x += 4*tileSize;
				else
					self.x += (self.width - hallHeight*2);
				self.width = hallHeight*2;
			}
		}
		
		// the main collision block for this sequence
		mainBlock = [FlxTileblock tileblockWithX:self.x y:self.y width:self.width+10 height:2*tileSize];
		//[mBlocks addObject:mainBlock];
		[blocks add:mainBlock];
		[layer add:mainBlock];
	}
	else {
		// the main collision block for this sequence
		mainBlock = [FlxTileblock tileblockWithX:self.x y:self.y width:self.width+10 height:self.height+2*tileSize];
		//[mBlocks addObject:mainBlock];
		[blocks add:mainBlock];
		[layer add:mainBlock];
	}
	
	//put decorations on roof
	Bomb * b;
	Leg * l;
	//FlxEmitter * f;
	//   CGFloat ah = 160;
	if (type == ROOF || type == COLLAPSE || type == BOMB || type == LEG) {
		//     if (self.y > seq.y) {
		//       FlxSprite * a = [FlxSprite spriteWithGraphic:[antennas randomObject]];
		//       a.x = self.x+tileSize;
		//       a.y = self.y-ah;
		//     }
		
		CGFloat rt = [FlxU random];
		int rw;
		int rh;
		if (rt < 0.2)
			[self decorateSeqX:self.x seqY:self.y seqWidth:self.width];
		else if (rt < 0.6) {
			//BLOCK ROOF
			int indent = 2 + [FlxU random]*((self.width/decSize)/4);
			rw = self.width/decSize - indent*2;
			rh = 1 + [FlxU random]*4;
			if (rh > 2) {
				FlxSprite * b;
				b = [[FlxSprite alloc] initWithX:self.x+indent*decSize y:self.y-rh*decSize graphic:nil];
				[b createGraphicWithWidth:rw*decSize height:(rh-1)*decSize color:0x4d4d59];
				b.enableBlend = NO;
				[backgroundRenderLayer add:b];
				[b release];
				b = [[FlxSprite alloc] initWithX:self.x+(indent+1)*decSize y:self.y-decSize graphic:nil];
				[b createGraphicWithWidth:(rw-2)*decSize height:decSize color:0x4d4d59];
				b.enableBlend = NO;
				[backgroundRenderLayer add:b];
				[b release];
			} else {
				FlxSprite * b;
				b = [[FlxSprite alloc] initWithX:self.x+indent*decSize y:self.y-rh*decSize graphic:nil];
				[b createGraphicWithWidth:rw*decSize height:rh*decSize color:0x4d4d59];
				b.enableBlend = NO;
				[backgroundRenderLayer add:b];
				[b release];
			}
			[self decorateSeqX:self.x+indent*decSize seqY:self.y-rh*decSize seqWidth:rw*decSize];
		} else {
			//SLOPE ROOF
			rh = 1 + [FlxU random]*5;
			if (self.width < 12*tileSize) rh = 1;
			Trapezoid * t;
			t = [[Trapezoid alloc] initWithX:self.x+tileSize y:self.y-rh*tileSize graphic:nil];
			[t createGraphicWithWidth:self.width-2*tileSize height:tileSize*rh color:0x4d4d59];
			t.enableBlend = NO;
			[backgroundRenderLayer add:t];
			[t release];
			[self decorateSeqX:self.x+rh*tileSize seqY:self.y-rh*tileSize seqWidth:self.width-2*(rh+1)*tileSize];
		}
		
		//Fire escapes
		if ([FlxU random] < 0.5) {
			escape.x = self.x+self.width;
			escape.y = self.y+tileSize;
			escape.width = tileSize;
			escape.height = self.height;
			[escape loadGraphic:ImgEscape];
			escape.enableBlend = NO;
			[renderLayer add:escape];
		}
		
		if (type == BOMB) {
			NSMutableArray * entry = [NSMutableArray array];
			for (i = 0; i < 6; ++i) {
				Gib * g = [Gib gib];
				[entry addObject:g];
			}
			b = [Bomb bombWithOrigin:CGPointMake(self.x+self.width/2, self.y)
							  player:player
								gibs:entry
							sequence:self];
			[layer add:b];
			for (FlxSprite * fs in entry)
				[layer add:fs];
		}
		else if (type == LEG) {
			l = [Leg legWithOrigin:CGPointMake(self.x+self.width/2, seq.y)
							player:player
						  sequence:self];
			[layerLeg add:l];
		}
		
	}
	
	//add graphics for the wall and roof
	if (type == CRANE) {
		[crane createWithX:self.x y:self.y width:self.width height:self.height player:player];
		[layer add:crane.trigger];
		[renderLayer add:crane];
	} else if (type == BILLBOARD) {
		
		[billboard createWithX:self.x y:self.y width:self.width height:self.height tileSize:tileSize hallHeight:hallHeight];
		[renderLayer add:billboard];
		
	} else {
		[building createWithX:self.x y:self.y width:self.width height:self.height
					 tileSize:tileSize
				 buildingType:type wallType:wallType windowType:windowType];
		[renderLayer add:building];
	}
	
	
	
	if (type != HALLWAY) {
		//Doves!
		if ([FlxU random] < 0.35) {
			//max width is 60*tileSize (60*16 = 960)
			//max n is (960/120)*(8) => 64
			int deviceScale;
			if(FlxG.iPad)
				deviceScale = 8;
			else if(FlxG.retinaDisplay)
				deviceScale = 6;
			else
				deviceScale = 4;
			n = (self.width/120)*(1+[FlxU random]*deviceScale);
#ifdef DOVES
			int doveHeight = self.y - 10;
			if (type == BILLBOARD)
				doveHeight -= hallHeight;
			for (i = 0; i < n; ++i) {
				Dove * dove = [doveGroup.members objectAtIndex:i];
				dove.x = self.x + ([FlxU random]*(self.width-10));
				dove.y = doveHeight;
				dove.acceleration = CGPointZero;
				dove.velocity = CGPointZero;
				dove.player = player;
				dove.trigger = self.x;
				dove.visible = YES;
				dove.exists = YES;
				dove.active = YES;
				[dove play:@"idle"];
				[foregroundLayer add:dove];
			}
			doveGroup.visibleDoves = n;
			[foregroundLayer add:doveGroup];
			//  	[foregroundLayer add:[Dove doveWithOrigin:CGPointMake(self.x+([FlxU random]*(self.width-10)), doveHeight)
			// 				   player:player
			// 				   trigger:self.x]];
#endif
		}
	}
	
	if (type == BOMB) {
		bombAndLegEmitter.x = self.x+self.width/2 - tileSize*2;
		bombAndLegEmitter.y = self.y;
		bombAndLegEmitter.width = tileSize*4;
		bombAndLegEmitter.height = 0;
		bombAndLegEmitter.minRotation = 0;
		bombAndLegEmitter.maxRotation = 0;
		[bombAndLegEmitter kill];
		[b add:bombAndLegEmitter];
		[foregroundLayer add:bombAndLegEmitter];
	}
	else if(type == LEG) {
		bombAndLegEmitter.x = self.x+50;
		bombAndLegEmitter.y = self.y;
		bombAndLegEmitter.width = self.width-100;
		bombAndLegEmitter.height = self.height;
		bombAndLegEmitter.minRotation = -720;
		bombAndLegEmitter.maxRotation = 720;
		
		[bombAndLegEmitter kill];
		[l add:bombAndLegEmitter];
		[layerLeg add:bombAndLegEmitter];
	}
	else if (type == COLLAPSE) {
		
		DemoMgr * dm = [DemoMgr demoMgrWithX:self.x player:player children:layer.members];
		//need to add in renderLayer members also?
		for (FlxObject * o in renderLayer.members)
			[dm add:o];
		//are doves added to this?
		for (FlxObject * o in backgroundRenderLayer.members)
			[dm add:o];
		
		collapseEmitter.x = self.x;
		collapseEmitter.y = self.y;
		collapseEmitter.width = self.width;
		if (FlxG.iPhone3G || FlxG.iPhone1G || FlxG.iPodTouch1G)
			collapseEmitter.height = 40;
		else
			collapseEmitter.height = self.height;
		//reset the emitter
		[collapseEmitter kill];
		
		[foregroundLayer add:collapseEmitter];
		[dm add:collapseEmitter];
		
		[layer add:dm];
	} else if (type == ROOF && curIndex > 1) {
		//normal rooftops should sometimes get some obstacles if you're not going too fast
		for (i = 0; i < 3; ++i)
			if ([FlxU random] < 0.15)
				[foregroundLayer add:[Obstacle obstacleWithOrigin:CGPointMake(self.x+self.width/8+[FlxU random]*(self.width/2), self.y)
														   player:player
															  alt:YES]];
	}
	
	//Hallways get a lot of special treatment - special obstacles, doors, windows, etc
	if (type == HALLWAY) {
		hallHeight *= tileSize;
		//[mBlocks addObject:[FlxTileblock tileblockWithX:self.x y:-128 width:self.width height:self.y-hallHeight+128]];
		[blocks add:[FlxTileblock tileblockWithX:self.x y:-128 width:self.width height:self.y-hallHeight+128]];
		
		[hall createWithX:self.x y:self.y width:self.width height:self.height
				 tileSize:tileSize hallHeight:hallHeight wallType:wallType windowType:windowType];
		[renderLayer add:hall];
		
		[foregroundLayer add:[Window windowAtPoint:CGPointMake(self.x+self.width-WindowW-1, self.y)
											height:hallHeight
											 group:foregroundLayer
											player:player
											shards:shardsA]];
		[foregroundLayer add:[Window windowAtPoint:CGPointMake(self.x+1,self.y)
											height:hallHeight
											 group:foregroundLayer
											player:player
											shards:shardsB]];
		
		if (curIndex == 0) {
			//put a couple of obstacles in the launch hallway
			[foregroundLayer add:[Obstacle obstacleWithOrigin:CGPointMake(32*tileSize,self.y) player:player]];
			[foregroundLayer add:[Obstacle obstacleWithOrigin:CGPointMake(48*tileSize,self.y) player:player]];
		} else {
			//throw in a few obstacles here and there
			for (i = 0; i < 3; ++i)
				if ([FlxU random] < 0.65)
					[foregroundLayer add:[Obstacle obstacleWithOrigin:CGPointMake(self.x+self.width/8+[FlxU random]*(self.width/2),self.y) player:player]];
		}
	}
	
	//Estimate out basic sequence changes due to the collapsing building's height change
	if (type == COLLAPSE) {
		int cd = (self.width/tileSize)*0.5;
		if (cd > self.height/tileSize-1)
			cd = self.height/tileSize-1;
		self.height -= cd*tileSize;
		self.y += cd*tileSize;
	}
	
	curIndex++;
	
	
	//   //how big is render layer?
	//   float minX = FLT_MAX;
	//   float minY = FLT_MAX;
	//   float maxX = FLT_MIN;
	//   float maxY = FLT_MIN;
	
	//   for (FlxObject * ro in renderLayer.members) {
	//     if (ro.x < minX)
	//       minX = ro.x;
	//     if (ro.y < minY)
	//       minY = ro.y;
	//     if (ro.x+ro.width > maxX)
	//       maxX = ro.x + ro.width;
	//     if (ro.y+ro.height > maxY)
	//       maxY = ro.y+ro.height;
	//   }
	
	//   fprintf(stderr, "\n\n\n");
	//   NSLog(@"renderLayer rect: (%f,%f,%f,%f)", minX, minY, maxX-minX, maxY-minY);
	//   fprintf(stderr, "\n\n\n");
	
	//   [renderTexture prerenderToTexture:renderLayer];
	//   [backgroundRenderTexture prerenderToTexture:backgroundRenderLayer];
	
	
}

- (void) decorateSeqX:(CGFloat)seqX seqY:(CGFloat)seqY seqWidth:(CGFloat)seqWidth
{
	int i;
	int n;
	int s;
	
	s = 40;
	n = seqWidth/s;
	for (i = 0; i < n; ++i)
		if (arc4random() < 0.3)
			[backgroundRenderLayer add:[FlxSprite spriteWithX:seqX+decSize+s*i y:seqY-decSize graphic:ImgAC]];
	
	int ah = 160;
	
	if ([FlxU random] < 0.5) {
		//pipes roof
		s = 120;
		n = (seqWidth-100) / s; //subtract 100 so that it doesn't go off the edge
		for (i = 0; i < n; ++i)
			if ([FlxU random] < 0.35) {
				//add 3 parts of the pipe...
				[backgroundRenderLayer add:[FlxSprite spriteWithX:seqX+decSize+s+i y:seqY-decSize graphic:ImgPipe1Left]];
				[backgroundRenderLayer add:[FlxSprite spriteWithX:seqX+decSize+s+i+100-12 y:seqY-decSize graphic:ImgPipe1Right]];
				FlxSprite * pipe = [FlxSprite spriteWithX:seqX+decSize+s+i+13 y:seqY-decSize graphic:nil];
				[pipe createGraphicWithWidth:100-12-13 height:8 color:0x4d4d59];
				[backgroundRenderLayer add:pipe];
				//[backgroundRenderLayer add:[FlxSprite spriteWithX:seqX+decSize+s*i y:seqY-decSize graphic:ImgPipe1]];
			}
		s = 80;
		n = (seqWidth-40) / s; // subtract 40 so that it doesn't hang over the edge
		for (i = 0; i < n; ++i)
			if ([FlxU random] < 0.35) {
				[backgroundRenderLayer add:[FlxSprite spriteWithX:seqX+decSize+s*i+2 y:seqY-decSize*2+5 graphic:ImgPipe2Left]];
				[backgroundRenderLayer add:[FlxSprite spriteWithX:seqX+decSize+s*i+2+15 y:seqY-decSize*2+4 graphic:ImgPipe2Middle]];
				[backgroundRenderLayer add:[FlxSprite spriteWithX:seqX+decSize+s*i+2+15+10 y:seqY-decSize*2+5 graphic:ImgPipe2Right]];
			}
		
		if ([FlxU random] < 0.5) {
			s = 40;
			n = (seqWidth-32)/s;
			for (i = 0; i < n; ++i)
				if ([FlxU random] < 0.3) {
					switch ((int)([FlxU random]*7)) {
						case 0:
							[backgroundRenderLayer add:[FlxSprite spriteWithX:seqX+decSize+s*i y:seqY-ah graphic:ImgAntenna1Left]];
							[backgroundRenderLayer add:[FlxSprite spriteWithX:seqX+decSize+s*i+18 y:seqY-ah+160-19 graphic:ImgAntenna1Right]];
							break;
						case 1:
							[backgroundRenderLayer add:[FlxSprite spriteWithX:seqX+decSize+s*i+3 y:seqY-ah graphic:ImgAntenna2Trimmed]];
							break;
						case 2:
							[backgroundRenderLayer add:[FlxSprite spriteWithX:seqX+decSize+s*i y:seqY-ah graphic:ImgAntenna3Trimmed]];
							break;
						case 3:
							[backgroundRenderLayer add:[FlxSprite spriteWithX:seqX+decSize+s*i y:seqY-ah+40 graphic:ImgAntenna4Trimmed]];
							break;
						case 4:
							[backgroundRenderLayer add:[FlxSprite spriteWithX:seqX+decSize+s*i+(40-16)/2 y:seqY-ah+40 graphic:ImgAntenna5Trimmed]];
							break;
						case 5:
							[backgroundRenderLayer add:[FlxSprite spriteWithX:seqX+decSize+s*i+6 y:seqY-ah+4 graphic:ImgAntenna6Trimmed]];
							break;
						case 6:
							[backgroundRenderLayer add:[FlxSprite spriteWithX:seqX+decSize+s*i+1 y:seqY-ah graphic:ImgDishesTrimmed]];
							break;
					}
				}
		}
	} else {
		//Skylights, roof access + reservoirs
		s = 140;
		n = seqWidth / s;
		for(i = 0; i < n; ++i)
			if([FlxU random] < 0.5)
				[backgroundRenderLayer add:[FlxSprite spriteWithX:seqX+decSize+s*i y:seqY-decSize+1 graphic:ImgSkyLight]];
		s = 200;
		n = seqWidth / s;
		for(i = 0; i < n; ++i)
			if([FlxU random] < 0.25)
				[backgroundRenderLayer add:[FlxSprite spriteWithX:seqX+decSize+s*i y:seqY-30 graphic:ImgAccess]];
		s = 200;
		n = seqWidth / s;
		for(i = 0; i < n; ++i)
			if([FlxU random] < 0.5)
				[backgroundRenderLayer add:[FlxSprite spriteWithX:seqX+decSize+s*i+2 y:seqY-decSize*6 graphic:ImgReservoir]];
    }
	
	if([FlxU random] < 0.4) {
		//Add chainlink fences
		n = seqWidth/(tileSize*2)-2;
		fence.x = seqX+tileSize*2;
		fence.y = seqY-tileSize*2+(32-19);
		fence.width = n*tileSize*2;
		fence.height = tileSize*2;
		[fence loadGraphic:ImgFence];
		[backgroundRenderLayer add:fence];
	}
}*/


@end
