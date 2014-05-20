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
	
	[self setFromOrientation:[[UIApplication sharedApplication] statusBarOrientation]]; // on recupere l'orientation de ls status bar pour connaitre l'orientation ( astuce UPMC )
}


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
	[vdeBarreDeRecherche resignFirstResponder];
	
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

- (void) setFromOrientation:(UIInterfaceOrientation) o {
//--------------------------------------------------------------------------------------------------------

    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
	
    if (o == UIInterfaceOrientationLandscapeLeft || o==UIInterfaceOrientationLandscapeRight)
    {
        self.frame = CGRectMake(screenRect.origin.x, screenRect.origin.y, screenRect.size.height, screenRect.size.width);

    }else{
        NSLog(@"je suis en mode vertical");
        self.frame = CGRectMake(screenRect.origin.x, screenRect.origin.y, screenRect.size.width, screenRect.size.height);
    }
    [self affichageEcran];
    
}

-(void) affichageEcran {
	//--------------------------------------------------------------------------------------------------------




	int vdeLargeurVue = [self bounds].size.width;
	int vdeHauteurVue = [self bounds].size.height;

	int vdeLargeurBarreDeReherche  = vdeLargeurVue;
    int vdeXBarreDeReherche        = 0;
    int vdeYBarreDeReherche        = 0;

    
    int vdeXLabelBoutonChoisi			= 0;
    int vdeYLabelBoutonChoisi			= vdeHauteurVue/2;
    int vdeLargeurLabelBoutonChoisi 	= vdeLargeurVue/2;

    int vdeXBoutonMiseAJour			= 0;
    int vdeYBoutonMiseAJour			= vdeHauteurVue/2+20;
    int vdeLargeurBoutonMiseAJour	= vdeLargeurVue;
    
    
    // placement des subviews
    //--------------------------------------------------------------------------------------------------------
    
    [vdeBarreDeRecherche         setFrame:CGRectMake(vdeXBarreDeReherche, vdeYBarreDeReherche, vdeLargeurBarreDeReherche, 30)];
    
    [vdeBoutonMiseAJour setFrame:CGRectMake(vdeXBoutonMiseAJour, vdeYBoutonMiseAJour, vdeLargeurBoutonMiseAJour, 30)];
	
	[vdeLabeBoutonChoisi setFrame:CGRectMake(vdeXLabelBoutonChoisi, vdeYLabelBoutonChoisi, vdeLargeurLabelBoutonChoisi, 30)];
    
    
}


    



//--------------------------------------------------------------------------------------------------------

@end

