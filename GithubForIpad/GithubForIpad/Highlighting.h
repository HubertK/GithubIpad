//
//  Highlighting.h
//  GithubForIpad
//
//  Created by Helene Brooks on 11/23/11.
//  Copyright (c) 2011 vaughn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Highlighting : NSObject
+ (UIColor *)getColorFor:(NSString*)theString;
+ (NSString *)checkString:(NSString*)astring;
@end
