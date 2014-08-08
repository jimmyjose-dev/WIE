![WIE][1] WebsiteImageExtractor
=====================

Extract all images from weblink


----------

Steps to add framework
---------

> 1) Drag and drop WIEFramework.framework to your project 2) Add
> libxml2.2


----------

Sample code
---------
    - (void)viewDidLoad {
	[super viewDidLoad];

	NSString *weblink = @"http://www.varshylmobile.com/";

	VMWIE *vm = [VMWIE instance];
	vm.delegate = self;
	[vm extractImagesForURL:weblink];
    }
    -(void)imageExtractFinishedWithPaths:(NSArray *)imageSourcePath{
    //imagePath of images extracted in imageSourcePath
        }

----------

Demo app
---------

Demo app included to get you started

----------


Credit
---------------

The framework uses HTMLParser written by Ben Reeves


----------


Contact Us
---------------

Have any questions or suggestions feel free to write at jimmy@varshyl.com (Jimmy Jose)
http://www.varshylmobile.com/


  [1]: http://i57.tinypic.com/k19evq.png

