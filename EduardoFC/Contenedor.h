//
//  Contenedor.h
//  EduardoFC
//
//  Created by eduardo fulgencio on 11/11/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import <Foundation/Foundation.h>

// Esta clase debe debe de contener
// el array con las preguntas con respuesta
// y las preguntas sin respuesa
@interface Contenedor : NSObject


// Array con preguntas con respuestas
@property (nonatomic, strong) NSArray *conRespuestas;
// Array con preguntas sin respuestas
@property (nonatomic) NSArray *sinRespuestas;

@property (nonatomic, strong) NSString *nombre;

-(id) init:(NSString *) nombre;

@end
