#import "TMBGoogle.h"
#import "TMBChoreography.h"
#import "TMBTembooSession.h"

@interface PlaceSearch : NSObject <TMBChoreographyDelegate>
-(void)runPlaceSearchChoreo;
-(void)choreographyDidFailWithError:(NSError*)error;
-(void)choreographyDidFinishExecuting:(TMBGoogle_Places_PlaceSearch_ResultSet*)result;
@end

@implementation PlaceSearch

-(void)runPlaceSearchChoreo {
	// Instantiate the Choreo, using a previously instantiated TembooSession object, eg:
	TMBTembooSession *session = [[TMBTembooSession alloc] initWithAccount:@"accountName" appKeyName:@"myFirstApp" andAppKeyValue:@"abc123xxxxxxxxxxxxxx"];
	
	// Create the choreo object using your Temboo session
	TMBGoogle_Places_PlaceSearch *placeSearchChoreo = [[TMBGoogle_Places_PlaceSearch alloc] initWithSession:session];	
	
	// Get Inputs object for the choreo
	TMBGoogle_Places_PlaceSearch_Inputs *placeSearchInputs = [placeSearchChoreo newInputSet];

	// Set inputs
	[placeSearchInputs setKey:@"yourValueHere"];

	// Execute choreo specifying this class as the choreo delegate
	[placeSearchChoreo executeWithInputs:placeSearchInputs delegate:self];
}

// TMBChoreographyDelegate method implementation - handle choreo errors
-(void)choreographyDidFailWithError:(NSError*)error {
	// Log error to the console
	NSLog(@"Error - %@", error);
}

// TMBChoreographyDelegate method implementation - choreo executed successfully
-(void)choreographyDidFinishExecuting:(TMBGoogle_Places_PlaceSearch_ResultSet*)result {
	// Log results to the console
	NSLog(@"%@", [result getResponse]);
}

@end