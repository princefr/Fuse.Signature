# Fuse.Signature

# Integration available

iOS and Android




# Displaying the signature paenl.

```
			<NativeViewHost>
				<Native.Signature ux:Name="SignMeIn"/>
			</NativeViewHost>

```


# Save The signature

For accessing Signature panel functions you will need to give a `ux:Name` to `Native.Signature` and call `Save(argument)` on it.
`Save(argument)` function accept one argument, the name of your file and his extension (should be .png)

```
<App>
	<ClientPanel>
		<Grid Rows="8*, 1*">
			<NativeViewHost>
				<Native.Signature ux:Name="SignMeIn"/>
			</NativeViewHost>

			<JavaScript>
			var Observable = require("FuseJS/Observable")

				exports.Save = function(){
					SignMeIn.Save("youhouuu.png");

				}


			</JavaScript>
		<Button Text="Save" Clicked="{Save}"/>
		</Grid>
	</ClientPanel>
</App>
```

# Clear Signature Panel

for clearing the signature pad, you will need to call your `ux:Name` with the Statement `ClearSignature()`. only work on android.
for `iOS` you will simply need to longPress on the screen to erase the last signature.

```
<App>
	<ClientPanel>
		<Grid Rows="8*, 1*">
			<NativeViewHost>
				<Native.Signature ux:Name="SignMeIn"/>
			</NativeViewHost>

			<JavaScript>
			var Observable = require("FuseJS/Observable")

				exports.Clear = function(){
					SignMeIn.ClearSignature();

				}


			</JavaScript>
		<Button Text="Clear" Clicked="{Clear}"/>
		</Grid>
	</ClientPanel>
</App>
```



