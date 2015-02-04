//
//  LxLabel.m
//  LxLabelDemo
//

#import "LxLabel.h"
#import <CoreText/CoreText.h>

@interface NSParagraphStyle (copy)

- (instancetype)mutableCopy;

@end

@implementation NSParagraphStyle (copy)

- (instancetype)mutableCopy
{
    NSMutableParagraphStyle * copyParagraphStyle = [[NSMutableParagraphStyle alloc]init];
    copyParagraphStyle.lineSpacing = self.lineSpacing;
    copyParagraphStyle.paragraphSpacing = self.paragraphSpacing;
    copyParagraphStyle.alignment = self.alignment;
    copyParagraphStyle.firstLineHeadIndent = self.firstLineHeadIndent;
    copyParagraphStyle.headIndent = self.headIndent;
    copyParagraphStyle.tailIndent = self.tailIndent;
    copyParagraphStyle.lineBreakMode = self.lineBreakMode;
    copyParagraphStyle.minimumLineHeight = self.minimumLineHeight;
    copyParagraphStyle.maximumLineHeight = self.maximumLineHeight;
    copyParagraphStyle.baseWritingDirection = self.baseWritingDirection;
    copyParagraphStyle.lineHeightMultiple = self.lineHeightMultiple;
    copyParagraphStyle.paragraphSpacingBefore = self.paragraphSpacingBefore;
    copyParagraphStyle.hyphenationFactor = self.hyphenationFactor;
    copyParagraphStyle.tabStops = self.tabStops;
    copyParagraphStyle.defaultTabInterval = self.defaultTabInterval;
    return copyParagraphStyle;
}

@end


@interface LxLabel ()

@property (nonatomic,readonly) NSMutableDictionary * textAttributes;
@property (nonatomic,readonly) NSMutableParagraphStyle * paragraphStyle;
@property (nonatomic,readonly) NSShadow * shadow;
@property (nonatomic,assign) CGRect textRect;

@end

@implementation LxLabel

@synthesize textAttributes = _textAttributes, paragraphStyle = _paragraphStyle, shadow = _shadow;

- (NSMutableDictionary *)textAttributes;
{
    if (_textAttributes == nil) {
        _textAttributes = [[NSMutableDictionary alloc]init];
        if (self.attributedText.length > 0) {
            [_textAttributes setDictionary:[self.attributedText attributesAtIndex:0 effectiveRange:nil]];
        }
    }
    return _textAttributes;
}

- (NSMutableParagraphStyle *)paragraphStyle
{
    if (_paragraphStyle == nil) {
        _paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        NSParagraphStyle * textParagraphStyle = self.textAttributes[NSParagraphStyleAttributeName];
        _paragraphStyle.lineSpacing = textParagraphStyle.lineSpacing;
        _paragraphStyle.paragraphSpacing = textParagraphStyle.paragraphSpacing;
        _paragraphStyle.alignment = textParagraphStyle.alignment;
        _paragraphStyle.firstLineHeadIndent = textParagraphStyle.firstLineHeadIndent;
        _paragraphStyle.headIndent = textParagraphStyle.headIndent;
        _paragraphStyle.tailIndent = textParagraphStyle.tailIndent;
        _paragraphStyle.lineBreakMode = textParagraphStyle.lineBreakMode;
        _paragraphStyle.minimumLineHeight = textParagraphStyle.minimumLineHeight;
        _paragraphStyle.maximumLineHeight = textParagraphStyle.maximumLineHeight;
        _paragraphStyle.baseWritingDirection = textParagraphStyle.baseWritingDirection;
        _paragraphStyle.lineHeightMultiple = textParagraphStyle.lineHeightMultiple;
        _paragraphStyle.paragraphSpacingBefore = textParagraphStyle.paragraphSpacingBefore;
        _paragraphStyle.hyphenationFactor = textParagraphStyle.hyphenationFactor;
        _paragraphStyle.tabStops = textParagraphStyle.tabStops;
        _paragraphStyle.defaultTabInterval = textParagraphStyle.defaultTabInterval;
    }
    return _paragraphStyle;
}

- (NSShadow *)shadow
{
    if (_shadow == nil) {
        _shadow = [[NSShadow alloc]init];
        NSShadow * textShadow = self.textAttributes[NSShadowAttributeName];
        _shadow.shadowBlurRadius = textShadow.shadowBlurRadius;
        _shadow.shadowColor = textShadow.shadowColor;
        _shadow.shadowOffset = textShadow.shadowOffset;
    }
    return _shadow;
}

- (void)setTopEdgeInset:(CGFloat)topEdgeInset
{
    _topEdgeInset = topEdgeInset;
    [self setNeedsDisplay];
}

- (void)setBottomEdgeInset:(CGFloat)bottomEdgeInset
{
    _bottomEdgeInset = bottomEdgeInset;
    [self setNeedsDisplay];
}

- (void)setLeftEdgeInset:(CGFloat)leftEdgeInset
{
    _leftEdgeInset = leftEdgeInset;
    [self setNeedsDisplay];
}

- (void)setRightEdgeInset:(CGFloat)rightEdgeInset
{
    _rightEdgeInset = rightEdgeInset;
    [self setNeedsDisplay];
}

- (CGFloat)lineSpacing
{
    return self.paragraphStyle.lineSpacing;
}

- (void)setLineSpacing:(CGFloat)lineSpacing
{
    self.paragraphStyle.lineSpacing = lineSpacing;
    [self setNeedsDisplay];
}

- (CGFloat)paragraphSpacing
{
    return self.paragraphStyle.paragraphSpacing;
}

- (void)setParagraphSpacing:(CGFloat)paragraphSpacing
{
    self.paragraphStyle.paragraphSpacing = paragraphSpacing;
    [self setNeedsDisplay];
}

- (CGFloat)firstLineHeadIndent
{
    return self.paragraphStyle.firstLineHeadIndent;
}

- (void)setFirstLineHeadIndent:(CGFloat)firstLineHeadIndent
{
    self.firstLineHeadIndent = firstLineHeadIndent;
    [self setNeedsDisplay];
}

- (CGFloat)headIndent
{
    return self.paragraphStyle.headIndent;
}

- (void)setHeadIndent:(CGFloat)headIndent
{
    self.paragraphStyle.headIndent = headIndent;
    [self setNeedsDisplay];
}

- (CGFloat)tailIndent
{
    return self.paragraphStyle.tailIndent;
}

- (void)setTailIndent:(CGFloat)tailIndent
{
    self.paragraphStyle.tailIndent = tailIndent;
    [self setNeedsDisplay];
}

- (CGFloat)minimumLineHeight
{
    return self.paragraphStyle.minimumLineHeight;
}

- (void)setMinimumLineHeight:(CGFloat)minimumLineHeight
{
    self.paragraphStyle.minimumLineHeight = minimumLineHeight;
    [self setNeedsDisplay];
}

- (CGFloat)maximumLineHeight
{
    return self.paragraphStyle.maximumLineHeight;
}

- (void)setMaximumLineHeight:(CGFloat)maximumLineHeight
{
    self.paragraphStyle.maximumLineHeight = maximumLineHeight;
    [self setNeedsDisplay];
}

- (NSWritingDirection)baseWritingDirection
{
    return self.paragraphStyle.baseWritingDirection;
}

- (void)setBaseWritingDirection:(NSWritingDirection)baseWritingDirection
{
    self.paragraphStyle.baseWritingDirection = baseWritingDirection;
    [self setNeedsDisplay];
}

- (CGFloat)lineHeightMultiple
{
    return self.paragraphStyle.lineHeightMultiple;
}

- (void)setLineHeightMultiple:(CGFloat)lineHeightMultiple
{
    self.paragraphStyle.lineHeightMultiple = lineHeightMultiple;
    [self setNeedsDisplay];
}

- (CGFloat)paragraphSpacingBefore
{
    return self.paragraphStyle.paragraphSpacingBefore;
}

- (void)setParagraphSpacingBefore:(CGFloat)paragraphSpacingBefore
{
    self.paragraphStyle.paragraphSpacingBefore = paragraphSpacingBefore;
    [self setNeedsDisplay];
}

- (CGFloat)hyphenationFactor
{
    return self.paragraphStyle.hyphenationFactor;
}

- (void)setHyphenationFactor:(CGFloat)hyphenationFactor
{
    self.paragraphStyle.hyphenationFactor = hyphenationFactor;
    [self setNeedsDisplay];
}

- (NSArray *)tabStops
{
    return self.paragraphStyle.tabStops;
}

- (void)setTabStops:(NSArray *)tabStops
{
    self.paragraphStyle.tabStops = tabStops;
    [self setNeedsDisplay];
}

- (CGFloat)defaultTabInterval
{
    return self.paragraphStyle.defaultTabInterval;
}

- (void)setDefaultTabInterval:(CGFloat)defaultTabInterval
{
    self.paragraphStyle.defaultTabInterval = defaultTabInterval;
    [self setNeedsDisplay];
}

- (UIColor *)textBackgroundColor
{
    return self.textAttributes[NSBackgroundColorAttributeName];
}

- (void)setTextBackgroundColor:(UIColor *)textBackgroundColor
{
    [self.textAttributes setValue:textBackgroundColor forKey:NSBackgroundColorAttributeName];
    [self setNeedsDisplay];
}

- (NSInteger)ligature
{
    NSNumber * ligatureNumber = self.textAttributes[NSLigatureAttributeName];
    return [ligatureNumber integerValue];
}

- (void)setLigature:(NSInteger)ligature
{
    [self.textAttributes setValue:@(ligature) forKey:NSLigatureAttributeName];
    [self setNeedsDisplay];
}

- (CGFloat)characterSpacing
{
    NSNumber * kernNumber = self.textAttributes[NSKernAttributeName];
    return [kernNumber floatValue];
}

- (void)setCharacterSpacing:(CGFloat)characterSpacing
{
    [self.textAttributes setValue:@(characterSpacing) forKey:NSKernAttributeName];
    [self setNeedsDisplay];
}

- (NSUnderlineStyle)strikethroughStyle
{
    NSNumber * strikethroughStyleNumber = self.textAttributes[NSStrikethroughStyleAttributeName];
    return (NSUnderlineStyle)[strikethroughStyleNumber integerValue];
}

- (void)setStrikethroughStyle:(NSUnderlineStyle)strikethroughStyle
{
    [self.textAttributes setValue:@(strikethroughStyle) forKey:NSStrikethroughStyleAttributeName];
    [self setNeedsDisplay];
}

- (NSUnderlineStyle)underlineStyle
{
    NSNumber * underlineStyleNumber = self.textAttributes[NSUnderlineStyleAttributeName];
    return (NSUnderlineStyle)[underlineStyleNumber integerValue];
}

- (void)setUnderlineStyle:(NSUnderlineStyle)underlineStyle
{
    [self.textAttributes setValue:@(underlineStyle) forKey:NSUnderlineStyleAttributeName];
    [self setNeedsDisplay];
}

- (UIColor *)strokeColor
{
    return self.textAttributes[NSStrokeColorAttributeName];
}

- (void)setStrokeColor:(UIColor *)strokeColor
{
    [self.textAttributes setValue:strokeColor forKey:NSStrokeColorAttributeName];
    [self setNeedsDisplay];
}

- (CGFloat)strokeWidth
{
    NSNumber * strokeWidthNumber = self.textAttributes[NSStrokeWidthAttributeName];
    return [strokeWidthNumber floatValue];
}

- (void)setStrokeWidth:(CGFloat)strokeWidth
{
    [self.textAttributes setValue:@(strokeWidth) forKey:NSStrokeWidthAttributeName];
    [self setNeedsDisplay];
}

- (CGFloat)shadowBlurRadius
{
    return self.shadow.shadowBlurRadius;
}

- (void)setShadowBlurRadius:(CGFloat)shadowBlurRadius
{
    self.shadow.shadowBlurRadius = shadowBlurRadius;
    [self setNeedsDisplay];
}

- (NSString *)textEffectAttribute
{
    return self.textAttributes[NSTextEffectAttributeName];
}

- (void)setTextEffectAttribute:(NSString *)textEffectAttribute
{
    [self.textAttributes setValue:textEffectAttribute forKey:NSTextEffectAttributeName];
    [self setNeedsDisplay];
}

- (NSTextAttachment *)attachment
{
    return self.textAttributes[NSAttachmentAttributeName];
}

- (void)setAttachment:(NSTextAttachment *)attachment
{
    [self.textAttributes setValue:attachment forKey:NSAttachmentAttributeName];
    [self setNeedsDisplay];
}

- (NSURL *)link
{
    return self.textAttributes[NSLinkAttributeName];
}

- (void)setLink:(NSURL *)link
{
    [self.textAttributes setValue:link forKey:NSLinkAttributeName];
    [self setNeedsDisplay];
}

- (CGFloat)baselineOffset
{
    NSNumber * baselineOffsetNumber = self.textAttributes[NSBaselineOffsetAttributeName];
    return [baselineOffsetNumber floatValue];
}

- (void)setBaselineOffset:(CGFloat)baselineOffset
{
    [self.textAttributes setValue:@(baselineOffset) forKey:NSBaselineOffsetAttributeName];
    [self setNeedsDisplay];
}

- (UIColor *)underlineColor
{
    return self.textAttributes[NSUnderlineColorAttributeName];
}

- (void)setUnderlineColor:(UIColor *)underlineColor
{
    [self.textAttributes setValue:underlineColor forKey:NSUnderlineColorAttributeName];
    [self setNeedsDisplay];
}

- (UIColor *)strikethroughColor
{
    return self.textAttributes[NSStrikethroughColorAttributeName];
}

- (void)setStrikethroughColor:(UIColor *)strikethroughColor
{
    [self.textAttributes setValue:strikethroughColor forKey:NSStrikethroughColorAttributeName];
    [self setNeedsDisplay];
}

- (CGFloat)obliqueness
{
    NSNumber * obliquenessNumber = self.textAttributes[NSObliquenessAttributeName];
    return [obliquenessNumber floatValue];
}

- (void)setObliqueness:(CGFloat)obliqueness
{
    [self.textAttributes setValue:@(obliqueness) forKey:NSObliquenessAttributeName];
    [self setNeedsDisplay];
}

- (CGFloat)expansion
{
    NSNumber * expansionNumber = self.textAttributes[NSExpansionAttributeName];
    return [expansionNumber floatValue];
}

- (void)setExpansion:(CGFloat)expansion
{
    [self.textAttributes setValue:@(expansion) forKey:NSExpansionAttributeName];
    [self setNeedsDisplay];
}

- (void)setShadowColor:(UIColor *)shadowColor
{
    [super setShadowColor:shadowColor];
    self.shadow.shadowColor = shadowColor;
    [self setNeedsDisplay];
}

- (void)setShadowOffset:(CGSize)shadowOffset
{
    [super setShadowOffset:shadowOffset];
    self.shadow.shadowOffset = shadowOffset;
    [self setNeedsDisplay];
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
    [super setTextAlignment:textAlignment];
    self.paragraphStyle.alignment = textAlignment;
    [self setNeedsDisplay];
}

- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode
{
    [super setLineBreakMode:lineBreakMode];
    self.paragraphStyle.lineBreakMode = lineBreakMode;
    [self setNeedsDisplay];
}

- (CGRect)textRect
{
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(self.topEdgeInset, self.leftEdgeInset, self.bottomEdgeInset, self.rightEdgeInset);
    _textRect = UIEdgeInsetsInsetRect(self.bounds, edgeInsets);;
    return _textRect;
}

- (void)drawTextInRect:(CGRect)rect
{
    NSMutableAttributedString * mutableAttributedText = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];
    NSRange mutableAttributedTextwholeRange = NSMakeRange(0, mutableAttributedText.length);
    [self.textAttributes setValue:self.paragraphStyle forKey:NSParagraphStyleAttributeName];
    [self.textAttributes setValue:self.shadow forKey:NSShadowAttributeName];
    [mutableAttributedText setAttributes:self.textAttributes range:mutableAttributedTextwholeRange];
    self.attributedText = [[NSAttributedString alloc]initWithAttributedString:mutableAttributedText];

    [super drawTextInRect:self.textRect];
}

- (NSInteger)factualLinesCount
{
    NSMutableAttributedString * mutableAttributedText = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];
    NSRange mutableAttributedTextwholeRange = NSMakeRange(0, mutableAttributedText.length);
    NSMutableParagraphStyle * tempParagraphStyle = [self.paragraphStyle mutableCopy];
    tempParagraphStyle.lineBreakMode = 0;   // ** Otherwise cannot get lines count **
    [self.textAttributes setValue:tempParagraphStyle forKey:NSParagraphStyleAttributeName];
    [self.textAttributes setValue:self.shadow forKey:NSShadowAttributeName];
    [mutableAttributedText setAttributes:self.textAttributes range:mutableAttributedTextwholeRange];
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)mutableAttributedText);
    
    CGMutablePathRef boundsPath = CGPathCreateMutable();
    CGPathAddRect(boundsPath, 0, self.textRect);
    
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, mutableAttributedText.length), boundsPath, 0);
    
    CFIndex factualLinesCount = CFArrayGetCount(CTFrameGetLines(frame));
    
    CFRelease(framesetter);
    CFRelease(boundsPath);
    CFRelease(frame);
    
    return (NSInteger)factualLinesCount;
}

- (NSRange)textRangeAtLineIndex:(NSInteger)lineIndex
{
    NSMutableAttributedString * mutableAttributedText = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];
    NSRange mutableAttributedTextwholeRange = NSMakeRange(0, mutableAttributedText.length);
    NSMutableParagraphStyle * tempParagraphStyle = [self.paragraphStyle mutableCopy];
    tempParagraphStyle.lineBreakMode = 0;   // ** Otherwise cannot get lines count **
    [self.textAttributes setValue:tempParagraphStyle forKey:NSParagraphStyleAttributeName];
    [self.textAttributes setValue:self.shadow forKey:NSShadowAttributeName];
    [mutableAttributedText setAttributes:self.textAttributes range:mutableAttributedTextwholeRange];
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)mutableAttributedText);
    
    CGMutablePathRef boundsPath = CGPathCreateMutable();
    CGPathAddRect(boundsPath, 0, self.textRect);
    
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, mutableAttributedText.length), boundsPath, 0);
    
    CFIndex factualLineCount = CFArrayGetCount(CTFrameGetLines(frame));
    
    NSAssert((lineIndex >= 0 && lineIndex < factualLineCount), @"行序号超出有效范围");
    
    CFArrayRef lines = CTFrameGetLines(frame);
    
    CTLineRef line = (CTLineRef)CFArrayGetValueAtIndex(lines, lineIndex);
    CFRange lineTextRange = CTLineGetStringRange(line);
    
    CFRelease(framesetter);
    CFRelease(boundsPath);
    CFRelease(frame);
    
    return NSMakeRange(lineTextRange.location, lineTextRange.length);
}

@end


