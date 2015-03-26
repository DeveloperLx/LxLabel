//
//  LxLabel.h
//  LxLabelDemo
//

#if !__has_feature(objc_arc)
    #error Must build in automatic reference counting envirmonent!
#endif

#import <UIKit/UIKit.h>

/**
 *  Some property only fit that all the characters in text have same modality.
 */
@interface LxLabel : UILabel

@property (nonatomic,assign) CGFloat topEdgeInset NS_AVAILABLE_IOS(2_0);
@property (nonatomic,assign) CGFloat bottomEdgeInset NS_AVAILABLE_IOS(2_0);
@property (nonatomic,assign) CGFloat leftEdgeInset NS_AVAILABLE_IOS(2_0);
@property (nonatomic,assign) CGFloat rightEdgeInset NS_AVAILABLE_IOS(2_0);

@property (nonatomic,assign) CGFloat lineSpacing NS_AVAILABLE_IOS(6_0);
@property (nonatomic,assign) CGFloat paragraphSpacing NS_AVAILABLE_IOS(6_0);
@property (nonatomic,assign) CGFloat firstLineHeadIndent NS_AVAILABLE_IOS(6_0);
@property (nonatomic,assign) CGFloat headIndent NS_AVAILABLE_IOS(6_0);
@property (nonatomic,assign) CGFloat tailIndent NS_AVAILABLE_IOS(6_0);
@property (nonatomic,assign) CGFloat minimumLineHeight NS_AVAILABLE_IOS(6_0);
@property (nonatomic,assign) CGFloat maximumLineHeight NS_AVAILABLE_IOS(6_0);
@property (nonatomic,assign) NSWritingDirection baseWritingDirection NS_AVAILABLE_IOS(6_0);
@property (nonatomic,assign) CGFloat lineHeightMultiple NS_AVAILABLE_IOS(6_0);
@property (nonatomic,assign) CGFloat paragraphSpacingBefore NS_AVAILABLE_IOS(6_0);
@property (nonatomic,assign) CGFloat hyphenationFactor NS_AVAILABLE_IOS(6_0);
@property (nonatomic,strong) NSArray * tabStops NS_AVAILABLE_IOS(7_0);
@property (nonatomic,assign) CGFloat defaultTabInterval NS_AVAILABLE_IOS(7_0);
@property (nonatomic,strong) UIColor * textBackgroundColor NS_AVAILABLE_IOS(6_0);
@property (nonatomic,assign) NSInteger ligature NS_AVAILABLE_IOS(6_0);
@property (nonatomic,assign) CGFloat characterSpacing NS_AVAILABLE_IOS(6_0);
@property (nonatomic,assign) NSUnderlineStyle strikethroughStyle NS_AVAILABLE_IOS(6_0);
@property (nonatomic,assign) NSUnderlineStyle underlineStyle NS_AVAILABLE_IOS(6_0);
@property (nonatomic,strong) UIColor * strokeColor NS_AVAILABLE_IOS(6_0);
@property (nonatomic,assign) CGFloat strokeWidth NS_AVAILABLE_IOS(6_0);
@property (nonatomic,assign) CGFloat shadowBlurRadius NS_AVAILABLE_IOS(6_0);
@property (nonatomic,strong) NSString * textEffectAttribute NS_AVAILABLE_IOS(7_0);
@property (nonatomic,strong) NSTextAttachment * attachment NS_AVAILABLE_IOS(7_0);
@property (nonatomic,strong) NSURL * link NS_AVAILABLE_IOS(7_0);
@property (nonatomic,assign) CGFloat baselineOffset NS_AVAILABLE_IOS(7_0);
@property (nonatomic,strong) UIColor * underlineColor NS_AVAILABLE_IOS(7_0);
@property (nonatomic,strong) UIColor * strikethroughColor NS_AVAILABLE_IOS(7_0);
@property (nonatomic,assign) CGFloat obliqueness NS_AVAILABLE_IOS(7_0);
@property (nonatomic,assign) CGFloat expansion NS_AVAILABLE_IOS(7_0);

@property (nonatomic,readonly) NSInteger factualLinesCount NS_AVAILABLE_IOS(6_0);

- (NSRange)textRangeAtLineIndex:(NSInteger)lineIndex NS_AVAILABLE_IOS(6_0);

@property (nonatomic,readonly) NSMutableDictionary * textAttributes NS_AVAILABLE_IOS(6_0);
@property (nonatomic,readonly) NSMutableParagraphStyle * paragraphStyle NS_AVAILABLE_IOS(6_0);
@property (nonatomic,readonly) NSShadow * shadow NS_AVAILABLE_IOS(6_0);
@property (nonatomic,assign) CGRect textRect;

@property (nonatomic,readonly) CGSize visibleTextSize;

/**
 *  Need set the property userInteractionEnabled to YES for response.
 */
@property (nonatomic,copy) void (^textTouchedAction)(NSInteger touchedLineIndex, NSInteger touchedCharacterIndexForTheLine, NSInteger touchedCharacterIndex, NSAttributedString * touchedCharacterString);

@end
