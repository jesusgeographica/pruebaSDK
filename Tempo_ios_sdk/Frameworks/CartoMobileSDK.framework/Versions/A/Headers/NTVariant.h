/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 2.0.11
 *
 * This file is not intended to be easily readable and contains a number of
 * coding conventions designed to improve portability and efficiency. Do not make
 * changes to this file unless you know what you are doing--modify the SWIG
 * interface file instead.
 * ----------------------------------------------------------------------------- */

#import <Foundation/Foundation.h>


#ifdef __cplusplus
extern "C" {
#endif

/**
 * Variant type.
 */
typedef NS_ENUM(NSInteger, NTVariantType) {
/**
 * Null element.
 */
  NT_VARIANT_TYPE_NULL,
/**
 * String element.
 */
  NT_VARIANT_TYPE_STRING,
/**
 * Boolean element.
 */
  NT_VARIANT_TYPE_BOOL,
/**
 * Integer element.
 */
  NT_VARIANT_TYPE_INTEGER,
/**
 * Double-precision floating point element.
 */
  NT_VARIANT_TYPE_DOUBLE,
/**
 * Array element.
 */
  NT_VARIANT_TYPE_ARRAY,
/**
 * Object (dictionary) element.
 */
  NT_VARIANT_TYPE_OBJECT
};


#import "NTStringVector.h"
@class NTVariantVector;
@class NTStringVariantMap;

/**
 * JSON value. Can contain JSON-style structured data, including objects and arrays.
 */
__attribute__ ((visibility("default"))) @interface NTVariant : NSObject
{
  /** @internal:nodoc: */
  void *swigCPtr;
  /** @internal:nodoc: */
  BOOL swigCMemOwn;
}
/** @internal:nodoc: */
-(void*)getCptr;
/** @internal:nodoc: */
-(id)initWithCptr: (void*)cptr swigOwnCObject: (BOOL)ownCObject;

/**  
 * Checks if this object is equal to the specified object.
 * @param object The reference object.
 * @return True when objects are equal, false otherwise.
 */
-(BOOL)isEqual:(id)object;

/**
 * Returns the hash value of this object.
 * @return The hash value of this object.
 */
-(NSUInteger)hash;

/**
 * Constructs a null Variant object.
 */
-(id)init;
/**
 * Constructs Variant object from a boolean.<br>
 * @param boolVal The boolean value.
 */
-(id)initWithBoolVal: (BOOL)boolVal;
/**
 * Constructs Variant object from an integer.<br>
 * @param longVal The integer value.
 */
-(id)initWithLongVal: (long long)longVal;
/**
 * Constructs Variant object from a double.<br>
 * @param doubleVal The double value.
 */
-(id)initWithDoubleVal: (double)doubleVal;
/**
 * Constructs Variant object from a string.<br>
 * @param string The string value.
 */
-(id)initWithString: (NSString*)string;
/**
 * Constructs Variant object from a list of values.<br>
 * @param array The array of JSON values.
 */
-(id)initWithArray: (NTVariantVector*)array;
/**
 * Constructs Variant object from a map of values.<br>
 * @param object The map of JSON values.
 */
-(id)initWithObject: (NTStringVariantMap*)object;
/**
 * Returns the type of this variant.<br>
 * @return The type of this variant.
 */
-(enum NTVariantType)getType;
/**
 * Returns the string value of this variant.<br>
 * @return The string value of the variant. If the variant is not string, empty string will be returned.
 */
-(NSString*)getString;
/**
 * Returns the boolean value of this variant.<br>
 * @return The boolean value of the variant. If the variant is not boolean, false will be returned.
 */
-(BOOL)getBool;
/**
 * Returns the integer value of this variant.<br>
 * @return The integer value of the variant. If the variant is not integer, 0 will be returned.
 */
-(long long)getLong;
/**
 * Returns the floating point value of this variant.<br>
 * @return The floating point value of the variant. If the variant is integer, it will be converted to floating point. Otherwise 0.0 is be returned.
 */
-(double)getDouble;
/**
 * Returns the number of elements in the array.<br>
 * @return The number of elements in the array if the variant is of array type. Otherwise 0 is returned.
 */
-(int)getArraySize;
/**
 * Returns the element of array at specified position.<br>
 * @param idx The index of the array element to return (starting from 0).<br>
 * @return The array element at specified position or null type if the element does not exist or the variant is not an array.
 */
-(NTVariant*)getArrayElement: (int)idx;
/**
 * Returns all the keys in the object.<br>
 * @return The list containing all the keys of the object if the variant is of object type. Otherwise empty list is returned.
 */
-(NTStringVector*)getObjectKeys;
/**
 * Returns true if object elements contains the specified key.<br>
 * @param key The key of the object element to check.<br>
 * @return True if the specified exists in the object. If the element is not an object or the key does not exist, false is returned.
 */
-(BOOL)containsObjectKey: (NSString*)key;
/**
 * Returns the element of object with the specified key.<br>
 * @param key The key of the object element to return.<br>
 * @return The object element with the specified key or null type if the element does not exist or the variant is not an object.
 */
-(NTVariant*)getObjectElement: (NSString*)key;
/**
 * Checks for equality between this and another variant object.<br>
 * @param var The other variant object.<br>
 * @return True if equal.
 */
-(BOOL)isEqualInternal: (NTVariant*)var;
/**
 * Returns the hash value of this object.<br>
 * @return The hash value of this object.
 */
-(int)hashInternal;
/**
 * Converts the variant to JSON string.<br>
 * @return The JSON string corresponding to the variant.
 */
-(NSString*)description;
/**
 * Creates a Variant object from a JSON string representation.<br>
 * @param str The JSON string to use for the variant.<br>
 * @return The corresponding Variant object.<br>
 * @throws NSException If the string parsing fails.
 */
+(NTVariant*)fromString: (NSString*)str;
/**
 * Returns the raw pointer to the object. This is used internally by the SDK.<br>
 * @return The internal pointer of the object.
 */
/** @internal:nodoc: */
-(long long)swigGetRawPtr;

-(void)dealloc;

@end


#import "NTStringVector.h"
@class NTVariantVector;
@class NTStringVariantMap;

__attribute__ ((visibility("default"))) @interface NTVariantVector : NSObject
{
	/** @internal:nodoc: */
	void *swigCPtr;
	/** @internal:nodoc: */
	BOOL swigCMemOwn;
}
/** @internal:nodoc: */
-(void*)getCptr;
/** @internal:nodoc: */
-(id)initWithCptr: (void*)cptr swigOwnCObject: (BOOL)ownCObject;
-(id)init;
-(unsigned int)size;
-(unsigned int)capacity;
-(void)reserve: (unsigned int)n;
-(BOOL)isEmpty;
-(void)clear;
-(void)add: (NTVariant*)x;
-(NTVariant*)get: (int)i;
-(void)set: (int)i val: (NTVariant*)val;
/**
 * Returns the raw pointer to the object. This is used internally by the SDK.<br>
 * @return The internal pointer of the object.
 */
/** @internal:nodoc: */
-(long long)swigGetRawPtr;

-(void)dealloc;

@end


#import "NTStringVector.h"
@class NTVariantVector;
@class NTStringVariantMap;

__attribute__ ((visibility("default"))) @interface NTStringVariantMap : NSObject
{
	/** @internal:nodoc: */
	void *swigCPtr;
	/** @internal:nodoc: */
	BOOL swigCMemOwn;
}
/** @internal:nodoc: */
-(void*)getCptr;
/** @internal:nodoc: */
-(id)initWithCptr: (void*)cptr swigOwnCObject: (BOOL)ownCObject;
-(id)init;
-(id)initWithArg0: (NTStringVariantMap*)arg0;
-(unsigned int)size;
-(BOOL)empty;
-(void)clear;
-(NTVariant*)get: (NSString*)key;
-(void)set: (NSString*)key x: (NTVariant*)x;
-(void)del: (NSString*)key;
-(BOOL)has_key: (NSString*)key;
-(NSString*)get_key: (unsigned int)idx;
/**
 * Returns the raw pointer to the object. This is used internally by the SDK.<br>
 * @return The internal pointer of the object.
 */
/** @internal:nodoc: */
-(long long)swigGetRawPtr;

-(void)dealloc;

@end


#ifdef __cplusplus
}
#endif
