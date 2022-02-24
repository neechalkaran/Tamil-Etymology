   /**
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
	/*--------------------------------------------------------------------------
								CUSTOMIZATIONS
								o-	START	-o
	--------------------------------------------------------------------------*/
var mouseOverStyleVal = "2px inset #ccc";		//Mouse Over Key border Style 
var mouseOutStyleVal = "2px outset #E9E9E9";	//Mouse out Key border Style 
var keyPressStyleVal = "1px inset #ccc";		//Mouse click Key border Style
var textControlIdValue = "txtNames1"; //ID value of the targeted textbox or textarea 
	/*--------------------------------------------------------------------------
								o-	E N D	-o
								CUSTOMIZATIONS
	--------------------------------------------------------------------------*/

var keyCode;				//	Key value (integer)
var key; 					//	Key value (Character)
var keyCheck;				//	This object has values replaceKey, newKeyCode, newKey
var prevChar;				//	Previous character of the current cursor position
var newKey; 				//	Final new Key Value
var toggleEngTam = -1; 		// 	If Tamil = -1; If English = 1
var capsLockOn = -1; 		//	capslock on = 1 and off = -1
var shiftOn = 0; 			//	shift on = 1 and off = 0

//new variables in Ver 1.2 w3TamilWK
var consecutiveCons = 0;
var consecutiveConsVal = "";
var disableJoin=0;
var caretOn = 0;
var consecutiveCaretOn = 0;



	/*--------------------------------------------------------------------------
						Keyboard KEY PRESS CLICK related methods
								o-	START	-o
	--------------------------------------------------------------------------*/
//main function 
function addCharKeyPress(textControl, evt, keyChecker){
	hideStatusBarBottom();
	listenCurrentEvent(evt);
	toggleShift(keyCode,16,16);
	toggleCapsLock(keyCode,20)
	if(capsLockOn==1|| shiftOn==1){
		keyCode = String.fromCharCode(keyCode).toUpperCase().charCodeAt();
		if (keyCode) key = String.fromCharCode(keyCode);
	}
	if(toggleEngTam == -1 )
	{
			keyCheck = keyChecker(keyCode, key);
			return transKey(textControl, evt, keyChecker);
	}
}
function listenCurrentEvent(evt){
	if(typeof evt.which != 'undefined') keyCode = evt.which;
	else if(typeof evt.keyCode != 'undefined') keyCode = evt.keyCode;
	else if(typeof evt.charCode != 'undefined') keyCode = evt.charCode;
	else keyCode = 0;
  	if (keyCode) key = String.fromCharCode(keyCode);
	
}
function toggleShift(title,val1,val2){
	if(title == val1 ||title==val2) shiftOn = 1; //Shift key is in On mode
	else shiftOn = 0; //Shift key is in off mode
}
function toggleCapsLock(title,val){
	if(title == val) capsLockOn = -(capsLockOn);
}
function hideStatusBarBottom(){
	document.getElementById('shiftcaps_status').innerHTML = "";
}
var enterKeyCount=0;
//To find the new values of the keyCode and key.
function engToTam (keyCode, key) {
    if (keyCode != 13 && keyCode != 27) //Enter key's keyCode = 13
	    cha = langMapping[String.fromCharCode(keyCode)][0];
	else
		cha = ""; //To fix the "langMapping[..][0] is null or not an object" error when press Enter 
	if (cha) {
    	return { 	replaceKey: true,
             		newKeyCode: cha.charCodeAt(), 	
             		newKey: cha 					
				};
  	}
  	else {
    	return { cancelKey: false };
  	}
}
function transKey (textControl, evt, keyChecker) {
  	if (keyCode && window.event && !window.opera) { //for IE
    	if (keyCheck.cancelKey) {
      		return false;
    	}
    	else if (keyCheck.replaceKey) {
			if (window.event.preventDefault) {
        		window.event.preventDefault();
      		}
			setNewKey(textControl,keyCheck.newKey,engTamExp[key]);
			return false;
    	}
    	else {
      		return true;
    	}
  	}
  	else if (typeof textControl.setSelectionRange != 'null') { //for FF
    	if (keyCheck.cancelKey) {
      		if (evt.preventDefault) {
        		evt.preventDefault();
      		}
      		return false;
    	}
    	else if (keyCheck.replaceKey) {
			if (evt.preventDefault) {
				evt.preventDefault();
			}
			setNewKey(textControl,keyCheck.newKey,engTamExp[key]);
      		return false;
    	}
    	else {
      		return true;
    	} 
  	}
  	else if (keyCheck.cancelKey) {
    	if (evt.preventDefault) {
      		evt.preventDefault();
    	}
    	return false;
  	}
  	else {
    	return true;
  	}
}
function setNewKey(textControl,newKeyVal,vowGlyph){
	var pos = getCursorPosition(textControl);
	prevChar = getPrevChar(textControl.value,pos);	
	newKey = newKeyVal;

	//if(newKey == "^" && textControl.value.length==0) 
		//caretOn = 1;
		
	analyzedNewKey(vowGlyph);
	textControl.value = textControl.value.substring(0, pos) + newKey +	textControl.value.substring(pos);
	textControl.focus();
	inc = pos+newKey.length;
	setCursorPosition(textControl,inc,inc,oldpos=pos);
}
function getCursorPosition(textControl){
	if(document.selection)
		return getCursorPositionIE(textControl);
	else if(typeof textControl.setSelectionRange != 'undefined')
		return getCursorPositionFF(textControl);
	else 
		return textControl.length;
}
function getCursorPositionIE(textControl){
	var len = textControl.value.length;
	var pos = -1;
	if(document.selection)
	{
		sel = document.selection.createRange();
		obj = textControl.createTextRange();
		obj.moveToBookmark(sel.getBookmark());
		obj.moveEnd('character',textControl.value.length);
		pos = len - obj.text.length;	
	}
		
		
	return pos;
}
function getCursorPositionFF(textControl){
	var currentSelectionStart=-1,currentSelectionEnd=-1;
	if(typeof textControl.setSelectionRange != 'undefined'){
		currentSelectionStart = textControl.selectionStart;
		currentSelectionEnd = textControl.selectionEnd;
		//In our case, both has same value
	}
	return currentSelectionStart;
}
function getPrevChar(txt,currentPosition){
	return txt.substring(currentPosition-1,currentPosition);
}
function analyzedNewKey(vowGlyph){

	newKeyPerm = newKey;//To keep the original value of newKey
	
	if(prevChar){		
			
		//to track the consecutive same constants
		if(prevChar==newKey && tamCon.toString().indexOf(prevChar)!=-1 && disableJoin!=1)
			consecutiveCons++;
		else consecutiveCons = 0;

		if(newKey==prevChar && newKey!=consecutiveConsVal && consecutiveConsVal!="")
			consecutiveCons=1;
		
		//Tamil99 Rules = 4,5
		//to put automatic pulli between two consecutive same consonant
		if(newKey==prevChar && tamCon.toString().indexOf(prevChar)!=-1 && consecutiveCons%2 && consecutiveCons!=0 && disableJoin!=1)
		{
			newKey = "்"+newKey;
			consecutiveConsVal = prevChar;
			disableJoin = 0;
		}

		//Tamil99 Rule = 7
		//to put automatic pulli between two consecutive soft and hard consonant
		if( ((prevChar=="ங" && newKey=="க") || (prevChar=="ஞ" && newKey=="ச")|| (prevChar=="ந" && newKey=="த")|| (prevChar=="ண" && newKey=="ட")|| (prevChar=="ம" && newKey=="ப")|| (prevChar=="ன" && newKey=="ற"))  && disableJoin!=1)
		{
			newKey = "்"+newKey;
			consecutiveCons++;
			
		}
		
		//to enter visiri instead of ii
		if(tamCon.toString().indexOf(prevChar)!=-1 && tamVow.toString().indexOf(newKey)!=-1 && vowGlyph && disableJoin!=1)
			newKey = vowGlyph;

		//Tamil99 Rule = 6
		//to remove அ after a consonant/ To avoid the join with a consonant
		if(newKeyPerm=="அ" && tamCon.toString().indexOf(prevChar)!=-1 )
		{
			newKey = "";
			disableJoin=1;
		}else disableJoin = 0;


		//to avoid multiple pulli
		if(newKey==tamPul && tamCon.toString().indexOf(prevChar)==-1 )
			newKey = "ஃ";
		
	}else{
		//to remove 1st character pulli
		if(newKey==tamPul)
			newKey = "";
	}
	
	//Tamil99 Rule = 10
	if(caretOn && newKeyPerm==".") {newKey = "•";caretOn = 0;}
	if(caretOn && newKeyPerm=="௵") {newKey = "©";caretOn = 0;}//v1.2.1

	//Tamil99 Rule = 11
	if(caretOn && newKeyPerm=="7") {newKey = "‘";caretOn = 0;}
	if(caretOn && newKeyPerm=="8") {newKey = "’";caretOn = 0;}
	if(caretOn && newKeyPerm=="9") {newKey = "“";caretOn = 0;}
	if(caretOn && newKeyPerm=="0") {newKey = "”";caretOn = 0;}
	if(caretOn && newKeyPerm=="s") {newKey = " ";caretOn = 0;}
	
	//Tamil99 Rule = 9
	if((caretOn && newKeyPerm=="ஆ") || (caretOn && newKeyPerm=="இ")|| (caretOn && newKeyPerm=="ஈ")|| (caretOn && newKeyPerm=="உ")|| (caretOn && newKeyPerm=="ஊ")|| (caretOn && newKeyPerm=="எ")|| (caretOn && newKeyPerm=="ஏ")|| (caretOn && newKeyPerm=="ஐ")|| (caretOn && newKeyPerm=="ஒ")|| (caretOn && newKeyPerm=="ஓ")|| (caretOn && newKeyPerm=="ஔ") ) {newKey = uirVis[newKeyPerm];caretOn = 0;}//v1.2.1
	if(caretOn && newKeyPerm =="^"){newKey = "^";caretOn = 0;consecutiveCaretOn=1}
	//w3Tamil addition for rule - 9
	if(caretOn && newKey=="ஃ") {newKey = "்";caretOn = 0;}
	
	//Tamil99 Rules = 9,10,11
	if(consecutiveCaretOn!=1 && newKeyPerm == "^"){ 
		newKey = ""; 
		caretOn = 1
	}
	consecutiveCaretOn = 0; //Tamil99 Rule = 10
	
}
function setCursorPosition(textControl,oStart,oEnd,oldpos) {
	if( textControl.setSelectionRange ) {
		textControl.setSelectionRange(oStart,oEnd);
	} 
	else if( textControl.createTextRange ) {
		var obj = textControl.createTextRange();
		obj.collapse(true);
		obj.moveEnd('character',oEnd);
		obj.moveStart('character',oStart);
		obj.select();
	}
}
	/*--------------------------------------------------------------------------
								o-	END -o
						Keyboard KEY PRESS CLICK related methods
	--------------------------------------------------------------------------*/

	/*--------------------------------------------------------------------------
						Keyboard MOUSE CLICK and Other EVENTs related methods
								o-	START	-o
	--------------------------------------------------------------------------*/
function addW3Tamil (character) {
    var title = parseInt(character.id);
	var textControl = document.getElementById(textControlIdValue);
	textControl.focus();
	character.style.border = keyPressStyleVal;
	toggleCapsLock(title,29);
	if(!(title==29 || title==42 || title==53)){
		if(shiftOn || capsLockOn==1) title = title+500;
		newKey = "";
		if(clickMapping[title])
		if(toggleEngTam == -1){
			if(langMapping[clickMapping[title]][0])
				newKey = langMapping[clickMapping[title]][0];	
		}else{
			if(clickMapping[title])
				newKey = clickMapping[title];	
		}
		setNewKey(textControl,newKey,uirVis[newKey]);
	}
	toggleShift(title,42,53);
	displayStatusBar();	
	displayStatusBarBottom();

}
function displayStatusBar(){
	
	document.getElementById('lang_status').innerHTML = "<b>Language Mode</b> = <a href='#' title='Indicates the Input Language mode; Click here to change the language mode' onclick='toggleEngTam=-toggleEngTam;displayStatusBar();'>"+((toggleEngTam==-1)?"  Tamil":"English")+"</a><i>(To change, click on the link OR press</i> <font color='brown'>F8</font><i> key)</i><br />";			 
	document.getElementById('keyboard_status').style.width = "90%";
	document.getElementById('keyboard_status').style.padding = "3px";
	document.getElementById('keyboard_status').style.border = "1px solid #fff";
	SetFocus();
}
function displayStatusBarBottom(){
	document.getElementById('shiftcaps_status').innerHTML = "<b>SHIFT</b> = "+((shiftOn==1)?" On":"Off")+"; <b>CAPSLOCK</b> = "+((capsLockOn==1)?" On":"Off");			 
}
	/*--------------------------------------------------------------------------
								o-	END	-o
						Keyboard MOUSE CLICK and Other EVENTs related methods
	--------------------------------------------------------------------------*/
	/*--------------------------------------------------------------------------
							Other methods
								o-	START	-o
	--------------------------------------------------------------------------*/
function toggleLangMode(evt)
{
	listenCurrentEvent(evt);
	if(keyCode == 119) toggleEngTam = -(toggleEngTam); //F8 key's keyCode = 119
	toggleShift(keyCode,16,16); //shift key's keyCode = 16
	toggleCapsLock(keyCode,20) //capslock key's keyCode = 20
	displayStatusBar();
}
function keyDownBorder(obj){
	if(keyIdCode[keyCode])
		document.getElementById(keyIdCode[keyCode]).style.border = mouseOverStyleVal;
}
function keyUpBorder(kid){
	for(i=1;i<=60;i++)
		document.getElementById(i).style.border = mouseOutStyleVal;
}
function overW3Tamil(obj){
	obj.style.border = mouseOverStyleVal;
}
function outW3Tamil(obj){
	obj.style.border = mouseOutStyleVal;
}
function copyit() {
	var textControl= document.getElementById(textControlIdValue);
	var alertMsg1 = "You've selected";
	var alertMsg2="";
	textControl.focus();
	textControl.select();
	if(typeof textControl.createTextRange!= 'undefined'){
		therange=textControl.createTextRange();
		therange.execCommand("Copy");
		alertMsg2=" and copied into the clipboard successfully.";
	}else alertMsg2=" successfully.\n To copy use one of the following:\n* EDIT->COPY \nor\n* RIGHT MOUSE CLICK->COPY";
	alert(alertMsg1+alertMsg2);
}
	/*--------------------------------------------------------------------------
								o-	END	-o
							Other methods
	--------------------------------------------------------------------------*/