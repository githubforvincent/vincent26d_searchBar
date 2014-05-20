//
//  VDEMyView.m
//  vincent26d_searchBar
//
//  Created by Utilisation on 20/05/14.
//  Copyright (c) 2014 Utilisation. All rights reserved.
//


#import "VDEMyView.h"



@implementation VDEMyView



//--------------------------------------------------------------------------------------------------------
-(id) initWithFrame:(CGRect)frame {
//--------------------------------------------------------------------------------------------------------
    
    self= [super initWithFrame:frame ];
	   
    
    //configuration subview du fond
    //--------------------------------------------------------------------------------------------------------
    vdeImageEspace = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image2048_2048.png"]];
    vdeImageEspace = [[UIImageView alloc] init];
    [self addSubview:vdeImageEspace];
	
    
    //configuration barre de recherche
    //--------------------------------------------------------------------------------------------------------
    vdeBarreDeRecherche = [[UISearchBar alloc] init];
    vdeBarreDeRecherche.showsBookmarkButton	= YES;
	vdeBarreDeRecherche.showsCancelButton	= YES;
	vdeBarreDeRecherche.delegate			= self;
    [self addSubview:vdeBarreDeRecherche];
    
	//configuration bouton
    //--------------------------------------------------------------------------------------------------------
	vdeBoutonMiseAJour = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[vdeBoutonMiseAJour setTitle:@"Mise à jour" forState:UIControlStateNormal];
	[vdeBoutonMiseAJour addTarget:self action:@selector(vdeActionMiseAJour) forControlEvents:UIControlEventTouchDown];
	[self addSubview:vdeBoutonMiseAJour];
	
	
    // positionnement des frames
    //--------------------------------------------------------------------------------------------------------
    //[self vdeAffichageEcran];
    
    
    return self;
}

-(void) vdeActionMiseAJour {
//--------------------------------------------------------------------------------------------------------

	if( vdeBarreDeRecherche.showsScopeBar){
		vdeHauteurScopeBar						= 0;
		vdeBarreDeRecherche.scopeButtonTitles	= nil;
		vdeBarreDeRecherche.showsScopeBar		= NO;
		
	}else {
		vdeHauteurScopeBar						= 45;
		vdeBarreDeRecherche.scopeButtonTitles	= @[@"Choix 1", @"Choix 2",@"Choix 3"];
		vdeBarreDeRecherche.showsScopeBar		= YES;
	}
}

/*

		int vdeEspacement;            // espacement vertical entre les éléments, calculé plus bas
		int vdeHauteurElement   = 30; // hauteur standard pour tous les éléments;
		int vdeMargeHaut        = 30; // marge haut des premiers élements
		int vdeMargeLaterale    = 20;
		int vdeOffsetEcartement = 20; // pour ajuster l'espace entre les segmented control


		int vdeLargeurVue = [self bounds].size.width;
		int vdeHauteurVue = [self bounds].size.height;



	 int vdeLargeurSearchBar     = 100;
    int vdeXstepper             = vdeMargeLaterale;
    int vdeYStepper             = vdeMargeHaut;

    
    int vdeLargeurSwitchGeek    = 50;
    int vdeXSwitchGeek          = vdeLargeurVue-vdeMargeLaterale-vdeLargeurSwitchGeek;
    int vdeYSwitchGeek          = vdeMargeHaut;
    
    int vdeXLabelDizaines       = vdeMargeLaterale;
    int vdeYLabelDizaines       = vdeYSegmentDizaines-vdeHauteurElement+5; // +5 pour rapprocher le label du segment
    int vdeLargeurLabelDizaines = vdeLargeurVue/2;

    int vdeXBoutonReset         = vdeLargeurVue/3;
    int vdeYBoutonReset         = vdeMargeHaut+(vdeHauteurElement/2)+(5*vdeEspacement);
    int vdeLargeurBoutonReset   = vdeLargeurVue/3; // 1/3 de la largeur... pourquoi pas..
    
    
    // placement des subviews
    //--------------------------------------------------------------------------------------------------------
    
    [vdeStepper         setFrame:CGRectMake(vdeXstepper, vdeYStepper, vdeLargeurStepper, vdeHauteurElement)];
    
    [vdeLabelModeGeek   setFrame:CGRectMake(vdeXLabelModeGeek, vdeYLabelModeGeek, vdeLargeurLabelModeGeek, vdeHauteurElement)];
    [vdeSwitchModeGeek  setFrame:CGRectMake(vdeXSwitchGeek, vdeYSwitchGeek, vdeLargeurSwitchGeek, vdeHauteurElement)];
    
    [vdeLabelDizaines   setFrame:CGRectMake(vdeXLabelDizaines, vdeYLabelDizaines, vdeLargeurLabelDizaines, vdeHauteurElement)];
    [vdeSegmentDizaines setFrame:CGRectMake(vdeXSegmentDizaines,vdeYSegmentDizaines, vdeLargeurSegmentDizaines, vdeHauteurElement)];
    
    [vdeLabelUnites     setFrame:CGRectMake(vdeXLabelUnites, vdeYLabelUnites, vdeLargeurLabelUnites, vdeHauteurElement)];
    [vdeSegmentUnites   setFrame:CGRectMake(vdeXSegmentUnites, vdeYSegmentUnites, vdeLargeurSegmentUnites, vdeHauteurElement)];
    
    [vdeLabelValeur     setFrame:CGRectMake(vdeXLabelValeur, vdeYlabelValeur, vdeLargeurLabelValeur, vdeHauteurElement)];
    
    [vdeSlider          setFrame:CGRectMake(vdeXSlider, vdeYSlider, vdeLargeurSlider, vdeHauteurElement)];
    
    [vdeBoutonReset     setFrame:CGRectMake(vdeXBoutonReset, vdeYBoutonReset, vdeLargeurBoutonReset, vdeHauteurElement)];
    
    
}



	[self vdeMiseAJourAffichage];
*/
    



//--------------------------------------------------------------------------------------------------------

@end

