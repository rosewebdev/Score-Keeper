//
//  ScoreViewController.m
//  Score Keeper
//
//  Created by Jason Kupiec on 4/5/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ScoreViewController.h"
static CGFloat fieldMargin = 20;
static CGFloat scoreViewHeight = 50;

@interface ScoreViewController () <UITextFieldDelegate>

@property (strong, nonatomic)UIScrollView *scrollView;
@property (strong, nonatomic)NSMutableArray *scoreLabels;

@end

@implementation ScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Score Keeper";
    
    self.scoreLabels = [NSMutableArray new];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64)];
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    for (NSInteger i = 0; i < 4; i++) {
        [self addScoreView:i];
    }
}

- (void)addScoreView: (NSInteger)index {
    
    CGFloat nameFieldWidth = 40;
    CGFloat scoreFieldWidth = 20;
    CGFloat stepperButtonWidth = 40;
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, index * scoreViewHeight, self.view.frame.size.width, scoreViewHeight)];
    
//Name Field Location
    UITextField *nameField = [[UITextField alloc]initWithFrame:CGRectMake(fieldMargin, fieldMargin, nameFieldWidth, 40)];
    nameField.tag = -1000;
    nameField.delegate = self;
    nameField.placeholder = @"Name";
    [view addSubview:nameField];
    
//Score View Location
    UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(fieldMargin + nameFieldWidth, fieldMargin, scoreFieldWidth, 40)];
    scoreLabel.text = @"0";
    scoreLabel.textAlignment = NSTextAlignmentCenter;
    [self.scoreLabels addObject:scoreLabel];
    [view addSubview:scoreLabel];
    
//Stepper Location
    UIStepper *scoreStepper = [[UIStepper alloc] initWithFrame:CGRectMake(40 + nameFieldWidth + scoreFieldWidth, 15, stepperButtonWidth, 40)];
    scoreStepper.maximumValue = 100;
    scoreStepper.minimumValue = -100;
    scoreStepper.tag = index;
    [scoreStepper addTarget:self action:@selector(scoreStepperChanged:) forControlEvents:UIControlEventValueChanged];
    [view addSubview:scoreStepper];
}

-(void)scoreStepperChanged:(id)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
