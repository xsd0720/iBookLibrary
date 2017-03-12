//
//  IBLQRCodeTool.m
//  iBookLibrary
//
//  Created by FaiWong on 2017/3/12.
//  Copyright © 2017年 FaiWong. All rights reserved.
//

#import "IBLQRCodeTool.h"
#import "IBLSystemTool.h"
#import "IBLSoundTool.h"
@interface IBLQRCodeTool()<AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic) AVCaptureInput *input;

@property (nonatomic) AVCaptureMetadataOutput *output;

@property (nonatomic) AVCaptureSession *captureSession;

@property (nonatomic) AVCaptureVideoPreviewLayer *previewLayer;

@property (nonatomic) IBLQRCodeToolSuccessBlock successBlock;


@end

@implementation IBLQRCodeTool

+ (IBLQRCodeTool *)shareInstance
{
    static IBLQRCodeTool *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[IBLQRCodeTool alloc] init];
    });
    return sharedInstance;
}

- (void)startScanFromCameraInView:(UIView *)superView success:(IBLQRCodeToolSuccessBlock)success
{
    if (![IBLSystemTool isCanVisitCamera]) {
        return;
    }
 
    self.successBlock = success;
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    NSError *inputError;
    self.input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&inputError];
    if (inputError) {
        NSLog(@"create captureInput error%@", [inputError localizedDescription]);
        return;
    }
    
    self.output = [[AVCaptureMetadataOutput alloc] init];
    [self.output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    self.output.rectOfInterest = CGRectMake(0, 0, 1, 1);
    
    
    self.captureSession = [[AVCaptureSession alloc] init];
    self.captureSession.sessionPreset = AVCaptureSessionPresetHigh;
    
    [self.captureSession addInput:self.input];
    [self.captureSession addOutput:self.output];
    
    
//    self.output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode, AVMetadataObjectTypeEAN13Code,  AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
    
    //session 添加output时，output.metadataObjectTypes 会被置空，所以在以后进入二维码支持类型设置
    //全类型支持
    self.output.metadataObjectTypes = @[AVMetadataObjectTypeUPCECode, AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode39Mod43Code, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code,AVMetadataObjectTypeCode93Code, AVMetadataObjectTypeCode128Code, AVMetadataObjectTypePDF417Code, AVMetadataObjectTypeQRCode, AVMetadataObjectTypeAztecCode];
    

    self.previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.captureSession];
    
    self.previewLayer.frame = superView.layer.bounds;
    self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    
    [superView.layer addSublayer:self.previewLayer];

    [self.captureSession startRunning];

}


- (void)stopScanFromCamera
{
    [self.captureSession stopRunning];
    [self.previewLayer removeFromSuperlayer];
}

#pragma mark - - - 二维码扫描代理方法
// 调用代理方法，会频繁的扫描
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    
    [self stopScanFromCamera];
    
    [IBLSoundTool playWithFileURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"qrcode_found" ofType:@"wav"]]];

    // 3、设置界面显示扫描结果
    if (metadataObjects.count > 0) {
        AVMetadataMachineReadableCodeObject *obj = metadataObjects[0];
//        NSLog(@"metadataObjects = %@", metadataObjects);
        
        if (self.successBlock) {
            self.successBlock(obj.stringValue);
        }
    }
}


- (NSString *)startScanWithImage:(UIImage *)image
{
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{ CIDetectorAccuracy : CIDetectorAccuracyHigh }];
    
    NSArray *features = [detector featuresInImage:[CIImage imageWithCGImage:image.CGImage]];
    
    if (features.count == 0) {
        return nil;
    }
    
    NSMutableArray *scanResult = [[NSMutableArray alloc] init];
    [features enumerateObjectsUsingBlock:^(CIQRCodeFeature *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [scanResult addObject:obj.messageString];
    }];
    return [scanResult firstObject];
}

@end
