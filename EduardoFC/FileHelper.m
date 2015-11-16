//
//  FileHelper.m
//  CulturaEFC
//
//  Created by eduardo fulgencio on 11/5/15.
//  Copyright (c) 2015 eduardo fulgencio. All rights reserved.
//

#import "FileHelper.h"

@implementation FileHelper


+(void)salvarEntidad:(NSDictionary *)entidadIn nombreIn:(NSString *)nombreIn
{
    
    NSString *filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:nombreIn];
    [NSKeyedArchiver archiveRootObject:entidadIn toFile:filePath];
    
}

+(NSDictionary *) recuperarEntidad:(NSString *)nombreIn
{

    NSString *filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:nombreIn];
    NSDictionary *entidad =  [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];

    return entidad;
    
}

@end
