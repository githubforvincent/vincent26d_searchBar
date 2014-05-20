//
//  VDEMyView.h
//  vincent26d_searchBar
//
//  Created by Utilisation on 20/05/14.
//  Copyright (c) 2014 Utilisation. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface VDEMyView : UIView <UISearchBarDelegate, UIActionSheetDelegate> {
	
	UISearchBar         *vdeBarreDeRecherche;
	UILabel             *vdeLabeBoutonChoisi;
	UIButton			*vdeBoutonMiseAJour;
	UIImageView         *vdeImageEspace;
	int					vdeHauteurScopeBar;
	CGRect				vdeMaFrame;
}

@end
