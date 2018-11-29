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
#import "NTProjection.h"
#import "NTRoutingInstruction.h"
@class NTMapPosVector;
@class NTRoutingInstructionVector;

/**
 * A class that defines list of routing actions and path geometry.
 */
__attribute__ ((visibility("default"))) @interface NTRoutingResult : NSObject
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
 * Constructs a new RoutingResult instance from projection, points and instructions.<br>
 * @param projection The projection of the routing result (same as the request).<br>
 * @param points The point list defining the routing path. Instructions refer to this list.<br>
 * @param instructions The turn-by-turn instruction list.
 */
-(id)initWithProjection: (NTProjection*)projection points: (NTMapPosVector*)points instructions: (NTRoutingInstructionVector*)instructions;
/**
 * Returns the projection of the points in the result.<br>
 * @return The projection of the result.
 */
-(NTProjection*)getProjection;
/**
 * Returns the point list of the result. The list contains all the points the route must pass in correct order.<br>
 * @return The point list of the path.
 */
-(NTMapPosVector*)getPoints;
/**
 * Returns the turn-by-turn instruction list.<br>
 * @return The turn-by-turn instruction list.
 */
-(NTRoutingInstructionVector*)getInstructions;
/**
 * Returns the total distance of the path.<br>
 * @return The total distance in meters.
 */
-(double)getTotalDistance;
/**
 * Returns the approximate total duration of the path.<br>
 * @return The total duration in seconds.
 */
-(double)getTotalTime;
/**
 * Creates a string representation of this result object, useful for logging.<br>
 * @return The string representation of this result object.
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
