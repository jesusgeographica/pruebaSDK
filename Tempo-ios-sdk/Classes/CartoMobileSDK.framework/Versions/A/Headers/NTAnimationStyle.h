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
 * Possible animation types.
 */
typedef NS_ENUM(NSInteger, NTAnimationType) {
/**
 * No animation is applied.
 */
  NT_ANIMATION_TYPE_NONE,
/**
 * Step transition is applied at the middle of the animation.
 */
  NT_ANIMATION_TYPE_STEP,
/**
 * Linear transition is used for animation.
 */
  NT_ANIMATION_TYPE_LINEAR,
/**
 * Smooth transition with 2nd order continuity is used for animation.
 */
  NT_ANIMATION_TYPE_SMOOTHSTEP,
/**
 * Spring-like transition is used for animation.
 */
  NT_ANIMATION_TYPE_SPRING
};



/**
 * A class describing animation effect.
 */
__attribute__ ((visibility("default"))) @interface NTAnimationStyle : NSObject
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
 * Creates a polymorphic instance of the given native object. This is used internally by the SDK.
 * @param cPtr The native pointer of the instance.
 * @param cMemoryOwn The ownership flag.
 * @return The new instance.
 */
/** @internal:nodoc: */
+(NTAnimationStyle*)swigCreatePolymorphicInstance:(void*)cPtr swigOwnCObject:(BOOL)cMemoryOwn;


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
 * Returns the relative speed of the animation.<br>
 * @return The relative speed of the animation (1.0 corresponds to the default speed).
 */
-(float)getRelativeSpeed;
/**
 * Returns the phase-in duration of the animation.<br>
 * @return The phase-in duration of the animation in seconds.
 */
-(float)getPhaseInDuration;
/**
 * Returns the phase-out duration of the animation.<br>
 * @return The phase-out duration of the animation in seconds.
 */
-(float)getPhaseOutDuration;
/**
 * Returns the fade animation type.<br>
 * @return The type of the fade animation.
 */
-(enum NTAnimationType)getFadeAnimationType;
/**
 * Returns the size-related animation type.<br>
 * @return The type of the size-related animation.
 */
-(enum NTAnimationType)getSizeAnimationType;
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

