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


#import "NTMapPos.h"
#import "NTGeometry.h"
@class NTGeometryVector;

/**
 * A generic multi geometry container.
 */
__attribute__ ((visibility("default"))) @interface NTMultiGeometry : NTGeometry
/** @internal:nodoc: */
-(void*)getCptr;
/** @internal:nodoc: */
-(id)initWithCptr: (void*)cptr swigOwnCObject: (BOOL)ownCObject;

/**
 * Creates a polymorphic instance of the given native object. This is used internally by the SDK.
 * @param cPtr The native pointer of the instance.
 * @param cMemoryOwn The ownership flag.
 * @return The new instance.
 */
/** @internal:nodoc: */
+(NTMultiGeometry*)swigCreatePolymorphicInstance:(void*)cPtr swigOwnCObject:(BOOL)cMemoryOwn;

/**
 * Constructs a MultiGeometry from a vector of geometry objects.<br>
 * @param geometries The geometries for multi geometry.
 */
-(id)initWithGeometries: (NTGeometryVector*)geometries;
-(NTMapPos*)getCenterPos;
/**
 * Returns the number of geometry objects in this multi geometry container.<br>
 * @return The number of geometry objects.
 */
-(int)getGeometryCount;
/**
 * Returns the geometry at the specified index. Index must be between 0 and getGeometryCount (exclusive)<br>
 * @param index The index of the geometry.<br>
 * @return The geometry at specified index.<br>
 * @throws NSException If the index is out of range.
 */
-(NTGeometry*)getGeometry: (int)index;
/**
 * Returns the raw pointer to the object. This is used internally by the SDK.<br>
 * @return The internal pointer of the object.
 */
/** @internal:nodoc: */
-(long long)swigGetRawPtr;
/**
 * Returns the actual class name of this object. This is used internally by the SDK.<br>
 * @return The class name of this object.
 */
/** @internal:nodoc: */
-(NSString*)swigGetClassName;
/**
 * Returns the pointer to the connected director object. This is used internally by the SDK.<br>
 * @return The pointer to the connected director object or null if director is not connected.
 */
/** @internal:nodoc: */
-(void *)swigGetDirectorObject;

-(void)dealloc;

@end


#ifdef __cplusplus
}
#endif
