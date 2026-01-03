import 'dart:convert';
import 'dart:io';



Future<void> fileRead(String filename, Function(String string) onLineRead) async 
{
	File file =	File(filename)	;
	Stream fileStreamData	= file
								.openRead()
								.transform(	utf8.decoder	)
								.transform(	LineSplitter()	)	;

	await for(var line in fileStreamData)
	{
		onLineRead(line);
	}
}
