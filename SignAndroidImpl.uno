namespace Native.Android
{
	using Uno;
    using Uno.UX;
    using Uno.Compiler.ExportTargetInterop;

    using Fuse.Controls.Native.Android;




	[Require("Gradle.Dependency.Compile", "com.github.gcacace:signature-pad:1.2.1")]
	[ForeignInclude(Language.Java, "com.github.gcacace.signaturepad.views.SignaturePad", "com.github.gcacace.signaturepad.utils.SvgBuilder")]
	[ForeignInclude(Language.Java, "com.fuse.Activity", "android.util.Log", "android.graphics.Bitmap")]
    extern(Android) class Signature : LeafView, ISignature
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


		  void ISignature.RetrievePicture()
		{
			debug_log Handle;
			RetrievePicture(Handle);
		}



        [Foreign(Language.Java)]
        static Java.Object Create()
        @{

        	SignaturePad mSignaturePad = new SignaturePad(@(Activity.Package).@(Activity.Name).GetRootActivity(), null);
        	return mSignaturePad;

        @}


        [Foreign(Language.Java)]
        void RetrievePicture(Java.Object handle)
        @{
        	android.util.Log.d("myexception", "truuuuuuuuu");
        	try{
        	Bitmap signatureBitmap = ((SignaturePad)handle).getSignatureBitmap();

        	}catch(Exception e){
        		android.util.Log.e("myexception", e.toString());
        	}
        @}



        [Foreign(Language.Java)]
        void ClearSignature(Java.Object handle)
        @{
        	((SignaturePad)handle).clear();
            
        @}

    }



	
}