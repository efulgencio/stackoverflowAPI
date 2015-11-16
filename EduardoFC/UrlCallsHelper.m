//
//  UrlCallsHelper.m
//  CulturaEFC
//
//  Created by eduardo fulgencio on 11/5/15.
//  Copyright (c) 2015 eduardo fulgencio. All rights reserved.
//

#import "UrlCallsHelper.h"

@implementation UrlCallsHelper


//
// Objetivo
// Recibir la url, un nombre de entidad, y un objeto para retornar la notificación
// url: ulr de la llamada a realizar
// nombre entidad: en el caso de que otra entidad realice llamadas a este método
// este parámetro se utilizará para diferenciar el tipo de envio, en este caso sera Contenedor
// notificar: objeto que esta esperando la notificación para recibir los datos obtenidos.

+(NSObject *) peticion:(NSString *) urlIn entidad:(NSString *)entidad notificar:(id)notificar
{
 
    
    NSURL *url = [NSURL URLWithString:urlIn];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    Contenedor *contenido = [[Contenedor alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response,
                                                                                        NSData *data,
                                                                                        NSError *error) {
        if ([data length] >0  && error == nil){
            
        
            id jsonObject = [NSJSONSerialization JSONObjectWithData:data  options:NSJSONReadingAllowFragments error:&error];
            
            
            if ([jsonObject isKindOfClass:[NSDictionary class]]){
                
                NSDictionary *dictFromJson = (NSDictionary *)jsonObject;
       
                // Almaceno en el directorio temporal del dispositivo.
                // Voy a guardarlo en el dispositivo para los casos en que no tengo conexión a internet
                // podre consultar los valores obtenidos anteriormente
                [FileHelper salvarEntidad:dictFromJson nombreIn:ENTIDAD_STACKOVERFLOW];
                
                // Genera la entidad Contenedor a partir del nsdictionary obtenido de la llamada URL
                Contenedor *contenedor = [GeneraEntidad procesoGenera:dictFromJson];
         
                // Asigno a userInfo para el envío en la notificación
                NSDictionary *contenedorInfo = [[NSDictionary alloc] initWithObjectsAndKeys:contenedor,entidad, nil];
                // Creo el objeto a enviar al observer : notificar recibido por parámetro
                NSNotification *notificaContenedor =
                [NSNotification notificationWithName:(NSString *)NOTIFICACION_GENERADO_CONTENEDOR object:notificar userInfo:contenedorInfo];
                
                // Lanzo la notificación
                [[NSNotificationCenter defaultCenter] postNotification:notificaContenedor];
                
                
            } else {
                NSLog(@"Pendiente de implementar");
            }
            
        } else if ([data length] == 0 && error == nil){
            NSLog(@"Nada descargado.");
        } else if (error != nil){
            NSLog(@"Generado error = %@", error);
        }
        
    }];

    return contenido;
}

@end

