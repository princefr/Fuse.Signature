namespace Native.iOS
{
	using Uno;
    using Uno.UX;
    using Uno.Compiler.ExportTargetInterop;
    using Fuse.Scripting;

    using Fuse.Controls.Native.iOS;


    [Require("Source.Include", "SignatureView.h")]
	[Require("Source.Include", "UIKit/UIKit.h")]
    extern(iOS) class  Signature: LeafView, ISignature
    {

		SignatureHost _host;
		public Signature(SignatureHost host) : base(Create())
		{
			_host = host;

		}


          void ISignature.ClearSignature()
		{

			ClearSignature(Handle);
		}


		  void ISignature.Save(string fileName)
		{
			debug_log "i have been pahhhhh";
			Save(Handle, fileName);
		}



        [Foreign(Language.ObjC)]
        static ObjC.Object Create()
        @{
        	UIView* c = [[UIView alloc] init];
            CGRect frame = CGRectMake(0, 40, 320, 300);
            id view = [[SignatureView alloc] initWithFrame:frame];
            [c addSubview:view];
            return view;
        @}



        [Foreign(Language.ObjC)]
         void Save(ObjC.Object handle, string fileName)
        @{

        	SignatureView* dp = (SignatureView*)handle;
			NSData *signatureData = [dp signatureData];
            NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
            NSString *path = [documentsDirectory stringByAppendingPathComponent:fileName];
            [signatureData writeToFile:path atomically:YES];
            NSLog(@"%@", path);

			//return base64String;
        @}




        [Foreign(Language.ObjC)]
         void ClearSignature(ObjC.Object handle)
        @{


        	NSLog(@"%s",  "mais putain");

        @}




    }


	
}