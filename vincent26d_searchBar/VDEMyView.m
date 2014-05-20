//
//  VDEMyView.m
//  vincent26d_searchBar
//
//  Created by Utilisation on 20/05/14.
//  Copyright (c) 2014 Utilisation. All rights reserved.
//


#import "VDEMyView.h"



@implementation VDEMyView


-(void) setVdeHauteurScopeBar:(int)vdeHauteurScopeBar {
//--------------------------------------------------------------------------------------------------------

	_vdeHauteurScopeBar = vdeHauteurScopeBar;
	NSLog(@"test 3");
	[self vdeSetFromOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
}


-(id) initWithFrame:(CGRect)frame {
//--------------------------------------------------------------------------------------------------------
    
    self= [super initWithFrame:frame ];
	   
    
    //configuration barre de recherche
    //--------------------------------------------------------------------------------------------------------
    vdeBarreDeRecherche = [[UISearchBar alloc] init];
    vdeBarreDeRecherche.showsBookmarkButton	= YES;
	vdeBarreDeRecherche.showsCancelButton	= YES;
	vdeBarreDeRecherche.delegate			= self;
    [self addSubview:vdeBarreDeRecherche];
	
	
    
	// configuration du label
	//--------------------------------------------------------------------------------------------------------
	vdeLabeBoutonChoisi = [[UILabel alloc ]init];
	vdeLabeBoutonChoisi.TextAlignment= NSTextAlignmentCenter;
	vdeLabeBoutonChoisi.text = @"attente des choix...";
	[self addSubview:vdeLabeBoutonChoisi];
	
	//configuration bouton
    //--------------------------------------------------------------------------------------------------------
	vdeBoutonAffichageScope = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[vdeBoutonAffichageScope setTitle:@"Toggle la scopeBar" forState:UIControlStateNormal];
	[vdeBoutonAffichageScope setBackgroundColor:[UIColor lightGrayColor]];
	[vdeBoutonAffichageScope addTarget:self action:@selector(vdeActionVisualisationScopeBar ) forControlEvents:UIControlEventTouchDown];
	[self addSubview:vdeBoutonAffichageScope];
	
	
    // positionnement des frames
    //--------------------------------------------------------------------------------------------------------
    [self vdeSetFromOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
	// on recupere l'orientation de la status bar pour connaitre l'orientation ( astuce UPMC )

    
    
    return self;
}

-(void) vdeActionVisualisationScopeBar {
//--------------------------------------------------------------------------------------------------------

	if( vdeBarreDeRecherche.showsScopeBar){
		vdeBarreDeRecherche.scopeButtonTitles		= nil;
		vdeBarreDeRecherche.showsScopeBar			= NO;
		self.vdeHauteurScopeBar						= 0;
		
	}else {
		vdeBarreDeRecherche.scopeButtonTitles		= @[@"Choix 1", @"Choix 2",@"Choix 3"];
		vdeBarreDeRecherche.showsScopeBar			= YES;
		self.vdeHauteurScopeBar						= 45;
	}

	// j'ai redéfini le setter de vdeHauteurScopeBar : chaque fois que cette valeur change, je refais u affichage

}

- (void) vdeSetFromOrientation:(UIInterfaceOrientation) o {
	//--------------------------------------------------------------------------------------------------------
	

	// rafraichissement de la frame en fonction de l'orientation
	//--------------------------------------------------------------------------------------------------------
	
	CGRect screenRect = [[UIScreen mainScreen] bounds];
	
    if (o == UIInterfaceOrientationLandscapeLeft || o==UIInterfaceOrientationLandscapeRight)
    {
		self.frame = CGRectMake(screenRect.origin.x, screenRect.origin.y, screenRect.size.height, screenRect.size.width);
    }else {
		self.frame = CGRectMake(screenRect.origin.x, screenRect.origin.y, screenRect.size.width, screenRect.size.height);
    }
	
	// Calcul des dimensiuons
	//--------------------------------------------------------------------------------------------------------
	
	int vdeLargeurVue, vdeHauteurVue, vdeHauteurBarreDeRecherche ;
    
	vdeLargeurVue = [self bounds].size.width;
	vdeHauteurVue = [self bounds].size.height;
	
	if (vdeBarreDeRecherche.showsScopeBar) {
		vdeHauteurBarreDeRecherche = 80;
		NSLog(@"test 80");
	} else {
		vdeHauteurBarreDeRecherche = 30;
		NSLog(@"test 30");
	}
	int vdeLargeurBarreDeReherche		= vdeLargeurVue;
    int vdeXBarreDeReherche				= 0;
    int vdeYBarreDeReherche				= 35;
	
    int vdeHauteurBoutonAffichageScope	= 30;
	int vdeXBoutonAffichageScope		= 0;
    int vdeYBoutonAffichageScope		= vdeHauteurVue-100;
    int vdeLargeurBoutonAffichageScope	= vdeLargeurVue;
	
	int vdeHauteurLabeBoutonChoisi		= 30;
	int vdeXLabelBoutonChoisi			= 0;
    int vdeYLabelBoutonChoisi			= (vdeYBoutonAffichageScope)/2 +vdeHauteurLabeBoutonChoisi/2; // centrage label
    int vdeLargeurLabelBoutonChoisi 	= vdeLargeurVue;

    
    
    // placement des subviews
    //--------------------------------------------------------------------------------------------------------
    
    [vdeBarreDeRecherche		setFrame:CGRectMake(vdeXBarreDeReherche,
													vdeYBarreDeReherche,
													vdeLargeurBarreDeReherche,
													vdeHauteurBarreDeRecherche)];
    
    [vdeBoutonAffichageScope	setFrame:CGRectMake(vdeXBoutonAffichageScope,
													vdeYBoutonAffichageScope,
													vdeLargeurBoutonAffichageScope,
													vdeHauteurBoutonAffichageScope)];
	
	[vdeLabeBoutonChoisi	    setFrame:CGRectMake(vdeXLabelBoutonChoisi,
													vdeYLabelBoutonChoisi,
													vdeLargeurLabelBoutonChoisi,
													vdeHauteurLabeBoutonChoisi)];
    
    
}

//--------------------------------------------------------------------------------------------------------
// LES DELEGATES DE SEARCHBAR
//--------------------------------------------------------------------------------------------------------



-(void) searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope {
//--------------------------------------------------------------------------------------------------------
	
	vdeLabeBoutonChoisi.text =   [NSString stringWithFormat:@"Le bouton %@ a été choisi", [[searchBar scopeButtonTitles] objectAtIndex:selectedScope]];
	
}

-(BOOL) searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
//--------------------------------------------------------------------------------------------------------
	if( [text isEqualToString:@"\n"]) {
		[searchBar resignFirstResponder]; // to remove the keyboard
		return NO;
	}
	
	return YES;
}

-(void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
//--------------------------------------------------------------------------------------------------------
	vdeLabeBoutonChoisi.text = @"Le texte a changé";
	
}

-(void) searchBarBookmarkButtonClicked:(UISearchBar *)searchBar {
//--------------------------------------------------------------------------------------------------------

	vdeLabeBoutonChoisi.text = @"Bouton bookmark choisi";
	UIActionSheet * vdeActionSheet = [[UIActionSheet alloc]
									  initWithTitle:@"Bookmark" delegate:self
									  cancelButtonTitle:@"Annuler"
									  destructiveButtonTitle:@"Rechercher quelque chose"
									  otherButtonTitles:@"Rechercher mon nom", nil];
	
	[vdeActionSheet showInView:self];
}

-(void) searchBarCancelButtonClicked:(UISearchBar *) searchBar {
//--------------------------------------------------------------------------------------------------------
	vdeLabeBoutonChoisi.text = @"Annulation choisi";
	[vdeBarreDeRecherche resignFirstResponder]; // to remove the keyboard
	
}

-(void) searchBarSearchButtonClicked:(UISearchBar *)searchBar{
	//--------------------------------------------------------------------------------------------------------
	vdeLabeBoutonChoisi.text = @"Rechercher choisi";
	[vdeBarreDeRecherche resignFirstResponder];
	
}

-(BOOL) searchBarShouldBeginEditing:(UISearchBar *)searchBar {
	//--------------------------------------------------------------------------------------------------------
	return YES;
}

-(BOOL) searchBarShouldEndEditing:(UISearchBar *)searchBar {
	//--------------------------------------------------------------------------------------------------------
	return YES;
}



    



//--------------------------------------------------------------------------------------------------------

@end

