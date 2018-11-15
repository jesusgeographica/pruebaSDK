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


#import "NTReverseGeocodingService.h"
#import "NTReverseGeocodingRequest.h"
#import "NTGeocodingResult.h"
#import "NTProjection.h"

/**
 * An online reverse geocoding service that uses Mapzen Pelias geocoder.<br>
 * As the class connects to an external (non-CARTO) service, this class is provided "as-is",   <br>
 * future changes from the service provider may not be compatible with the implementation.<br>
 * Be sure to read the Terms and Conditions of your Pelias service provider to see if the<br>
 * service is available for your application.<br>
 * Note: this class is experimental and may change or even be removed in future SDK versions.
 */
__attribute__ ((visibility("default"))) @interface NTPeliasOnlineReverseGeocodingService : NTReverseGeocodingService
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
+(NTPeliasOnlineReverseGeocodingService*)swigCreatePolymorphicInstance:(void*)cPtr swigOwnCObject:(BOOL)cMemoryOwn;

/**
 * Constructs a new instance of the PeliasOnlineReverseGeocodingService given API key.<br>
 * @param apiKey The API key to use (registered with Mapzen).
 */
-(id)initWithApiKey: (NSString*)apiKey;
/**
 * Returns the language of the expected results.<br>
 * @return The language of the expected results. As BCP47 code or empty string.
 */
-(NSString*)getLanguage;
/**
 * Sets the language of the expected results.<br>
 * @param lang The language to use as BCP47 code. Empty string can be used for default language.
 */
-(void)setLanguage: (NSString*)lang;
/**
 * Returns the custom backend service URL.<br>
 * @return The custom backend service URL. If this is not defined, an empty string is returned.
 */
-(NSString*)getCustomServiceURL;
/**
 * Sets the custom backend service URL. <br>
 * The custom URL may contain tag "{api_key}" which will be substituted with the set API key.<br>
 * @param serviceURL The custom backend service URL to use. If this is empty, then the default service is used.
 */
-(void)setCustomServiceURL: (NSString*)serviceURL;
-(NTGeocodingResultVector*)calculateAddresses: (NTReverseGeocodingRequest*)request;
-(NTGeocodingResultVector*)calculateAddressesSwigExplicitNTPeliasOnlineReverseGeocodingService: (NTReverseGeocodingRequest*)request;
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
