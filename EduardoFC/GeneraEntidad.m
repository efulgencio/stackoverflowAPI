//
//  ObtenerDatos.m
//  EduardoFC
//
//  Created by eduardo fulgencio on 11/11/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import "GeneraEntidad.h"

// El objetivo de esta clase es
// obtener los datos de la url
// después de obtener los datos
// pasar la información a la clase GeneraEntidad
// encarada del separar los valores del json
@implementation GeneraEntidad


// Recibo un dictionary con el valor del json obtenenido
// y según la entidad que recibo genero la correspondiente
// con el NSDictionary que recibo tengo que generar la entidad
// contenedor que contendrá los array a mostrar.
+(Contenedor *) procesoGenera:(NSDictionary *) dictToContenedor

{
    // Array que contendrán preguntas con respuesta
    NSMutableArray *conrespuesta = [[NSMutableArray alloc] init];
    // Array que contendrá preguntas sin respuestas
    NSMutableArray *sinrespuesta = [[NSMutableArray alloc] init];

    
    for (id keyValue in [dictToContenedor allKeys]){
        
        id datosValue = [dictToContenedor objectForKey:keyValue];
        
        if([keyValue isEqual:DICTIONARY_ITEMS_DATOS]){

            // Recorrer todos los nodos de las preguntas
            // para generar entidad Pregunta y guardar en el array correspondiente
            for(NSInteger counter = 0; counter < [datosValue count]; counter++) {

                id preguntaDict = datosValue[counter];
          
                Pregunta *pregunta = [GeneraEntidad datosDictToPregunta:preguntaDict];

                if(pregunta.is_answered) {
                    [conrespuesta addObject:pregunta];
                } else {
                    [sinrespuesta addObject:pregunta];
                }

            }

        }
        
        
    }
    
    
    // Ahora que tengo informado los dos arrays los añado al contendor que tengo que retornar
    
    Contenedor *contenedor = [[Contenedor alloc] init];
    contenedor.conRespuestas = conrespuesta;
    contenedor.sinRespuestas = sinrespuesta;
    
    return contenedor;
    
}

// datosDictToPregunta
// Recibo un NSDictionary
// y obtengo la información necesaria para retornar una Pregunta
+ (Pregunta *) datosDictToPregunta:(NSDictionary *)preguntaDictIn
{
    Pregunta *pregunta = [[Pregunta alloc] init];
    

    id answer_count = preguntaDictIn[@"answer_count"];
    id is_answered  = preguntaDictIn[@"is_answered"];
    id link  = preguntaDictIn[@"link"];
    id title = preguntaDictIn[@"title"];
    
    // tema del owner a ver que retorna
    id display_name = preguntaDictIn[@"owner"][@"display_name"] ;
    id profile_image =  preguntaDictIn[@"owner"][@"profile_image"] ;
    
    pregunta.is_answered = is_answered;
    pregunta.answer_count = answer_count;
    // Link a la pregunta
    pregunta.link = link;
    pregunta.title = title;
    
    pregunta.autor = [[Autor alloc] init];
    pregunta.autor.display_name = display_name;
    pregunta.autor.profile_image = profile_image;
    
    return pregunta;
    
}


@end
