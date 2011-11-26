//
//  Highlighting.m
//  GithubForIpad
//
//  Created by Helene Brooks on 11/23/11.
//  Copyright (c) 2011 vaughn. All rights reserved.
//

#import "Highlighting.h"

@implementation Highlighting

+ (NSString *)getRangeFor:(NSString *)theString{
    
    NSArray *array1 = [[NSArray alloc]initWithObjects:@"if", "return", "while", "case", "continue", "default","do", "else", "for", "switch", "goto", nil];
    
    NSArray *array2 = [[NSArray alloc]initWithObjects:@"NULL", "false", "break", "true", "enum", "nil", "Nil", "errno", "EDOM","ERANGE", "FLT_RADIX", "FLT_ROUNDS", "FLT_DIG", "DBL_DIG", "LDBL_DIG","FLT_EPSILON", "DBL_EPSILON", "LDBL_EPSILON", "FLT_MANT_DIG", "DBL_MANT_DIG","LDBL_MANT_DIG", "FLT_MAX", "DBL_MAX", "LDBL_MAX", "FLT_MAX_EXP", "DBL_MAX_EXP","LDBL_MAX_EXP", "FLT_MIN", "DBL_MIN", "LDBL_MIN", "FLT_MIN_EXP", "DBL_MIN_EXP","LDBL_MIN_EXP", "CHAR_BIT", "CHAR_MAX", "CHAR_MIN", "SCHAR_MAX", "SCHAR_MIN","UCHAR_MAX", "SHRT_MAX", "SHRT_MIN", "USHRT_MAX", "INT_MAX", "INT_MIN","UINT_MAX", "LONG_MAX", "LONG_MIN", "ULONG_MAX", "HUGE_VAL", "SIGABRT","SIGFPE", "SIGILL", "SIGINT", "SIGSEGV", "SIGTERM", "SIG_DFL", "SIG_ERR","SIG_IGN", "BUFSIZ", "EOF", "FILENAME_MAX", "FOPEN_MAX", "L_tmpnam", "NULL","SEEK_CUR", "SEEK_END", "SEEK_SET", "TMP_MAX", "stdin", "stdout", "stderr","EXIT_FAILURE", "EXIT_SUCCESS", "RAND_MAX", "CLOCKS_PER_SEC", nil];
    
    NSArray *array3 = [[NSArray alloc]initWithObjects:@"printf", "fprintf", "snprintf", "sprintf", "assert","isalnum", "isalpha", "isdigit", "iscntrl", "isgraph", "islower", "isprint","ispunct", "isspace", "ispunct", "isupper", "isxdigit", "tolower", "toupper","exp", "log", "log10", "pow", "sqrt", "ceil", "floor", "fabs", "ldexp","frexp", "modf", "fmod", "sin", "cos", "tan", "asin", "acos", "atan", "atan2","sinh", "cosh", "tanh", "setjmp", "longjmp", "asin", "acos", "atan", "atan2","va_start", "va_arg", "va_end", "offsetof", "sizeof", "fopen", "freopen","fflush", "fclose", "remove", "rename", "tmpfile", "tmpname", "setvbuf","setbuf", "vfprintf", "vprintf", "vsprintf", "fscanf", "scanf", "sscanf","fgetc", "fgets", "fputc", "fputs", "getc", "getchar", "gets", "putc","putchar", "puts", "ungetc", "fread", "fwrite", "fseek", "ftell", "rewind","fgetpos", "fsetpos", "clearerr", "feof", "ferror", "perror", "abs", "labs","div", "ldiv", "atof", "atoi", "atol", "strtod", "strtol", "strtoul", "calloc","malloc", "realloc", "free", "abort", "exit", "atexit", "system", "getenv","bsearch", "qsort", "rand", "srand", "strcpy", "strncpy", "strcat", "strncat","strcmp", "strncmp", "strcoll", "strchr", "strrchr", "strspn", "strcspn","strpbrk", "strstr", "strlen", "strerror", "strtok", "strxfrm", "memcpy","memmove", "memcmp", "memchr", "memset", "clock", "time", "difftime", "mktime","asctime", "ctime", "gmtime", "localtime", "strftime", nil];
    
    NSArray *array4 = [[NSArray alloc]initWithObjects:@"auto", "char", "const", "double",  "float", "int", "long","register", "short", "signed", "sizeof", "static", "string", "struct","typedef", "union", "unsigned", "void", "volatile", "extern", "jmp_buf","signal", "raise", "va_list", "ptrdiff_t", "size_t", "FILE", "fpos_t","div_t", "ldiv_t", "clock_t", "time_t", "tm","SEL", "id", "NSRect", "NSRange", "NSPoint", "NSZone", "Class", "IMP", "BOOL","@selector", "@class", "@protocol", "@interface", "@implementation", "@end","@private", "@protected", "@public", "@try", "@throw", "@catch", "@finally","@encode", "@defs", "@synchronized", nil];
    
    NSArray *array5 = [[NSArray alloc]initWithObjects:@"NSAppleEventDescriptor", "NSNetService", "NSAppleEventManager","NSNetServiceBrowser", "NSAppleScript", "NSNotification", "NSArchiver","NSNotificationCenter", "NSArray", "NSNotificationQueue", "NSAssertionHandler","NSNull", "NSAttributedString", "NSNumber", "NSAutoreleasePool","NSNumberFormatter", "NSBundle", "NSObject", "NSCachedURLResponse","NSOutputStream", "NSCalendarDate", "NSPipe", "NSCharacterSet", "NSPort","NSClassDescription", "NSPortCoder", "NSCloneCommand", "NSPortMessage","NSCloseCommand", "NSPortNameServer", "NSCoder", "NSPositionalSpecifier","NSConditionLock", "NSProcessInfo", "NSConnection", "NSPropertyListSerialization","NSCountCommand", "NSPropertySpecifier", "NSCountedSet", "NSProtocolChecker","NSCreateCommand", "NSProxy", "NSData", "NSQuitCommand", "NSDate","NSRandomSpecifier", "NSDateFormatter", "NSRangeSpecifier", "NSDecimalNumber","NSRecursiveLock", "NSDecimalNumberHandler", "NSRelativeSpecifier","NSDeleteCommand", "NSRunLoop", "NSDeserializer", "NSScanner", "NSDictionary","NSScriptClassDescription", "NSDirectoryEnumerator", "NSScriptCoercionHandler","NSDistantObject", "NSScriptCommand", "NSDistantObjectRequest","NSScriptCommandDescription", "NSDistributedLock", "NSScriptExecutionContext","NSDistributedNotificationCenter", "NSScriptObjectSpecifier", "NSEnumerator","NSScriptSuiteRegistry", "NSError", "NSScriptWhoseTest", "NSException","NSSerializer", "NSExistsCommand", "NSSet", "NSFileHandle", "NSSetCommand","NSFileManager", "NSSocketPort", "NSFormatter", "NSSocketPortNameServer","NSGetCommand", "NSSortDescriptor", "NSHost", "NSSpecifierTest", "NSHTTPCookie","NSSpellServer", "NSHTTPCookieStorage", "NSStream", "NSHTTPURLResponse","NSString", "NSIndexSet", "NSTask", "NSIndexSpecifier", "NSThread","NSInputStream", "NSTimer", "NSInvocation", "NSTimeZone", "NSKeyedArchiver","NSUnarchiver", "NSKeyedUnarchiver", "NSUndoManager", "NSLock","NSUniqueIDSpecifier", "NSLogicalTest", "NSURL", "NSMachBootstrapServer","NSURLAuthenticationChallenge", "NSMachPort", "NSURLCache", "NSMessagePort","NSURLConnection", "NSMessagePortNameServer", "NSURLCredential","NSMethodSignature", "NSURLCredentialStorage", "NSMiddleSpecifier","NSURLDownload", "NSMoveCommand", "NSURLHandle", "NSMutableArray","NSURLProtectionSpace", "NSMutableAttributedString", "NSURLProtocol","NSMutableCharacterSet", "NSURLRequest", "NSMutableData", "NSURLResponse","NSMutableDictionary", "NSUserDefaults", "NSMutableIndexSet", "NSValue","NSMutableSet", "NSValueTransformer", "NSMutableString", "NSWhoseSpecifier","NSMutableURLRequest", "NSXMLParser", "NSNameSpecifier", nil];
    
    NSArray *array6 = [[NSArray alloc]initWithObjects:@"NSActionCell", "NSOpenGLPixelFormat", "NSAffineTransform", "NSOpenGLView","NSAlert", "NSOpenPanel", "NSAppleScript Additions", "NSOutlineView","NSApplication", "NSPageLayout", "NSArrayController", "NSPanel","NSATSTypesetter", "NSParagraphStyle", "NSPasteboard", "NSBezierPath","NSPDFImageRep", "NSBitmapImageRep", "NSPICTImageRep", "NSBox", "NSPopUpButton","NSBrowser", "NSPopUpButtonCell", "NSBrowserCell", "NSPrinter", "NSPrintInfo","NSButton", "NSPrintOperation", "NSButtonCell", "NSPrintPanel", "NSCachedImageRep","NSProgressIndicator", "NSCell", "NSQuickDrawView", "NSClipView", "NSResponder","NSRulerMarker", "NSColor", "NSRulerView", "NSColorList", "NSSavePanel","NSColorPanel", "NSScreen", "NSColorPicker", "NSScroller", "NSColorWell","NSScrollView", "NSComboBox", "NSSearchField", "NSComboBoxCell","NSSearchFieldCell", "NSControl", "NSSecureTextField", "NSController","NSSecureTextFieldCell", "NSCursor", "NSSegmentedCell", "NSCustomImageRep","NSSegmentedControl", "NSDocument", "NSShadow", "NSDocumentController","NSSimpleHorizontalTypesetter", "NSDrawer", "NSSlider", "NSEPSImageRep","NSSliderCell", "NSEvent", "NSSound", "NSFileWrapper", "NSSpeechRecognizer","NSFont", "NSSpeechSynthesizer", "NSFontDescriptor", "NSSpellChecker","NSFontManager", "NSSplitView", "NSFontPanel", "NSStatusBar", "NSForm","NSStatusItem", "NSFormCell", "NSStepper", "NSGlyphGenerator", "NSStepperCell","NSGlyphInfo", "NSGraphicsContext", "NSTableColumn", "NSHelpManager","NSTableHeaderCell", "NSImage", "NSTableHeaderView", "NSImageCell", "NSTableView","NSImageRep", "NSTabView", "NSImageView", "NSTabViewItem", "NSInputManager","NSText", "NSInputServer", "NSTextAttachment", "NSLayoutManager","NSTextAttachmentCell", "NSMatrix", "NSTextContainer", "NSMenu", "NSTextField","NSMenuItem", "NSTextFieldCell", "NSMenuItemCell", "NSTextStorage", "NSMenuView","NSTextTab", "NSMovie", "NSTextView", "NSMovieView", "NSToolbar", "NSToolbarItem","NSMutableParagraphStyle", "NSTypesetter", "NSNib", "NSNibConnector","NSUserDefaultsController", "NSNibControlConnector", "NSView","NSNibOutletConnector", "NSWindow", "NSObjectController", "NSWindowController","NSOpenGLContext", "NSWorkspace", "NSOpenGLPixelBuffer", nil];
    
    
    NSString *range = [NSString string];
    
    for (NSString *aString in array1) {
        if ([theString isEqualToString:aString]) {
            range = @"1";  
        }
    }
    for (NSString *aString in array2) {
        if ([theString isEqualToString:aString]) {
           range = @"2";  
        }
    }
    for (NSString *aString in array3) {
        if ([theString isEqualToString:aString]) {
            range = @"3"; 
        }
    }

    for (NSString *aString in array4) {
        if ([theString isEqualToString:aString]) {
            range = @"4";  
        }
    }

    for (NSString *aString in array5) {
        if ([theString isEqualToString:aString]) {
            range = @"5";  
        }
    }
    
    for (NSString *aString in array6) {
        if ([theString isEqualToString:aString]) {
           range = @"6";  
        }
    }

    return  range;
}




+ (NSString*)checkString:(NSString *)astring{
    NSString *retString;
    
     NSArray *array5 = [[NSArray alloc]initWithObjects:@"NSAppleEventDescriptor", "NSNetService", "NSAppleEventManager","NSNetServiceBrowser", "NSAppleScript", "NSNotification", "NSArchiver","NSNotificationCenter", "NSArray", "NSNotificationQueue", "NSAssertionHandler","NSNull", "NSAttributedString", "NSNumber", "NSAutoreleasePool","NSNumberFormatter", "NSBundle", "NSObject", "NSCachedURLResponse","NSOutputStream", "NSCalendarDate", "NSPipe", "NSCharacterSet", "NSPort","NSClassDescription", "NSPortCoder", "NSCloneCommand", "NSPortMessage","NSCloseCommand", "NSPortNameServer", "NSCoder", "NSPositionalSpecifier","NSConditionLock", "NSProcessInfo", "NSConnection", "NSPropertyListSerialization","NSCountCommand", "NSPropertySpecifier", "NSCountedSet", "NSProtocolChecker","NSCreateCommand", "NSProxy", "NSData", "NSQuitCommand", "NSDate","NSRandomSpecifier", "NSDateFormatter", "NSRangeSpecifier", "NSDecimalNumber","NSRecursiveLock", "NSDecimalNumberHandler", "NSRelativeSpecifier","NSDeleteCommand", "NSRunLoop", "NSDeserializer", "NSScanner", "NSDictionary","NSScriptClassDescription", "NSDirectoryEnumerator", "NSScriptCoercionHandler","NSDistantObject", "NSScriptCommand", "NSDistantObjectRequest","NSScriptCommandDescription", "NSDistributedLock", "NSScriptExecutionContext","NSDistributedNotificationCenter", "NSScriptObjectSpecifier", "NSEnumerator","NSScriptSuiteRegistry", "NSError", "NSScriptWhoseTest", "NSException","NSSerializer", "NSExistsCommand", "NSSet","NSFileHandle", "NSSetCommand","NSFileManager", "NSSocketPort", "NSFormatter", "NSSocketPortNameServer","NSGetCommand", "NSSortDescriptor", "NSHost", "NSSpecifierTest", "NSHTTPCookie","NSSpellServer", "NSHTTPCookieStorage", "NSStream", "NSHTTPURLResponse","NSString", "NSIndexSet", "NSTask", "NSIndexSpecifier", "NSThread","NSInputStream", "NSTimer", "NSInvocation", "NSTimeZone", "NSKeyedArchiver","NSUnarchiver", "NSKeyedUnarchiver", "NSUndoManager", "NSLock","NSUniqueIDSpecifier", "NSLogicalTest", "NSURL", "NSMachBootstrapServer","NSURLAuthenticationChallenge", "NSMachPort", "NSURLCache", "NSMessagePort","NSURLConnection", "NSMessagePortNameServer", "NSURLCredential","NSMethodSignature", "NSURLCredentialStorage", "NSMiddleSpecifier","NSURLDownload", "NSMoveCommand", "NSURLHandle", "NSMutableArray","NSURLProtectionSpace", "NSMutableAttributedString", "NSURLProtocol","NSMutableCharacterSet", "NSURLRequest", "NSMutableData", "NSURLResponse","NSMutableDictionary", "NSUserDefaults", "NSMutableIndexSet", "NSValue","NSMutableSet", "NSValueTransformer", "NSMutableString", "NSWhoseSpecifier","NSMutableURLRequest", "NSXMLParser", "NSNameSpecifier", nil];
    
       for (int i = 0; i < [array5 count]; i++) {
        if ([astring isEqualToString:[array5 objectAtIndex:i]]) {
            retString = [array5 objectAtIndex:i];
            return retString;
        }
    }
    return retString;
}




































@end
