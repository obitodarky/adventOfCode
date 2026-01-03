import 'read_input_file.dart';
import 'globals.dart';

late int remainder;

void main(List<String> args) async 
{
	if(args.isEmpty) throw FormatException('must pass filename first');

	await fileRead(args[0], parseLine)			;
	print('counter at zero: $zeroCount')		;
	print('zeros passed:  $zerosPassed')		;
	print('total: ${zeroCount + zerosPassed}')	;
}


void parseLine(String string)
{
	String lr = string[0];
	int? spaces = int.tryParse(
					string.substring(1)	)	;
		
	if(spaces == null) throw Exception()	;	




	start(spaces);
	turnDial(spaces, lr);
	stop();	

}

void start(int spaces){
	final divs = spaces ~/ 100;
	zerosPassed += divs;

 	remainder = spaces % 100;
}


void turnDial(int spaces, String lr){
	if(lr == 'L')
	{
		moveLeft(spaces)	;
	} else {
		moveRight(spaces)	;
	}
}


void stop(){
	if(currentPosition == 100) currentPosition = 0;

	if(currentPosition == 0) zeroCount++ ;
}


void moveLeft(int spaces) {
    int newPos = currentPosition - remainder;
    if (newPos < 0) {
        if (currentPosition != 0) {
            zerosPassed++;
        }
        currentPosition = newPos + 100;
    } else {
        currentPosition = newPos;
    }
}

void moveRight(int spaces) {
    int newPos = currentPosition + remainder; 
    if (newPos > 100) {
        if (currentPosition != 0) {
            zerosPassed++;
        }
        currentPosition = newPos - 100;
    } else {
        currentPosition = newPos;
    }
}
