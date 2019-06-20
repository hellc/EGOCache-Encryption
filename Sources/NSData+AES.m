//
//  NSData+AES.m
//  EGOCache macOS
//
//  Created by Ivan Manov on 20.06.2019.
//  Copyright © 2019
//

#import "NSData+AES.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation NSData (AES)

#pragma mark - Public methods

- (NSData *)aes_encryptedDataWithKey:(NSString *)key {
    return [self aes_encryptedDataWithKey:key iv:nil];
}

- (NSData *)aes_decryptedDataWithKey:(NSString *)key {
    return [self aes_decryptedDataWithKey:key iv:nil];
}

- (NSData *)aes_encryptedDataWithKey:(NSString *)key iv:(NSString *)iv {
    return [self operation:kCCEncrypt key:key iv:iv];
}

- (NSData *)aes_decryptedDataWithKey:(NSString *)key iv:(NSString *)iv {
    return [self operation:kCCDecrypt key:key iv:iv];
}

#pragma mark - Private methods

- (NSData *)operation:(CCOperation)operation key:(NSString *)key iv:(NSString *)iv {
    char keyPtr[kCCKeySizeAES128 + 1];
    
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    char ivPtr[kCCBlockSizeAES128 + 1];
    bzero(ivPtr, sizeof(ivPtr));
    if (iv) {
        [iv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    }
    
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(operation,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          ivPtr,
                                          [self bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    
    free(buffer);
    return nil;
}

@end

