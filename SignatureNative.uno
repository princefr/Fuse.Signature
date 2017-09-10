namespace Native
{
	using Uno;
	using Fuse;
    using Uno.UX;
    using Fuse.Controls;
    using Fuse.Controls.Native;
    using Fuse.Scripting;
    using Uno.Compiler.ExportTargetInterop;


    internal interface SignatureHost
    {
        
    }


       internal interface ISignature
    {
		void ClearSignature();
		void Save(string fileName);
        
    }

    public partial class Signature : Control, SignatureHost
    {

    		ISignature SignatureView
		{
			get { return NativeView as ISignature; }
		}


			protected override IView CreateNativeView()
		{
			if defined(Android)
			{
				return new Native.Android.Signature(this);
			}
			else if defined(iOS)
			{
				return new Native.iOS.Signature(this);
			}
			else
			{
				return base.CreateNativeView();
			}
		}


    }
}