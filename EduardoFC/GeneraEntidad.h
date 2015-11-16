//
//  ObtenerDatos.h
//  EduardoFC
//
//  Created by eduardo fulgencio on 11/11/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contenedor.h"
#import "Pregunta.h"

@interface GeneraEntidad : NSObject

// Recibe json y retorna la entidad con los
// registros necesarios para la tabla
+ (Contenedor *) procesoGenera:(NSDictionary *) dictToContenedor;
+ (Pregunta *) datosDictToPregunta:(NSDictionary *)preguntaDictIn;

@end
