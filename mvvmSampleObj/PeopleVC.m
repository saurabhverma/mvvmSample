//
//  ViewController.m
//  mvvmSampleObj
//
//  Created by Saurabh Verma on 14/03/2017.
//  Copyright © 2017 Outware. All rights reserved.
//

#import "PeopleVC.h"
#import "PeopleManager.h"
#import "PeopleViewModel.h"

@interface PeopleVC () <UITableViewDelegate, UITableViewDataSource> {
    IBOutlet UITableView* peopleTableView;
    IBOutlet UILabel* errorLabel;
}
@property(nonatomic) PeopleViewModel *peopleViewModel;
- (void)displayResults;
- (void)displayEmptyScreen;
- (void)displayError;
@end

@implementation PeopleVC

- (void)viewDidLoad {
    [super viewDidLoad];

    PMStarWarsPeopleBlock block = nil;
    block = ^(PeopleViewModel * _Nonnull result, bool success){

        self.peopleViewModel = result;
        if (success) {

            if (result.people.count == 0) {
                [self displayEmptyScreen];
            }
            else {
                 [self displayResults];
            }
        }
        else {
            [self displayError];
        }
    };

    [[[PeopleManager alloc] init] getStarWarsPeople:block];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Private Methods
- (void)displayResults {

    self.navigationItem.title = self.peopleViewModel.totalCountText;
    errorLabel.hidden = YES;
    peopleTableView.hidden = NO;
    [peopleTableView reloadData];

}
- (void)displayEmptyScreen {
    peopleTableView.hidden = YES;
    errorLabel.hidden = NO;
    errorLabel.text = self.peopleViewModel.emptyScreenText;
    NSLog(@"%@", errorLabel.text);
}
- (void)displayError {
    peopleTableView.hidden = YES;
    errorLabel.hidden = NO;
    errorLabel.text = self.peopleViewModel.errorMessageText;
    
}
#pragma mark - TableView Delegates and Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.peopleViewModel.people.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellIdentifier = @"REUSE_IDENTIFIER";

    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    CharacterViewModel* characterViewModel = [self.peopleViewModel.people objectAtIndex:indexPath.row];
    cell.textLabel.text = characterViewModel.nameText;
    cell.textLabel.textColor = [UIColor whiteColor];

    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
}
@end
