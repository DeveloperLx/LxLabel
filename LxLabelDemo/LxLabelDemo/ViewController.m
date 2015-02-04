//
//  ViewController.m
//  LxLabelDemo
//

#import "ViewController.h"
#import "LxLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    LxLabel * label = [[LxLabel alloc]initWithFrame:CGRectMake(20, 120, 200, 300)];
    label.text = @"An evolutional label inherited from UILabel. It can generate a large number of effect, and simple properties to set. \nSome property only fit that all the characters in text have same modality.";
    label.backgroundColor = [UIColor cyanColor];
    label.numberOfLines = 0;
    label.characterSpacing = 3;
    label.lineSpacing = 10;
    label.textBackgroundColor = [UIColor yellowColor];
    label.topEdgeInset = 12;
    label.bottomEdgeInset = 10;
    label.leftEdgeInset = 8;
    label.rightEdgeInset = 6;
    label.shadowColor = [UIColor blueColor];
    label.shadowOffset = CGSizeMake(10, 10);
    label.shadowBlurRadius = 2;
    label.underlineStyle = NSUnderlineStyleThick;
    
    NSLog(@"factualLineCount = %ld",label.factualLinesCount);    //
    NSLog(@"textRangeAtLine2 : %@",NSStringFromRange([label textRangeAtLineIndex:2]));
    
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
