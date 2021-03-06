//
//  ItemDetailController.m
//  exchange
//
//  Created by Nadav Golbandi on 2/21/15.
//  Copyright (c) 2015 Doupan Guo. All rights reserved.
//

#import "ItemDetailController.h"
#import "UIImageView+AFNetworking.h"


@interface ItemDetailController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageAndOwnerLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (strong, nonatomic) ExchangeItem* item;
@end

@implementation ItemDetailController

-(id) initWithItem:(ExchangeItem*) item{
    if (self = [super init]) {
        self.item = item;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.nameLabel.text = self.item.name;
    self.descriptionLabel.text = self.item.description;
    if (self.item.imageUrl) {
        [self.itemImageView setImageWithURL: [NSURL URLWithString:self.item.imageUrl]];
    }
//    else{
//        [self.itemImage setImage:[[UIImage alloc] initWithContentsOfFile:@"love-is-give-and-take-pugs"]];
//    }
    
    NSTimeInterval elapsedTimeInterval = [self.item.createdAt timeIntervalSinceNow];
    int elapsedSeconds = (int)(elapsedTimeInterval * -1);
    
    NSLog(@"%d", elapsedSeconds);
    NSString* formattedDateString;
    if (elapsedSeconds < 60) {
        formattedDateString = @"just now";
    }
    else if (elapsedSeconds < 3600) {
        int minutes = elapsedSeconds / 60;
        formattedDateString = [NSString stringWithFormat:@"in %dm", minutes];
    }
    else if (elapsedSeconds < 86400) {
        int hours = elapsedSeconds / 3600;
        formattedDateString = [NSString stringWithFormat:@"in %dh", hours];
    }
    else if (elapsedSeconds < 31536000) {
        int days = elapsedSeconds / 86400;
        formattedDateString = [NSString stringWithFormat:@"in %dd", days];
    }
    else {
        int years = elapsedSeconds / 31536000;
        formattedDateString = [NSString stringWithFormat:@"in %dyr", years];
    }
    
    self.ageAndOwnerLabel.text = [NSString stringWithFormat:@"Published by %@ %@",self.item.userId, formattedDateString];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onExchange:(id)sender {
    NSLog(@"On Exchange");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
