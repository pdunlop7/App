#import "TMBGoogle.h"
#import "TMBChoreography.h"
#import "TMBTembooSession.h"

@interface TextSearch : NSObject <TMBChoreographyDelegate>
-(void)runTextSearchChoreo;
-(void)choreographyDidFailWithError:(NSError*)error;
-(void)choreographyDidFinishExecuting:(TMBGoogle_Places_TextSearch_ResultSet*)result;
@end

@implementation TextSearch

-(void)runTextSearchChoreo {
	// Instantiate the Choreo, using a previously instantiated TembooSession object, eg:
	TMBTembooSession *session = [[TMBTembooSession alloc] initWithAccount:@"accountName" appKeyName:@"myFirstApp" andAppKeyValue:@"abc123xxxxxxxxxxxxxx"];
	
	// Create the choreo object using your Temboo session
	TMBGoogle_Places_TextSearch *textSearchChoreo = [[TMBGoogle_Places_TextSearch alloc] initWithSession:session];	
	
	// Get Inputs object for the choreo
	TMBGoogle_Places_TextSearch_Inputs *textSearchInputs = [textSearchChoreo newInputSet];

	// Set inputs
	[textSearchInputs setTypes:@"yourValueHere"];
	[textSearchInputs setLanguage:@"yourValueHere"];
	[textSearchInputs setKey:@"yourValueHere"];

	// Execute choreo specifying this class as the choreo delegate
	[textSearchChoreo executeWithInputs:textSearchInputs delegate:self];
}

// TMBChoreographyDelegate method implementation - handle choreo errors
-(void)choreographyDidFailWithError:(NSError*)error {
	// Log error to the console
	NSLog(@"Error - %@", error);
}

// TMBChoreographyDelegate method implementation - choreo executed successfully
-(void)choreographyDidFinishExecuting:(TMBGoogle_Places_TextSearch_ResultSet*)result {
	// Log results to the console
	NSLog(@"%@", [result getResponse]);
}

@end