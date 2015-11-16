//
//  Contenedor.m
//  EduardoFC
//
//  Created by eduardo fulgencio on 11/11/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import "Contenedor.h"

@implementation Contenedor

@synthesize nombre = _nombre;

- (id) init:(NSString *) valor
{
    if ((self = [super init])) {
        self.nombre = valor;
        self.conRespuestas = [[NSArray alloc] init];
    }
    return self;
}

@end
