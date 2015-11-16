//
//  Autor.h
//  EduardoFC
//
//  Created by eduardo fulgencio on 12/11/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Autor : NSObject

@property(nonatomic) int *reputacion;
@property(nonatomic, strong) NSNumber *user_id;
@property(nonatomic, strong) NSString *user_type;
@property(nonatomic, strong) NSString *display_name;
@property(nonatomic, strong) NSString *link;
@property(nonatomic, strong) NSString *profile_image;


@end
/*

 @"reputacion":@23,
 @"user_id":@11111,
 @"user_type":@"registrado user type",
 @"profile_image":@"url imagen",
 @"display_name":@"eduardo",
 @"link":@"enlace pregunta"
 
*/