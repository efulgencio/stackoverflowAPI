//
//  ViewController.m
//  EduardoFC
//
//  Created by eduardo fulgencio on 10/11/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import "ViewController.h"
#import "FileHelper.h"
#import "UrlCallsHelper.h"
#import "Contenedor.h"
#import "UIImageView+AFNetworking.h"

@interface ViewController ()
@property(nonatomic, strong) NSString *contenido;
@property (nonatomic) Contenedor *model;
@property (strong, nonatomic) NSDictionary *dictConenido;
@end


const NSString *ResultOfAppendingTwoStringsNotification =  @"ResultOfAppendingTwoStringsNotification";


@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.contenedorTV.dataSource = self;

    [[NSNotificationCenter defaultCenter]  addObserver:self  selector:@selector(mostrarContenedor:)
                                                  name:(NSString *)NOTIFICACION_GENERADO_CONTENEDOR object:self];
    
    @try {
       
        self.dictConenido = [FileHelper recuperarEntidad:ENTIDAD_STACKOVERFLOW];
        
        //if(self.dictConenido != nil) {
        if(false){
            
           //   Contenedor *contenedor = [GeneraEntidad procesoGenera:self.dictConenido];
            Contenedor *contenedor = [[Contenedor alloc] init];
            NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:contenedor,@"CONTENEDOR",nil];
            
            NSNotification *notificationObject =
            [NSNotification notificationWithName:(NSString *)NOTIFICACION_GENERADO_CONTENEDOR object:self userInfo:userInfo];
            
            [[NSNotificationCenter defaultCenter] postNotification:notificationObject];
            
        } else {
            
            // Cargo el contenido del Json
            // según la URL, convierto el JSON en DICTIONARY después a entities envio notificación
            // que recibe este UIViewController para mostrar la información de los
            // array conRespuestas y sinRespuestas
            [self.activityProcesando startAnimating];
            self.model = (Contenedor *)[UrlCallsHelper peticion:URL_PETICION  entidad:ENTIDAD_SOLICITA_CONTENEDOR notificar:self];
            
        }
        
    }
    @catch (NSException *exception)
    {
        NSLog(@"Error: %@", exception);
    }

    
}

#pragma mark - METODO DEL OBSERVER

// Método observer de la notificación NOTIFICACION_GENERADO_CONTENEDOR
// que indica que se ha generado la información necesaria para la tabla
- (void) mostrarContenedor:(NSNotification *)paramNotification
{
    
    id datosRecibidos = [paramNotification userInfo];
    self.model = (Contenedor *)datosRecibidos[ENTIDAD_SOLICITA_CONTENEDOR];
    // Recargar tabla
    [self.activityProcesando stopAnimating];
    [self.contenedorTV reloadData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark -
#pragma mark - MÉTODOS DE LA TABLE VIEW contenedorTV


#pragma mark - CELL FOR ROW AT INDEX PATH

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *result = nil;
    
    if ([tableView isEqual:self.contenedorTV]){
        
        // Dependiendo de la sección se carga una uno u otro array
        
        Pregunta *pregunta = [[Pregunta alloc] init];
        
        
        if(indexPath.section == POSICION_SECCION_CON_RESPUESTAS) {
            pregunta = ((Pregunta *) self.model.conRespuestas[indexPath.row]);
        } else {
            pregunta = ((Pregunta *) self.model.sinRespuestas[indexPath.row]);
        }
        
        
        static NSString *TableViewCellIdentifier = @"celdaPregunta";
        
        result = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier];
        
        if (result == nil){
            result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableViewCellIdentifier];
        }
        
        // Esta es la manera como se lo he enviado
        /*
        // Imágen por defecto pendiente de obtener imagen url
        result.imageView.image = [UIImage imageNamed:IMAGEN_POR_DEFECTO_CELDA];
        // Bloque para obtener la imágen del profile del autor
        dispatch_async(kBgQueue, ^{
            
            NSString *urlImagen = pregunta.autor.profile_image;
            
            NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlImagen]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                result.imageView.image = [UIImage imageWithData:imgData];
            });
            
        });
        */
        
        // Otra manera de obtener la imágen
        NSURL *url = [NSURL URLWithString:pregunta.autor.profile_image];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        UIImage *placeholderImage = [UIImage imageNamed:IMAGEN_POR_DEFECTO_CELDA];
        
        __weak UITableViewCell *weakCell = result;
        
        [result.imageView setImageWithURLRequest:request
                              placeholderImage:placeholderImage
                                       success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                           
                                           weakCell.imageView.image = image;
                                           [weakCell setNeedsLayout];
                                           
                                       } failure:nil];

        
        result.textLabel.text = pregunta.title;
        
    }
    
    return result;
    
}


#pragma mark - METODOS PARA CABECERA DE LAS SECCIONES

#pragma mark - TITULO FOR HEADER IN SECTION
- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    if ([tableView isEqual:self.contenedorTV]){
        switch (section){
            case 0:{
                return  TITULO_SECCION_CON_RESPUESTAS;
                break;
            }
            case 1:{
                return TITULO_SECCION_SIN_RESPUESTAS;
                break;
            }
        }
    }
    
    return @"";
}

#pragma mark - NUMBER OF ROWS IN SECTIONS
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSInteger result = 0;
    if ([tableView isEqual:self.contenedorTV]){
        switch (section){
            case 0:{
                result = self.model.conRespuestas.count;
                break;
            }
            case 1:{
                result = self.model.sinRespuestas.count;
                break;
            }
        }
    }
    return result;
    
}

#pragma mark - NUMBER OF SECTIONS IN TABLE VIEW

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    NSInteger result = 0;
    if ([tableView isEqual:self.contenedorTV]){
        result = 2;
    }
    return result;
    
}

@end


