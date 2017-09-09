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
				new ScriptMethod<Signature>("ClearSignature", RetrievePicture, ExecutionThread.MainThread));
		}


			static void RetrievePicture(Context c, Signature signature, object[] args)
		{
			var dpv = signature.SignatureView;
			if(dpv != null){
				dpv.RetrievePicture();
			}
			debug_log "hhababba";

		}


			static void ClearSignature(Context c, Signature signature, object[] args)
		{
			var dpv = signature.SignatureView;
			if(dpv != null){
				dpv.ClearSignature();
			}

			debug_log "hhababba";

		}
	}
}