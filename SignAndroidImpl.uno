namespace Native.Android
{
	using Uno;
    using Uno.UX;
    using Uno.Compiler.ExportTargetInterop;

    using Fuse.Controls.Native.Android;




	[Require("Gradle.Dependency.Compile", "com.github.gcacace:signature-pad:1.2.1")]
	[ForeignInclude(Language.Java, "com.github.gcacace.signaturepad.views.SignaturePad", "com.github.gcacace.signaturepad.utils.SvgBuilder")]
	[ForeignInclude(Language.Java, "com.fuse.Activity", "android.util.Log", "android.graphics.Bitmap", "java.io.FileOutputStream", "android.graphics.Bitmap.CompressFormat")]
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


		  void ISignature.Save(string fileName)
		{
			Save(Handle, fileName);
			debug_log "bresson";
		}



        [Foreign(Language.Java)]
        static Java.Object Create()
        @{

        	SignaturePad mSignaturePad = new SignaturePad(@(Activity.Package).@(Activity.Name).GetRootActivity(), null);
        	return mSignaturePad;

        @}


        [Foreign(Language.Java)]
        void Save(this Java.Object handle, string fileName)
        @{

        	SignaturePad signaturePad = (SignaturePad)handle;
        	try{
        	Bitmap signatureBitmap = signaturePad.getSignatureBitmap();
        	String path = Activity.getRootActivity().getFilesDir().getAbsolutePath() + "/" + fileName;
        	FileOutputStream os;
        	os = new FileOutputStream(path, false);
	    	signatureBitmap.compress(CompressFormat.PNG, 80, os);
			os.flush();
			os.close();
        	}catch(Exception e){
        		android.util.Log.e("myexception", e.toString());
        	}
        @}





        [Foreign(Language.Java)]
        void ClearSignature(Java.Object handle)
        @{

        	SignaturePad msignaturePad = (SignaturePad)handle;
        	msignaturePad.clear();
            
        @}




    }



	
}