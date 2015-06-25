//
//  main.mm
//  HelpScoutTest
//
//  Created by David on 6/25/15.
//  Copyright (c) 2015 d2. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <string>

//V.1 (Pure C)
bool c_startsWithUpperCaseLetter(const char *s);

//V.2 (C++)
bool cpp_startsWithUpperCaseLetter(std::string s);

//V.3 (Obj-C)
BOOL objc_startsWithUpperCaseLetter(NSString *string);

//V.4 (Obj-C)
BOOL objc2_startsWithUpperCaseLetter(NSString *string);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
      NSString *testStr = @"-A";
        //C
        bool result = c_startsWithUpperCaseLetter([testStr UTF8String]);
        NSLog(@"Belong to [A-Z] (C):%i",result);
        result = 0;
        
        //C++
        std::string str([testStr UTF8String]);
        result = cpp_startsWithUpperCaseLetter(str);
        NSLog(@"Belong to [A-Z] (C++):%i",result);
        result = 0;
        
        //Obj-C v1
        result = objc_startsWithUpperCaseLetter(testStr);
        NSLog(@"Belong to [A-Z] (Obj-C v1):%i",result);
        result = 0;
        
         //Obj-C v2
        result = objc2_startsWithUpperCaseLetter(testStr);
        NSLog(@"Belong to [A-Z] (Obj-C v2):%i",result);
    }
    return 0;
}

bool c_startsWithUpperCaseLetter(const char *s)
{
    char ch = s[0];
    if(isupper(ch))
        return true;
    else
        return false;
}

bool cpp_startsWithUpperCaseLetter(std::string s)
{
    if(!s.empty() && (std::isalpha(s[0])))
        return true;
    else
        return false;
}

BOOL objc_startsWithUpperCaseLetter(NSString *string)
{
    if(string && string.length) {
    NSString *firstLatter = [string substringToIndex:1];
    return ([firstLatter rangeOfCharacterFromSet:[NSMutableCharacterSet uppercaseLetterCharacterSet]].location != NSNotFound);
    } else
        return NO;
}

BOOL objc2_startsWithUpperCaseLetter(NSString *string)
{
     if(string && string.length) {
         unichar firstChar = [string characterAtIndex:0];
         //Uppercase letters in ASCII/Unicode table are in the range of 65 - 90
         return (firstChar >= 65 && firstChar < 91);
     } else
         return NO;
}