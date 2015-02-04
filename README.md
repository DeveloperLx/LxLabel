# LxLabel
    An evolutional label inherited from UILabel. It can generate a large number of effect, and use simple properties to set.
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
    ...................     // See LxLabel.h for more properties...
    
    NSLog(@"factualLineCount = %ld",label.factualLinesCount);    //
    NSLog(@"textRangeAtLine2 : %@",NSStringFromRange([label textRangeAtLineIndex:2]));  //
    
    [self.view addSubview:label];
