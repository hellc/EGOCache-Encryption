//
//  NSData+AES.h
//  EGOCache macOS
//
//  Created by Ivan Manov on 20.06.2019.
//  Copyright © 2019
//

#import <Foundation/Foundation.h>

@interface NSData (AES)

/**
 Encrypt operation with key.

 @param key Raw key material
 @return Encrypted data
 */
- (NSData *)aes_encryptedDataWithKey:(NSString *)key;

/**
 Decrypt operation with key.

 @param key Raw key material
 @return Decrypted data
 */
- (NSData *)aes_decryptedDataWithKey:(NSString *)key;

/**
 Encrypt operation with key and initialization vector.

 @param key Raw key material
 @param iv initialization vector
 @return Encrypted data
 */
- (NSData *)aes_encryptedDataWithKey:(NSString *)key iv:(NSString *)iv;

/**
 Decrypt operation with key and initialization vector.

 @param key Raw key material
 @param iv initialization vector
 @return Decrypted data
 */
- (NSData *)aes_decryptedDataWithKey:(NSString *)key iv:(NSString *)iv;

@end
