import 'dart:io';
import 'dart:convert';
import 'dart:async';

File file =	File(	'01-input.txt'	)	;

int leftLimit = 0 			;
int rightLimit = 99			;
int currentPosition = 50	;
int zeroCount = 0 			;


void main() async 
{
	await fileRead()	;
	print(zeroCount)	;
}

Future<void> fileRead() async 
{
	Stream fileStreamData	= file
								.openRead()
								.transform(	utf8.decoder	)
								.transform(	LineSplitter()	)	;

	await for(var line in fileStreamData){
		parseLine	(	line 	)	;
	}
}



void parseLine(String string)
{
	String lr = string[0];
	int? spaces = int.tryParse(
					string.substring(1)	)	;
		
	if(spaces == null) throw Exception();
	

	if(lr == 'L')
	{
		moveLeft(spaces)	;
	} else {
		moveRight(spaces)	;
	}

	if(currentPosition == 0) zeroCount++	;

}


void moveLeft(int spaces)
{

	int diff = currentPosition - spaces;

	if(	diff >= 0)
	{
		currentPosition -= spaces;
		return;
	}

	calculateCurrentPosition(diff);
}

void moveRight(	int spaces	)
{

	int diff = currentPosition + spaces;
	

	if(	diff <= 99)
	{
		currentPosition += spaces;
		return;
	}

	calculateCurrentPosition(diff);
}

void calculateCurrentPosition(int diff){
	if ( diff % 100 == 0)
	{
		currentPosition = 0;
	} else {
		currentPosition = diff % 100;
	}
}

