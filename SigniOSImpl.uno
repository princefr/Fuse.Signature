namespace Native.iOS
{
	using Uno;
    using Uno.UX;
    using Uno.Compiler.ExportTargetInterop;

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
			debug_log Handle;
			ClearSignature(Handle);
		}


		  void ISignature.RetrievePicture()
		{
			debug_log "i have been pahhhhh";
			RetrievePicture(Handle);
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
         void RetrievePicture(ObjC.Object handle)
        @{

        	SignatureView* dp = (SignatureView*)handle;
			NSData *signatureData = [dp signatureData];
			NSString *base64String = [signatureData base64EncodedStringWithOptions:0];
			return base64String;
        @}




        [Foreign(Language.ObjC)]
         void ClearSignature(ObjC.Object handle)
        @{


        	NSLog(@"%s",  "mais putain");

        @}




    }


	
}