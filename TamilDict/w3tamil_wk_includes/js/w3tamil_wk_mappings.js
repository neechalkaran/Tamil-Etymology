﻿   /**
	*	Project Name	: w3TamilWK - w3Tamil Web Keyboard 
	*	@ Version		: 1.2.1 (15 January, 2008)
	*	@ Version		: 1.2 (January, 2008)
	*	@ Version		: 1.1 (December, 2006)
	*	Author			: T.Siva
	*	Copyright (C) 2006 - 2008  T.Siva (w3tamil AT gmail DOT com) OR (developer AT w3tamil DOT com)
	*	Project Home Page: http://wk.w3tamil.com
	*	Latest Versions will be available at: http://sourceforge.net/projects/w3tamilwk/
	*/
   /**
    *	ABOUT w3TamilWK v1.2
	*	+	Added all features of the Tamil99 Keyboard standard
	*	-	Gives the virtual/web keyboard interface to easily input Tamil Unicode characters 
	*		based on Tamil99 keyboard layout.
	*		-	Tamil99 is the computer keyboard layout defined as the primary standard layout 
	*			for inputting Tamil in computers. 
	*		-	Tamil99 keyboard layout is the computer-input method for Tamil, 
	*			recommended by Tamilnadu Government and by IT institutions in Sri lanka. 
	*	-	w3TamilWK runs on latest browsers
	*	-	This is one of the Open Source Software project hosted on Sourceforge.net
	*/
   /**
	*	This file is part of w3TamilWK (w3Tamil Web Keyboard).
	*
	*   w3TamilWK is free software; you can redistribute it and/or modify
	*   it under the terms of the GNU General Public License as published by
	*   the Free Software Foundation; either version 2 of the License, or
	*   (at your option) any later version.
	*
	*   w3TamilWK is distributed in the hope that it will be useful,
	*   but WITHOUT ANY WARRANTY; without even the implied warranty of
	*   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	*   GNU General Public License for more details.
	*
	*   You should have received a copy of the GNU General Public License
	*   along with w3TamilWK; if not, write to the Free Software
	*   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
	*/
var tamPul = "்";//need
var tamVow = ["ஆ","ஈ","ஊ","ஐ","ஏ","இ",	"உ","எ","ஔ","ஓ","ஒ"];//need
var tamCon = ["ள","ற","ன","ட","ண","ச",	"ஞ","க","ப","ம","த","ந","ய","வ","ங","ல","ர","ழ","ஸ","ஷ","ஜ",	"ஹ"];//need

var langMapping = {

"`" : ["`"],	"~" : ["~"],
"1" : ["1"],	"!" : ["!"],
"2" : ["2"],	"@" : ["@"],
"3" : ["3"],	"#" : ["#"],
"4" : ["4"],	"$" : ["$"],
"5" : ["5"],	"%" : ["%"],
"6" : ["6"],	"^" : ["^"],
"7" : ["7"],	"&" : ["&"],
"8" : ["8"],	"*" : ["*"],
"9" : ["9"],	"(" : ["("],
"0" : ["0"],	")" : [")"],
"-" : ["-"],	"_" : ["_"],
"=" : ["="],	"+" : ["+"],
"backspace" : ["backspace"],	
"tab" : ["tab"],	
"q" : ["ஆ"],	"Q" : ["ஸ"],
"w" : ["ஈ"],	"W" : ["ஷ"],
"e" : ["ஊ"],	"E" : ["ஜ"],
"r" : ["ஐ"],	"R" : ["ஹ"],
"t" : ["ஏ"],	"T" : ["க்ஷ"],
"y" : ["ள"],	"Y" : ["ஸ்ரீ"],
"u" : ["ற"],	"U" : ["ற"],
"i" : ["ன"],	"I" : ["ன"],
"o" : ["ட"],	"O" : ["["],
"p" : ["ண"],	"P" : ["]"],
"[" : ["ச"],	"{" : ["{"],
"]" : ["ஞ"],	"}" : ["}"],
"\\" : ["\\"],	"|" : ["|"],
"capslock" : ["capslock"],	
"a" : ["அ"],	"A" : ["௹"],
"s" : ["இ"],	"S" : ["௺"],
"d" : ["உ"],	"D" : ["௸"],
"f" : ["்"],	"F" : ["ஃ"], 
"g" : ["எ"],	"G" : ["எ"],
"h" : ["க"],	"H" : ["க"],
"j" : ["ப"],	"J" : ["ப"],
"k" : ["ம"],	"K" : ["\""],
"l" : ["த"],	"L" : [":"],
";" : ["ந"],	":" : [";"],
"\'" : ["ய"],	"\"" : ["\'"],
"enter" : ["enter"],	
"shift1" : ["shift1"],	
"z" : ["ஔ"],	"Z" : ["௳"],
"x" : ["ஓ"],	"X" : ["௴"],
"c" : ["ஒ"],	"C" : ["௵"],
"v" : ["வ"],	"V" : ["௶"],
"b" : ["ங"],	"B" : ["௷"],
"n" : ["ல"],	"N" : ["ல"],
"m" : ["ர"],	"M" : ["ர"],
"," : [","],	"<" : ["<"],
"." : ["."],	">" : [">"],
"/" : ["ழ"],	"?" : ["?"],
"shift2" : ["shift2"],	
"ctrl1" : ["ctrl1"],	
"win1" : ["win1"],	
"alt1" : ["alt1"],	
" " : [" "],	
"alt2" : ["alt2"],	
"win2" : ["win2"],	
"ctrl2" : ["ctrl2"]	
}
var clickMapping = {

"1" : "`",	"501" : "~",
"2" : "1",	"502" : "!",
"3" : "2",	"503" : "@",
"4" : "3",	"504" : "#",
"5" : "4",	"505" : "$",
"6" : "5",	"506" : "%",
"7" : "6",	"507" : "^",
"8" : "7",	"508" : "&",
"9" : "8",	"509" : "*",
"10" : "9",	"510" : "(",
"11" : "0",	"511" : ")",
"12" : "-",	"512" : "_",
"13" : "=",	"513" : "+",
"14" : "backspace",	"514" : "backspace",
"15" : "tab",	"515" : "tab",
"16" : "q",	"516" : "Q",
"17" : "w",	"517" : "W",
"18" : "e",	"518" : "E",
"19" : "r",	"519" : "R",
"20" : "t",	"520" : "T",
"21" : "y",	"521" : "Y",
"22" : "u",	"522" : "U",
"23" : "i",	"523" : "I",
"24" : "o",	"524" : "O",
"25" : "p",	"525" : "P",
"26" : "[",	"526" : "{",
"27" : "]",	"527" : "}",
"28" : "\\",	"528" : "|",
"29" : "capslock",	"529" : "capslock",
"30" : "a",	"530" : "A",
"31" : "s",	"531" : "S",
"32" : "d",	"532" : "D",
"33" : "f",	"533" : "F",
"34" : "g",	"534" : "G",
"35" : "h",	"535" : "H",
"36" : "j",	"536" : "J",
"37" : "k",	"537" : "K",
"38" : "l",	"538" : "L",
"39" : ";",	"539" : ":",
"40" : "\'",	"540" : "\"",
"41" : "enter",	"541" : "enter",
"42" : "shift1",	"542" : "shift1",
"43" : "z",	"543" : "Z",
"44" : "x",	"544" : "X",
"45" : "c",	"545" : "C",
"46" : "v",	"546" : "V",
"47" : "b",	"547" : "B",
"48" : "n",	"548" : "N",
"49" : "m",	"549" : "M",
"50" : ",",	"550" : "<",
"51" : ".",	"551" : ">",
"52" : "/",	"552" : "?",
"53" : "shift2",	"553" : "shift2",
"54" : "ctrl1",	"554" : "ctrl1",
"55" : "win1",	"555" : "win1",
"56" : "alt1",	"556" : "alt1",
"57" : " ",	"557" : " ",
"58" : "alt2",	"558" : "alt2",
"59" : "win2",	"559" : "win2",
"60" : "ctrl2",	"560" : "ctrl2"
}
var engTamExp = {//need
"q": "ா",
"w": "ீ",
"e": "ூ",
"r": "ை",
"t": "ே",
"s": "ி",
"d": "ு",
"g": "ெ",
"z": "ௌ",
"x": "ோ",
"c": "ொ",
"f": "்"
//"f": //added
};
var uirVis = { //need - click
"ஆ": "ா",
"ஈ": "ீ",
"ஊ": "ூ",
"ஐ": "ை",
"ஏ": "ே",
"இ": "ி",
"உ": "ு",
"எ": "ெ",
"ஔ": "ௌ",
"ஓ": "ோ",
"ஒ": "ொ"
};

var keyIdCode = {
"192" : "1",
"49" : "2",
"50" : "3",
"51" : "4",
"52" : "5",
"53" : "6",
"54" : "7",
"55" : "8",
"56" : "9",
"57" : "10",
"48" : "11",
"189" : "12",
"187" : "13",
"8" : "14",
"9" : "15",
"81" : "16",
"87" : "17",
"69" : "18",
"82" : "19",
"84" : "20",
"89" : "21",
"85" : "22",
"73" : "23",
"79" : "24",
"80" : "25",
"219" : "26",
"221" : "27",
"220" : "28",
"20" : "29",
"65" : "30",
"83" : "31",
"68" : "32",
"70" : "33",
"71" : "34",
"72" : "35",
"74" : "36",
"75" : "37",
"76" : "38",
"186" : "39",
"222" : "40",
"13" : "41",
"16" : "42",
"90" : "43",
"88" : "44",
"67" : "45",
"86" : "46",
"66" : "47",
"78" : "48",
"77" : "49",
"188" : "50",
"190" : "51",
"191" : "52",
"16" : "53",
"17" : "54",
"91" : "55",
"18" : "56",
"32" : "57",
"18" : "58",
"91" : "59",
"17" : "60"
}