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
	UIButton			*vdeBoutonAffichageScope;
	UIImageView         *vdeImageEspace;
	CGRect				vdeMaFrame;
}

@property (nonatomic) int vdeHauteurScopeBar;

- (void) vdeSetFromOrientation:(UIInterfaceOrientation) o;

@end
