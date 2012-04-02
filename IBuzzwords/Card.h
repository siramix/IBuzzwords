/*****************************************************************************
 *  Buzzwords is a family friendly word game for mobile phones.
 *  Copyright (C) 2011 Siramix Team
 *  
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 ****************************************************************************/

#import <Foundation/Foundation.h>

// Constants regarding card state
#define CARD_NOTSET -1
#define CARD_RIGHT   0
#define CARD_WRONG   1
#define CARD_SKIP    2

// Constants regarding number of bad words
#define CARD_NUM_BAD_WORDS 5

@interface Card : NSObject<NSCopying> {
    NSString*    title;
    NSArray*     badWords;
    int          rws;
    unsigned int databaseId;
}

@property( copy, nonatomic ) NSString* title;

-(Card*)initWithTitle:(NSString*)theTitle 
                andBadWords:(NSArray*)theBadWords
                andRWS:(int)theRWS
                andDatabaseId:(unsigned int)theDatabaseId;
-(Card*)initWithTitle:(NSString*)theTitle
                andBadWords:(NSArray*)theBadWords
                andRWS:(int)theRWS;
-(Card*)initWithTitle:(NSString*)theTitle andBadWords:(NSArray*)theBadWords;
-(id)copyWithZone:(NSZone *)zone;
-(void)dealloc;
-(unsigned int)databaseId;
-(int)rws;
-(BOOL)setRWS:(int)theRWS;
-(void)cycleRWS;
-(BOOL)setBadWords:(NSArray*)theBadWords;
-(BOOL)setBadWordsFromString:(NSString*)badWordsList;
-(NSArray*)badWords;

@end
