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
 * An immutable map tile, used by tile layers for representing small pieces of map at different zoom levels and coordinates.
 */
__attribute__ ((visibility("default"))) @interface NTMapTile : NSObject
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
 * Constructs an empty MapTile object.
 */
-(id)init;
/**
 * Constructs a MapTile object based on coordinates, zoom level and frame number.<br>
 * @param x The x coordinate of the tile.<br>
 * @param y The y coordinate of the tile.<br>
 * @param zoom The zoom level of the tile.<br>
 * @param frameNr The frame number of the tile.
 */
-(id)initWithX: (int)x y: (int)y zoom: (int)zoom frameNr: (int)frameNr;
/**
 * Returns the x coordinate of this map tile.<br>
 * @return The x coordinate of this map tile.
 */
-(int)getX;
/**
 * Returns the y coordinate of this map tile.<br>
 * @return The y coordinate of this map tile.
 */
-(int)getY;
/**
 * Returns the zoom level of this map tile.<br>
 * @return The zoom level of this map tile.
 */
-(int)getZoom;
/**
 * Returns the time of this map tile.<br>
 * @return The time of this map tile.
 */
-(int)getFrameNr;
/**
 * Returns the internal tile id of this map tile.<br>
 * @return The internal tile id of this map tile.
 */
-(long long)getTileId;
/**
 * Checks for equality between this and another map tile.<br>
 * @param tile The other map tile.<br>
 * @return True if equal.
 */
-(BOOL)isEqualInternal: (NTMapTile*)tile;
/**
 * Returns the hash value of this object.<br>
 * @return The hash value of this object.
 */
-(int)hashInternal;
/**
 * Creates a string representation of this map tile, useful for logging.<br>
 * @return The string representation of this map tile.
 */
-(NSString*)description;
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

