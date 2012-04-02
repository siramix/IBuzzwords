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

#import "Card.h"


@implementation Card

@synthesize title;

-(Card*)initWithTitle:(NSString*)theTitle
        andBadWords:(NSArray*)theBadWords
        andRWS:(int) theRWS
        andDatabaseId:(unsigned int)theDatabaseId
{
    self = [super init];    
    [self setTitle:theTitle];
    [self setBadWords:theBadWords];
    [self setRWS:theRWS];
    databaseId = theDatabaseId;
    return self;
}

-(Card*)initWithTitle:(NSString*)theTitle andBadWords:(NSArray*)theBadWords
{
    return [self initWithTitle:theTitle andBadWords:theBadWords
            andRWS:CARD_NOTSET andDatabaseId:0];
}

-(Card*)initWithTitle:(NSString *)theTitle andBadWords:(NSArray *)theBadWords 
               andRWS:(int)theRWS
{
    return [self initWithTitle:theTitle andBadWords:theBadWords andRWS:theRWS 
                 andDatabaseId:0];
}

-(id)copyWithZone:(NSZone *)zone
{
    return [[Card allocWithZone:zone]initWithTitle:self.title
                                    andBadWords:self.badWords
                                    andRWS:self.rws];
}

-(int)rws
{
    return rws;
}

-(BOOL)setRWS:(int)theRWS
{
    BOOL valid;
    if( theRWS != CARD_NOTSET ||
        theRWS != CARD_RIGHT ||
        theRWS != CARD_WRONG ||
        theRWS != CARD_SKIP )
    {
        NSLog(@"An invalid value was passed to setRWS.");
        valid = NO;
    }
    else
    {
        rws = theRWS;
        valid = YES;
    }
    return valid;
}

-(void)cycleRWS
{
    rws++;
    if( rws >= CARD_SKIP )
    {
        rws = CARD_RIGHT;
    }
}

-(BOOL)setBadWords:(NSArray *)theBadWords
{
    BOOL valid = YES;
    if( [theBadWords count] != CARD_NUM_BAD_WORDS )
    {
        NSLog(@"Bad word list of invalid length detected.");
        valid = NO;
    }
    NSData* buffer = [NSKeyedArchiver archivedDataWithRootObject:theBadWords];
    NSArray* tempBadWords = [NSKeyedUnarchiver unarchiveObjectWithData:buffer];
    badWords = tempBadWords;
    return valid;
}

-(BOOL)setBadWordsFromString:(NSString*)badWordsList
{
    NSArray* bustedString = [badWordsList componentsSeparatedByString:@","];
    return [self setBadWords:bustedString];
}

-(unsigned int)databaseId;
{
    return databaseId;
}

-(void)dealloc
{
    [title release];
    [badWords release];
    [super dealloc];
}

-(NSArray*)badWords
{
    return badWords;
}

@end
