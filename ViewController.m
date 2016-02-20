//
//  ViewController.m
//  airplane
//
//  Created by 林少川 on 16/1/18.
//  Copyright © 2016年 oc. All rights reserved.
//

#import "ViewController.h"
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight  [UIScreen mainScreen].bounds.size.height
@interface ViewController ()
{
   UIImageView *bg1;
    UIImageView *bg2;
    NSMutableArray *enemyPlaneArry;
    UIImageView * enermyPlane;
    int dex;
    UIImageView *plane;
    UIImageView *bullet;
    NSMutableArray *bulletArray;
    CGPoint begPoint;
    
    UIImageView *baozha;
    NSArray *baozhaArry;
    UIAlertController *alerController;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.\\\
//创建背景
    bg1 = [[UIImageView alloc]initWithFrame: self.view.frame];
    bg1.image = [UIImage imageNamed:@"bg"];
    [self.view addSubview:bg1];
    
    bg2 = [[UIImageView alloc]initWithFrame:CGRectMake(0,-screenHeight, screenWidth, screenHeight)];
    bg2.image = [UIImage imageNamed:@"bg"];
    [self.view addSubview:bg2];

    [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(bgmove) userInfo:nil repeats:true ];

//    创建敌机
    enemyPlaneArry = [NSMutableArray array];
    
    dex = screenWidth -35+1;
    for (int i =1; i<10; i++) {
        enermyPlane = [[UIImageView alloc]initWithFrame:CGRectMake(arc4random() %dex, -25, 35, 25)];
        enermyPlane.tag = 11;
        enermyPlane.image = [UIImage imageNamed: @"diji"];
        [self.view addSubview:enermyPlane];
        [enemyPlaneArry addObject:enermyPlane];
       
    }
    
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(findEnermyPlan) userInfo:nil repeats:YES];
    
    
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(planeDown) userInfo:nil repeats:YES];
    
//  创建飞机
    plane = [[UIImageView alloc]init];
//    plane = [[UIImageView alloc]initWithFrame];
    plane.image = [UIImage imageNamed:@"plane1"];
    plane.frame = CGRectMake(self.view.center.x/2, screenHeight-80,75,80);
    plane.tag = 33;
    [self.view addSubview:plane];
    
//    创建子弹
    
    bulletArray = [NSMutableArray array];
    bullet.tag =44;
    for (int i= 1; i<30; i++) {
        
        bullet = [[UIImageView alloc]initWithFrame:CGRectMake(0, -14, 7, 14)];
        bullet.image = [UIImage imageNamed:@"zidan"];
        
        [self.view addSubview:bullet];
        [bulletArray addObject:bullet];
    }
    
    
//    //    创建爆炸数组
//    
//    baozhaArry = @[[UIImage imageNamed:@"bz1"],[UIImage imageNamed:@"bz2"],[UIImage imageNamed:@"bz3"],[UIImage imageNamed:@"bz4"],[UIImage imageNamed:@"bz5"]];
//    //    [baozhaArry sortedArrayUsingSelector:@selector(compare:)];
//    
//    baozha = [[UIImageView alloc]init];
//    baozha.animationImages = baozhaArry;
//    baozha.animationDuration = 0.2;
//    baozha.animationRepeatCount =1;
//    [baozha startAnimating];
    

    
    
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(findzidain) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(fashe) userInfo:nil repeats:YES];
    

    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(judgement) userInfo:nil repeats:YES];

    
    
//    
//    if (CGPointEqualToPoint(enermyPlane.center, bullet.center)) {
//        [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(judgement) userInfo:nil repeats:YES];
//    }
    

    
    
}

-(void)judgement
{

    
        baozhaArry = @[[UIImage imageNamed:@"bz1"],[UIImage imageNamed:@"bz2"],[UIImage imageNamed:@"bz3"],[UIImage imageNamed:@"bz4"],[UIImage imageNamed:@"bz5"]];
    
        baozha = [[UIImageView alloc]init];
        baozha.animationImages = baozhaArry;
        baozha.animationDuration = 0.5;
        baozha.animationRepeatCount =1;

        [self.view addSubview:baozha];

//    for (UIImageView *enemyView in enemyPlaneArry)
//    {
//        if (enemyView.tag == 22)
//        {
//            for (UIImageView *bulletView in bulletArray)
//            {
//                if (bulletView.tag == 55)
//                {
//                    if (CGRectIntersectsRect(enemyView.frame, bulletView.frame))
//                    {
//                        baozha.frame = enemyView.frame;
//                        [baozha startAnimating];
//                        
//                        enemyView.frame =CGRectMake(arc4random()%dex, -25, 25, 25);
//                    
//                        
//                    }
//                }
//            }
//        }
//    }
    for (enermyPlane in enemyPlaneArry)
    {
        if (enermyPlane.tag == 22)
        {
            for (bullet in bulletArray  )
            {
                if (bullet.tag == 55)
                {
                    if (CGRectIntersectsRect(enermyPlane.frame, bullet.frame))
                    {
                        baozha.frame = enermyPlane.frame;
                        [baozha startAnimating];
                        
                        enermyPlane.frame =CGRectMake(arc4random()%dex, -25, 25, 25);
                        
                        
                    }
                }
            }
            if (CGRectIntersectsRect(enermyPlane.frame , plane.frame))
            {
                enermyPlane.frame =CGRectMake(arc4random()%dex, -25, 25, 25);
                baozha.frame = enermyPlane.frame;
                [baozha startAnimating];
                
                alerController = [UIAlertController alertControllerWithTitle:@"Gave over" message:@"" preferredStyle:(UIAlertControllerStyleAlert)];
                UIAlertAction * reStart = [UIAlertAction actionWithTitle:@"重新开始" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
                    
                    for( enermyPlane in enemyPlaneArry )
                    {
                        if (enermyPlane.tag == 22)
                        {
                           enermyPlane.frame =CGRectMake(arc4random()%dex, -25, 25, 25);
                        }
                    }
                      plane.frame =CGRectMake(self.view.center.x/2, screenHeight-80,75,80);
                }];
            
                [alerController addAction:reStart];
                [self presentViewController:alerController animated:YES completion:nil ];

            }
//            break;
        }
    }

    
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch =[touches anyObject];
     CGPoint touch_point1 = [touch locationInView:self.view];
    if (CGRectContainsPoint(plane.frame, touch_point1)) {
        plane.center  = touch_point1;
        begPoint =touch_point1;
    }
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch =[touches anyObject];
    CGPoint touch_point1 = [touch locationInView:self.view];
    if(CGRectContainsPoint(plane.frame,touch_point1))
    {
        float x1 = touch_point1.x-begPoint.x;
        float y1 = touch_point1.y-begPoint.y;
        plane.center = CGPointMake(x1+plane.center.x, y1+plane.center.y);
        begPoint = touch_point1;
    
    }
    
}


-(void)findzidain
{  for(bullet in bulletArray)
   {
    if (bullet.tag==44) {
        bullet.tag = 55;
        bullet.center= CGPointMake(plane.center.x, plane.frame.origin.y-7);
//        bullet.f
        break;
    }
   }
   
}

-(void)fashe
{
    for (bullet in bulletArray) {
        if (bullet.tag == 55) {
            bullet.center =CGPointMake(bullet.center.x, bullet.center.y-10);
        }
        if (bullet.frame.origin.y<=0  ) {
            bullet.frame = CGRectMake(0, -14, 7, 14);
            bullet.tag=44;
        }
        
        
    }
}


-(void)findEnermyPlan
{
   for(  enermyPlane in enemyPlaneArry)
   {  if(enermyPlane.tag == 11)
       {
          enermyPlane.tag = 22;
            break;
       }
   }
    
}

-(void)planeDown
{
  for(enermyPlane  in enemyPlaneArry)
    {
        if (enermyPlane.tag == 22) {
            
            enermyPlane.frame =CGRectMake(enermyPlane.frame.origin.x, enermyPlane.frame.origin.y+3, 25, 25);
            if (enermyPlane.frame.origin.y>=screenHeight) {
                enermyPlane.frame = CGRectMake(arc4random()%dex, -25, 25, 25);
                enermyPlane.tag=11;
            }
          

        }
    }
    
    
}



-(void) bgmove{
    bg1.frame = CGRectMake(0, bg1.frame.origin.y+4, screenWidth, screenHeight);
    bg2.frame = CGRectMake(0,bg2.frame.origin.y+4, screenWidth, screenHeight);
    if (bg1.frame.origin.y>=screenHeight) {
        bg1.frame = CGRectMake(0, -screenHeight, screenWidth, screenHeight);
    }
    if (bg2.frame.origin.y>=screenHeight) {
        bg2.frame =CGRectMake(0, -screenHeight, screenWidth, screenHeight);
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
