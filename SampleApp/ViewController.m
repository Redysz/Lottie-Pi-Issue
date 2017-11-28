//
//  ViewController.m
//  SampleApp
//
//  Created by Karol Kurek on 28.11.2017.
//  Copyright © 2017 Karol Kurek. All rights reserved.
//

#import "ViewController.h"
#import <Lottie/Lottie.h>
#include <stdlib.h>

#define kAnimationWidth     200.f
#define kAnimationHeight    100.f
#define kInfoFontSize       14.f
#define kInfoMargin         10.f

@interface ViewController ()

@end

@implementation ViewController {
    LOTAnimationView *_animationView;
    UIImageView *imageView1;
    UIImageView *imageView2;
    UIImageView *imageView3;
    UIImageView *imageView4;
    bool animation;
}

- (void)createAnimationView {
    _animationView = [LOTAnimationView animationNamed:@"some_loader"];
    [_animationView setLoopAnimation:YES];
    [_animationView setClipsToBounds:YES];
    [self.view addSubview:_animationView];
}

- (void)viewDidLayoutSubviews {
    _animationView.frame = CGRectMake((self.view.frame.size.width - kAnimationWidth )/2.f,
                                      (self.view.frame.size.height - kAnimationHeight)/2.f,
                                      kAnimationWidth,
                                      kAnimationHeight);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createAnimationView];
    imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball.png"]];
    [imageView1 setFrame:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2, 24, 24)];
    [self.view addSubview:imageView1];
    
    imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball.png"]];
    [imageView2 setFrame:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2, 24, 24)];
    [self.view addSubview:imageView2];
    
    imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball.png"]];
    [imageView3 setFrame:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2, 24, 24)];
    [self.view addSubview:imageView3];
    
    imageView4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball.png"]];
    [imageView4 setFrame:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2, 24, 24)];
    [self.view addSubview:imageView4];
    animation = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self animateImageView:imageView1];
    [self animateImageView:imageView2];
    [self animateImageView:imageView3];
    [self animateImageView:imageView4];

    dispatch_async(dispatch_get_main_queue(), ^{
        [_animationView play];
    });
    
        for(int i = 0; i < 1000; i++) {
            [self performSelectorInBackground:@selector(someHardComputations) withObject:nil];
            [self performSelectorInBackground:@selector(someHardComputations) withObject:nil];
        }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)animateImageView:(UIImageView *)imageView {
    [UIView animateWithDuration:arc4random_uniform(3)+1
                          delay:0.0f
                        options: UIViewAnimationOptionBeginFromCurrentState
                     animations: ^(void){imageView.frame = CGRectMake(arc4random_uniform(self.view.frame.size.width), arc4random_uniform(self.view.frame.size.height), 24, 24);}
                     completion:^(BOOL finished){[self animateImageView:imageView];}];
}



- (void)someHardComputations {
    
    int r[2800 + 1];
    int i, k;
    int b, d;
    int c = 0;
    
    for (i = 0; i < 2800; i++) {
        r[i] = 2000;
    }
    
    for (k = 2800; k > 0; k -= 14) {
        d = 0;
        
        i = k;
        for (;;) {
            d += r[i] * 10000;
            b = 2 * i - 1;
            
            r[i] = d % b;
            d /= b;
            i--;
            if (i == 0) break;
            d *= i;
        }
        NSLog(@"%.4d", c + d / 10000);
        c = d % 10000;
    }
}


@end
