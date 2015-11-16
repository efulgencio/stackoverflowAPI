//
//  UrlCallsHelper.h
//  CulturaEFC
//
//  Created by eduardo fulgencio on 11/5/15.
//  Copyright (c) 2015 eduardo fulgencio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeneraEntidad.h"

@interface UrlCallsHelper : NSObject

+(NSObject *) peticion:(NSString *) urlIn entidad:(NSString *) entidad notificar:(id)notificar;


@end
