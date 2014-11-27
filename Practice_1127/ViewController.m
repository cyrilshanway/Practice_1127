//
//  ViewController.m
//  Practice_1127
//
//  Created by Cyrilshanway on 2014/11/27.
//  Copyright (c) 2014年 Cyrilshanway. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSTimer *_timer;
    double timerNum;
}

@property (weak, nonatomic) IBOutlet UILabel *ShowLabel;
@property (weak, nonatomic) IBOutlet UIButton *StartBtn;
@property (weak, nonatomic) IBOutlet UIButton *PauseBtn;
@property (weak, nonatomic) IBOutlet UIButton *ClearBtn;

@property (weak, nonatomic) IBOutlet UIButton *GoBtn;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //btn外型
    [self.StartBtn.layer setCornerRadius:23.0f];
    [self.StartBtn.layer setBorderColor:[[UIColor blueColor]CGColor]];
    [self.StartBtn.layer setBorderWidth:2.0f];
    
    [self.PauseBtn.layer setCornerRadius:23.0f];
    [self.PauseBtn.layer setBorderColor:[[UIColor yellowColor]CGColor]];
    [self.PauseBtn.layer setBorderWidth:2.0f];
    
    [self.ClearBtn.layer setCornerRadius:23.0f];
    [self.ClearBtn.layer setBorderColor:[[UIColor redColor]CGColor]];
    [self.ClearBtn.layer setBorderWidth:2.0f];
    
    [self.GoBtn.layer setCornerRadius:23.0f];
    [self.GoBtn.layer setBorderColor:[[UIColor blackColor]CGColor]];
    [self.GoBtn.layer setBorderWidth:2.0f];
    
    //BarButtonItem
    UIButton *a1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [a1 setFrame:CGRectMake(0.0f, 0.0f, 46.0f, 29.0f)];
    [a1 addTarget:self action:@selector(enterEditMode:) forControlEvents:(UIControlEventTouchUpInside)];
    [a1 setTitle:@"編輯" forState:(UIControlStateNormal)];
    [a1.titleLabel setFont:[UIFont systemFontOfSize:13.0f]];
    [a1 setTitleColor:[UIColor purpleColor] forState:(UIControlStateNormal)];
    a1.titleLabel.textColor =[UIColor blackColor];
    UIBarButtonItem *right1Button = [[UIBarButtonItem alloc] initWithCustomView:a1];
    
    UIButton *a2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [a2 setFrame:CGRectMake(0.0f, 0.0f, 46.0f, 29.0f)];
    [a2 addTarget:self action:@selector(leaveEditMode:) forControlEvents:(UIControlEventTouchUpInside)];
    [a2 setTitle:@"結束" forState:(UIControlStateNormal)];
    [a2.titleLabel setFont:[UIFont systemFontOfSize:13.0f]];
    [a2 setTitleColor:[UIColor greenColor] forState:(UIControlStateNormal)];
    a2.titleLabel.textColor =[UIColor blackColor];
    UIBarButtonItem *right2Button = [[UIBarButtonItem alloc] initWithCustomView:a2];
    
    self.navigationItem.rightBarButtonItems =@[right1Button,right2Button];
    
}

-(void)enterEditMode:(id)sender{
    NSLog(@"enterEditMode");
}

-(void)leaveEditMode:(id)sender{
    NSLog(@"leaveEditMode");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startBtnPressed:(id)sender {
    double interval= 1.0f;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:interval
                                              target:self
                                            selector:@selector(timerEvent:)
                                            userInfo:nil
                                             repeats:true];
    
}
- (IBAction)pauseBtnPressed:(id)sender {
    //結束
    [_timer invalidate];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提醒"
                                                    message:@"已停止"
                                                   delegate:self
                                          cancelButtonTitle:@"完成"
                                          otherButtonTitles: nil];
    [alert show];
}
- (IBAction)clearBtnPressed:(id)sender {
    
    if (timerNum != 0) {
        
        timerNum = 0;
        self.ShowLabel.text =[NSString stringWithFormat:@"%d",0];
    }
}

-(void)timerEvent:(id)sender{
    
    timerNum += 1.0f;
    self.ShowLabel.text = [NSString stringWithFormat:@"%2.f", timerNum];
    
}
- (IBAction)goBtnPressed:(id)sender {
    NSString *url = [NSString stringWithFormat:@"http://%@", self.textField.text];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    
    [self.textField resignFirstResponder];
}
@end
