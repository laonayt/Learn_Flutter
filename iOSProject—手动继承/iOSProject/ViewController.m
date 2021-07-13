//
//  ViewController.m
//  iOSProject
//
//  Created by W E on 2021/4/8.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"Native首页";
    
}

- (IBAction)goFlutterVC:(id)sender {
    FlutterViewController *flutterVC = [[FlutterViewController alloc] init];
    [self.navigationController pushViewController:flutterVC animated:YES];
//    [self presentViewController:flutterVC animated:YES completion:nil];
}


@end
