//
//  Pregunta.h
//  EduardoFC
//
//  Created by eduardo fulgencio on 12/11/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Autor.h"

@interface Pregunta : NSObject

// propiedades de la entidad
// tag del
@property(nonatomic, strong) NSArray *tags;
// Clase Owner
@property(nonatomic, strong) Autor *autor;
// Otro atributos
@property(nonatomic) BOOL is_answered;
@property(nonatomic) int view_count;
@property(nonatomic, strong) NSNumber *accepted_answer_id;
@property(nonatomic) int answer_count;
@property(nonatomic) int score;
@property(nonatomic, strong) NSDate *last_activity_date;
@property(nonatomic, strong) NSDate *creation_date;
@property(nonatomic, strong) NSDate *last_edit_date;
@property(nonatomic, strong) NSNumber *question_id;
@property(nonatomic, strong) NSString *link;
@property(nonatomic, strong) NSString *title;


@end


/*
 @"tags": @23,
 @"owner" : {
 @"reputacion":@23,
 @"user_id":@11111,
 @"user_type":@"registrado user type",
 @"profile_image":@"url imagen",
 @"display_name":@"eduardo",
 @"link":@"enlace pregunta"
 },
 @"is_answered": @true,
 @"view_count": @23,
 @"accepted_answer_id": @33587354,
 @"answer_count": @1,
 @"score": @0,
 @"last_activity_date": @1447190490,
 @"creation_date": @1446927542,
 @"last_edit_date": @1447190463,
 @"question_id": @33587328,
 @"link": @"http://stackoverflow.com/questions/33587328/apk-wont-install-some-of-the-time-over-email-from-mail-osx",
 @"title": @"APK won&#39;t install some of the time over email from Mail (OSX)"
 };
 */