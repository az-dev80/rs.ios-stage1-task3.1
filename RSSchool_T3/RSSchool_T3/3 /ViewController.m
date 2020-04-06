#import "ViewController.h"

@implementation ViewController

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.labelResultColor = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, 130, 70)];
    self.labelResultColor.text = @"Color";
    self.labelRed = [[UILabel alloc] initWithFrame:CGRectMake(10, 120, 130, 70)];
    self.labelRed.text = @"RED";
    self.labelGreen = [[UILabel alloc] initWithFrame:CGRectMake(10, 180, 130, 70)];
    self.labelGreen.text = @"GREEN";
    self.labelBlue = [[UILabel alloc] initWithFrame:CGRectMake(10, 240, 130, 70)];
    self.labelBlue.text = @"BLUE";
    self.textFieldRed = [[UITextField alloc] initWithFrame:CGRectMake(120, 100, 170, 70)];
    [self.textFieldRed setBorderStyle:UITextBorderStyleLine];
    self.textFieldRed.placeholder = @"0..255";
    self.textFieldGreen = [[UITextField alloc] initWithFrame:CGRectMake(120, 180, 170, 70)];
    [self.textFieldGreen setBorderStyle:UITextBorderStyleLine];
    self.textFieldGreen.placeholder = @"0..255";
    self.textFieldBlue = [[UITextField alloc] initWithFrame:CGRectMake(120, 260, 170, 70)];
    [self.textFieldBlue setBorderStyle:UITextBorderStyleLine];
    self.textFieldBlue.placeholder = @"0..255";
    self.buttonProcess =[[UIButton alloc] initWithFrame:CGRectMake((self.view.bounds.size.width / 2 - 50), 350, 100, 60)];
    [self.buttonProcess setTitle:@"Process" forState: UIControlStateNormal];
    self.viewResultColor = [[UIView alloc] initWithFrame:CGRectMake(130, 50, 150, 50)];
    
    [self.view addSubview:self.labelResultColor];
    [self.view addSubview:self.labelRed];
    [self.view addSubview:self.labelGreen];
    [self.view addSubview:self.labelBlue];
    [self.view addSubview:self.textFieldBlue];
    [self.view addSubview:self.textFieldGreen];
    [self.view addSubview:self.textFieldRed];
    [self.view addSubview:self.buttonProcess];
    [self.view addSubview:self.viewResultColor];
    [self.textFieldRed addTarget:self action:@selector(textI:) forControlEvents:UIControlEventAllTouchEvents];
    [self.textFieldGreen addTarget:self action:@selector(textI:) forControlEvents:UIControlEventAllTouchEvents];
    [self.textFieldBlue addTarget:self action:@selector(textI:) forControlEvents:UIControlEventAllTouchEvents];
    [self.buttonProcess addTarget:self action:@selector(button) forControlEvents:UIControlEventTouchUpInside];
    self.view.accessibilityIdentifier = @"mainView";
    self.textFieldRed.accessibilityIdentifier = @"textFieldRed";
    self.textFieldGreen.accessibilityIdentifier = @"textFieldGreen";
    self.textFieldBlue.accessibilityIdentifier = @"textFieldBlue";
    self.buttonProcess.accessibilityIdentifier = @"buttonProcess";
    self.labelRed.accessibilityIdentifier = @"labelRed";
    self.labelGreen.accessibilityIdentifier = @"labelGreen";
    self.labelBlue.accessibilityIdentifier = @"labelBlue";
    self.labelResultColor.accessibilityIdentifier = @"labelResultColor";
    self.viewResultColor.accessibilityIdentifier = @"viewResultColor";
}
- (void)textI:(UITextField *)field {
    self.labelResultColor.text = @"Color";
}
-(void) button
{
    NSCharacterSet* notDecimalDigitSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    if ( (([self.textFieldBlue.text length]!=0) && ([self.textFieldRed.text length]!=0) && ([self.textFieldGreen.text length]!=0) && [self.textFieldRed.text rangeOfCharacterFromSet:notDecimalDigitSet].location == NSNotFound) &&
        [self.textFieldGreen.text rangeOfCharacterFromSet:notDecimalDigitSet].location == NSNotFound &&
        [self.textFieldBlue.text rangeOfCharacterFromSet:notDecimalDigitSet].location == NSNotFound)
    {
        int rclr = [self.textFieldRed.text intValue];
        int gclr = [self.textFieldGreen.text intValue];
        int bclr = [self.textFieldBlue.text intValue];
        if (rclr >= 0 && rclr <256 && gclr >= 0 && gclr <256 && bclr >=0 && bclr < 256)
        {
            self.viewResultColor.backgroundColor = [UIColor colorWithRed:((float)rclr/255) green:((float)gclr/255) blue:  ((float) bclr/255) alpha:1];
            NSString *hex = [[NSString alloc] initWithFormat:@"0x%02X%02X%02X", rclr, gclr, bclr];
            self.labelResultColor.text = hex;
            
        } else {
            self.labelResultColor.text = @"Error";
            self.viewResultColor.backgroundColor = [UIColor clearColor];}
    }
    else {self.labelResultColor.text = @"Error";
        self.viewResultColor.backgroundColor = [UIColor clearColor];}
    [self.view endEditing:YES];
    self.textFieldRed.text = @"";
    self.textFieldGreen.text = @"";
    self.textFieldBlue.text = @"";
    
}

@end
