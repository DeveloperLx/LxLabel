# LxLabel
An evolutional label inherited from UILabel. It can generate a large number of effect, and use simple properties to set. You can change all the new properties dynamically.
Installation
------------
  You only need drag LxLabel.h and LxLabel.m to your project.
Support
------------
  Minimum support iOS version: iOS 6.0
Usage
----------
    LxLabel * label = [[LxLabel alloc]initWithFrame:CGRectMake(20, 120, 200, 300)];
    label.text = @"An evolutional label inherited from UILabel. It can generate a large number of effect, and simple properties to set. \nSome property only fit that all the characters in text have same modality.";
    label.numberOfLines = 0;
    label.characterSpacing = 3;
    label.lineSpacing = 10;
    label.textBackgroundColor = [UIColor yellowColor];
    label.topEdgeInset = 12;
    label.bottomEdgeInset = 10;
    label.leftEdgeInset = 8;
    label.rightEdgeInset = 6;
    label.shadowBlurRadius = 2;
    label.underlineStyle = NSUnderlineStyleThick;
    ...................................     // See LxLabel.h for more properties...
    
    NSLog(@"factualLineCount = %ld",label.factualLinesCount);    //
    NSLog(@"textRangeAtLine2 : %@",NSStringFromRange([label textRangeAtLineIndex:2]));  //
    
    [self.view addSubview:label];
    
    label.userInteractionEnabled = YES;
    label.textTouchedAction = ^(NSInteger touchedLineIndex, NSInteger touchedCharacterIndexForTheLine, NSInteger touchedCharacterIndex, NSAttributedString * touchedCharacterString) {
        
        NSLog(@"%ld, %ld, %ld, %@", touchedLineIndex,touchedCharacterIndexForTheLine, touchedCharacterIndex, touchedCharacterString); //
    };
Be careful 
-----------
    LxLabel must build in automatic reference counting envirmonent!
    Some property only fit that all the characters in text have same modality!
License
-----------
LxLabel is available under the Apache License 2.0. See the LICENSE file for more info.
