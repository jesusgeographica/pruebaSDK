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
#import "NTBitmap.h"
#import "NTGeometry.h"
#import "NTPointGeometry.h"
#import "NTLabelStyle.h"
#import "NTBillboard.h"

/**
 * An abstract billboard element with a dynamically drawn bitmap that can be displayed on the map.
 */
__attribute__ ((visibility("default"))) @interface NTLabel : NTBillboard
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
+(NTLabel*)swigCreatePolymorphicInstance:(void*)cPtr swigOwnCObject:(BOOL)cMemoryOwn;

/**
 * Draws a custom bitmap for this label that will be used for drawing the label on the map.<br>
 * The method is called each time the label gets reloaded internally.<br>
 * @param dpToPX The value used for converting display independent pixels (dp) to pixels (px).<br>
 * @return The custom label bitmap.
 */
-(NTBitmap*)drawBitmap: (float)dpToPX;
/**
 * Returns the style of this label.<br>
 * @return The style that defines what this label looks like.
 */
-(NTLabelStyle*)getStyle;
/**
 * Sets the style for this label.<br>
 * @param style The new style that defines what this marker looks like.
 */
-(void)setStyle: (NTLabelStyle*)style;
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
