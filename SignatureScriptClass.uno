using Uno;
using Uno.Compiler.ExportTargetInterop;
using Uno.Time;

using Fuse;
using Fuse.Controls;
using Fuse.Controls.Native;
using Fuse.Scripting;



namespace Native
{
	public partial class Signature
	{
		static Signature()
		{
					ScriptClass.Register(typeof(Signature),
				new ScriptMethod<Signature>("RetrievePicture", RetrievePicture, ExecutionThread.MainThread),
				new ScriptMethod<Signature>("ClearSignature", ClearSignature, ExecutionThread.MainThread));
		}


			static void RetrievePicture(Context c, Signature signature, object[] args)
		{
			var dpv = signature.SignatureView;
			var filename = (string)args[0];
			if (args.Length != 1)
			{
				Fuse.Diagnostics.UserError( "retrieve requires 1 argument, the value of the item", signature);
				return;
			}else{
				if(dpv != null){
				dpv.RetrievePicture(filename);
				}
			}

		}


			static void ClearSignature(Context c, Signature signature, object[] args)
		{
			var dpv = signature.SignatureView;
			if(dpv != null){
				dpv.ClearSignature();
			}


		}
	}
}