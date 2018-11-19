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


#import "NTMapBounds.h"
#import "NTMapPos.h"
#import "NTGeometry.h"
#import "NTBillboardStyle.h"
#import "NTVectorElement.h"

/**
 * A base class for billboard elements that can be displayed on the map.<br>
 * Billboards can either be given a concrete position on the map or be attached to<br>
 * other billboards.
 */
__attribute__ ((visibility("default"))) @interface NTBillboard : NTVectorElement
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
+(NTBillboard*)swigCreatePolymorphicInstance:(void*)cPtr swigOwnCObject:(BOOL)cMemoryOwn;

/**
 * Returns the base billboard this billboard is attached to.<br>
 * @return The base billboard this billboard is attached to. Null if not attached to a billboard.
 */
-(NTBillboard*)getBaseBillboard;
/**
 * Attaches this billboard to another billboard, so it will always be drawn relative to the base billboard.<br>
 * If this billboard has a geometry object assigned to it, it will first be set to null.<br>
 * @param baseBillboard The billboard this billboard will be attached to.
 */
-(void)setBaseBillboard: (NTBillboard*)baseBillboard;
/**
 * Returns the bounds of this billboard or the base billboard, if there is one.<br>
 * @return The bounds of this billboard.
 */
-(NTMapBounds*)getBounds;
/**
 * Returns the location of the root billboard. If this billboard has a location,<br>
 * this method is equavalent to the Billboard::getGeometry method. If this billboard is attached <br>
 * to another billboard, the hierarchy is traveled recursively and the location of the root <br>
 * billboard is returned. <br>
 * @return The geometry object that defines the location of the root billboard. Null if there's no root billboard.
 */
-(NTGeometry*)getRootGeometry;
/**
 * Returns the geometry object that defines the location of this billboard.<br>
 * @return The geometry object of this billboard.
 */
-(NTGeometry*)getGeometry;
/**
 * Sets the location for this billboard. If this billboard is attached<br>
 * to another billboard, it will first be detached.<br>
 * @param geometry The new geometry object that defines the location of this billboard.
 */
-(void)setGeometry: (NTGeometry*)geometry;
/**
 * Sets the location for this billboard. If this billboard is attached<br>
 * to another billboard, it will first be detached.<br>
 * @param pos The new map position that defines the location of this billboard.
 */
-(void)setPos: (NTMapPos*)pos;
/**
 * Returns the rotation angle of this billboard.<br>
 * @return The rotation angle of this billboard in degrees.
 */
-(float)getRotation;
/**
 * Sets the rotation angle of this billboard. The rotation angle is ignored if orientation mode is<br>
 * set to BillboardOrientation::FACE_CAMERA_BILLBOARD. If the orientation mode is set to <br>
 * BillboardOrientation::FACE_CAMERA_GROUND then the rotation angle is added to the calculated billboard <br>
 * angle. If the orientation mode is set to BillboardOrientation::GROUND then the rotation means absolute<br>
 * rotation, where 0 is points to the north.<br>
 * @param rotation The new rotation angle of this billboard in degrees.
 */
-(void)setRotation: (float)rotation;
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
