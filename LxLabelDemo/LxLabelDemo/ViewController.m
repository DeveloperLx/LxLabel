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
    
    LxLabel * label = [[LxLabel alloc]initWithFrame:CGRectMake(20, 120, 300, 500)];
    label.text = @"This is a Lxlabel.\nThis is a Lxlabel.\nThis is a Lxlabel.\nThis is a Lxlabel.\nThis is a Lxlabel.\nThis is a Lxlabel.\nThis is a Lxlabel.\nThis is a Lxlabel.\nThis is a Lxlabel.\nThis is a Lxlabel.\nThis is a Lxlabel.\nThis is a Lxlabel.\nThis is a Lxlabel.\nThis is a Lxlabel.\nThis is a Lxlabel.\nThis is a Lxlabel.\nThis is a Lxlabel.\nThis is a Lxlabel.\nThis is a Lxlabel.\nThis is a Lxlabel.\nThis is a Lxlabel.\nThis is a Lxlabel.\nThis is a Lxlabel.\nThis is a Lxlabel.\n ";
    label.backgroundColor = [UIColor cyanColor];
    label.numberOfLines = 0;
    label.characterSpacing = 3;
    label.lineSpacing = 10;
    label.textBackgroundColor = [UIColor yellowColor];
    label.topEdgeInset = 12;
    label.bottomEdgeInset = 30;
    label.leftEdgeInset = 18;
    label.rightEdgeInset = 6;
    label.shadowColor = [UIColor blueColor];
    label.shadowOffset = CGSizeMake(0, 0);
    label.shadowBlurRadius = 2;
    label.underlineStyle = NSUnderlineStyleThick;
    
    NSLog(@"factualLineCount = %ld",label.factualLinesCount);    //
    NSLog(@"textRangeAtLine2 : %@",NSStringFromRange([label textRangeAtLineIndex:2]));
    
    [self.view addSubview:label];
    
    label.userInteractionEnabled = YES;
    label.textTouchedAction = ^(NSInteger touchedLineIndex, NSInteger touchedCharacterIndexForTheLine, NSInteger touchedCharacterIndex, NSAttributedString * touchedCharacterString) {
        
        NSLog(@"%ld, %ld, %ld, %@", touchedLineIndex,touchedCharacterIndexForTheLine, touchedCharacterIndex, touchedCharacterString); //
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
