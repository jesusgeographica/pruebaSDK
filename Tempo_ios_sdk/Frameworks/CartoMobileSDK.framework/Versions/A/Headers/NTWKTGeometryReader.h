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


#import "NTGeometry.h"

/**
 * A reader for Well Known Text representation of the geometry.
 */
__attribute__ ((visibility("default"))) @interface NTWKTGeometryReader : NSObject
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
 * Constructs a WKTGeometryReader object.
 */
-(id)init;
/**
 * Reads geometry from the specified WKT string.<br>
 * @param wkt The WKT string to read. For example, "POINT(1,1)"<br>
 * @return The geometry read from the string. Null if reading failed.<br>
 * @throws NSException If reading fails.
 */
-(NTGeometry*)readGeometry: (NSString*)wkt;

-(void)dealloc;

@end


#ifdef __cplusplus
}
#endif
