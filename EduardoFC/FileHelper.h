//
//  FileHelper.h
//  CulturaEFC
//
//  Created by eduardo fulgencio on 11/5/15.
//  Copyright (c) 2015 eduardo fulgencio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileHelper : NSObject


+(void) salvarEntidad:(NSDictionary *) entidadIn nombreIn:(NSString *) nombreIn;

+(NSDictionary *) recuperarEntidad:(NSString *) nombreIn;

@end
