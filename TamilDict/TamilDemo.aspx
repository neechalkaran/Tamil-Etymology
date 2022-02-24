<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TamilDemo.aspx.cs" Inherits="JQueryEx._Default" %>

<?xml version="1.0" encoding="ISO-8859-1" ?>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head runat="server">

    <title>தமிழ்நாடு அரசு - செந்தமிழ்ச் சொற்பிறப்பியல் பேரகரமுதலி</title>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
        // For typing tamil texts
        // Load the Google Transliterate API
        google.load("elements", "1", {
            packages: "transliteration"
        });

        function onLoad() {
            var options = {
                sourceLanguage:
                google.elements.transliteration.LanguageCode.ENGLISH,
                destinationLanguage:
                [google.elements.transliteration.LanguageCode.TAMIL],
                shortcutKey: 'ctrl+g',
                transliterationEnabled: true
            };

            // Create an instance on TransliterationControl with the required
            // options.

            var control = new google.elements.transliteration.TransliterationControl(options);

            // Enable transliteration in the textbox with id
            // 'comments'.
            control.makeTransliteratable(['txtNames1']);
        }
        google.setOnLoadCallback(onLoad);

        function SetFocus() {
            document.getElementById("txtNames1").focus();
        }
        
        function backspc() {
            var value = document.getElementById("txtNames1").value;
            document.getElementById("txtNames1").value = value.substr(0, value.length - 1);
            SetFocus();
        }
        function callbuttonclick() {
            /*do your javascript coding here*/
            document.getElementById('<%= btnSearch.ClientID %>').click();
            // we are firing onClick event for  asp button btnsave form javascript.
        }
    </script>
<link href="js/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="style/font.css" rel="stylesheet" type="text/css" />
    <link href="style/style.css" rel="stylesheet" type="text/css" />
    <style>
			#popup {
				width: 300px;
				height: 200px;
				position: absolute;
				color: #000000;
				background-color: #ffffff;
				/* To align popup window at the center of screen*/
				top: 60%;
				left: 70%;
				margin-top: -170px;
				margin-left: -120px;
			}
		</style>
    <script src="js/jquery-1.12.0.js" type="text/javascript"></script>
    <script src="js/jquery-ui.js" type="text/javascript"></script>
    
    <script type="text/javascript">
        function pop(div) {
            document.getElementById('btnKeyboard').value = 'தமிழ் விசைப்பலகை - மறைக்க';
            document.getElementById(div).style.display = 'block';
            SetFocus();
        }
        function hide(div) {
            document.getElementById('btnKeyboard').value = 'தமிழ் விசைப்பலகை - காட்டுக';
            document.getElementById(div).style.display = 'none';
        }
        //To detect escape button
        document.onkeydown = function(evt) {
            evt = evt || window.event;
            if (evt.keyCode == 27) {
                hide('popDiv');
            }
        };

        function toggle() {
            var el = document.getElementById("popDiv");

            if (el.style.display == 'none') {
                pop('popDiv'); 
            } else {
                hide('popDiv');
            }
            SetFocus();
            return false;
        }
        function displayLangBar() {
            document.getElementById('lang_status').innerHTML = "<b>Language Mode</b> = <a href='#' title='Indicates the Input Language mode; Click here to change the language mode' onclick='toggleEngTam=-toggleEngTam;displayStatusBar();'>" + ((toggleEngTam == -1) ? "  Tamil" : "English") + "</a><i>(To change, click on the link OR press</i> <font color='brown'>F8</font><i> key)</i>";
            SetFocus();
        }
		</script>
    <!--script src="jquery-1.12.0.js" type="text/javascript"></script>
    <script src="jquery-ui.js" type="text/javascript"></script-->

    <!--script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script-->
   <!--script src="http://code.jquery.com/jquery-1.10.1.min.js" type="text/javascript"></script-->
  
    <!--	w3TamilWK - Section 1 - START	--> 
    <script language="JavaScript1.2" src="w3tamil_wk_includes/js/w3tamil_wk_library.js" type="text/javascript"></script>
    <script language="JavaScript1.2" src="w3tamil_wk_includes/js/w3tamil_wk_mappings.js" type="text/javascript"></script>
    <link rel="stylesheet" href="w3tamil_wk_includes/css/w3tamil_wk_style.css" />
    <!--	w3TamilWK - Section 1 - END	--> 	
    <script type="text/javascript">
        $(document).ready(function() {
            $('#txtNames1').autocomplete({
                source: 'NamesHandler.ashx',
                minLength: 2
            });
        });
            
        function validateInput(txtNames1) {
            if (txtNames1.value == "") {
                alert("Please enter the search text");
                txtNames1.focus()
                return false;
            }
            else
                return true;
        }

       
    </script>

<script language=javascript>

    //function checkImage() {
    {

        //var img = document.getElementById("divimages").getElementsByTagName("<img>");
        //alert(img);
    }

</script>
    
</head>
<body>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color: #e7e7e7;">
                        <tbody>
                            <tr>
                                <td>
                                    <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
                                        <tbody>
                                            <tr>
                                                <td width="6%" rowspan="4">
                                                    <img src="images/logo.png" alt="logo">
                                                </td>
                                                <td width="65%" style="font-size: 16px; color: #63666a;" align="left">
                                                    <B>தமிழ்நாடு அரசு <BR> செந்தமிழ்ச் சொற்பிறப்பியல் அகரமுதலித் திட்ட இயக்ககம்</B>
                                                </td>
                                                  <td width="35%" rowspan="4" style="font-size: 10px; font-weight: bold; color: #63666a;">
                                                         <B>தொடர்புக்கு<BR><BR>
                                                          இயக்குநர்,<BR>
                                                          செந்தமிழ்ச் சொற்பிறப்பியல் அகரமுதலித் திட்ட இயக்ககம்,<BR>
                                                          முதல் தளம், மையத் தொழில்நுட்பப் பயிலக வளாகம்,<BR>
                                                          தரமணி, சென்னை – 600 113.<BR><BR>
                                                         தொலைபேசி: 044 22541209. </B>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="24" style="font-size: 16px; color: red;" valign="bottom" align="left">
                                                    செந்தமிழ்ச் சொற்பிறப்பியல் பேரகரமுதலி
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="18" valign="top" style="font-family: verdana; font-size: 16px; color: #0000FF;"
                                                    align="left">
                                                    A Comprehensive Etymological Dictionary of the Tamil Language</br></br>
                                                </td>
                                               
                                             </tr>
                                        </tbody>
                                    </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" style="background-color: #c3dfef;">
                                        <tbody>
                                            <tr valign=middle>
                                                <td width=10%></td>
                                                <td>
                                                    <table width=100% border="0" cellspacing="0" cellpadding="0" align="center">
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <form id="tfnewsearch" runat="server">
                                                                    <input type="text" id="txtNames1" runat="server" class="tftextinput"></input>
                                                                    <!--textarea name="editor"  cols="40" rows="6" id="editor" onkeypress="return addCharKeyPress(this, event,engToTam);" onkeyDown="toggleLangMode(event);keyDownBorder(this);" onkeyup="keyUpBorder(this)"></textarea-->
                                                                    &nbsp;
                                                                    <asp:Button ID="btnSearch" class="tfbutton btstyle" runat="server" Text="தேடு" 
                                                                        onclick="btnSearch_Click" />
                                                                    &nbsp;<asp:Button ID="btnKeyboard" class="tfbutton btstyle" runat="server" Text="தமிழ் விசைப்பலகை - காட்டுக" />
                                                                    </form>
                                                                </td>
                                                                <td>
                                                                    <div id="lang_status" style="font-family: verdana; font-size: 10px;"></div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <table width="1024" border="0" cellspacing="0" cellpadding="0" style="background-color:White">
                        <tbody>
                            <tr>
                                <td width=40px>
                                </td>
                                <td>
                                    <asp:Label ID="lblMessages" runat="server" Font-Size="14px"></asp:Label>
                                    <asp:Label ID="lblResults" runat="server" Font-Size="16px"></asp:Label>
                                </td>
                                <td valign="top">
                                    <div id="divimages" runat="server">
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div id="popDiv" class="ontop" style="display:none">
			        <table border="0" id="popup">
                    <tr>
                            <td>
                            <div id="keyboard_container" runat=server>
                                <div id="keyboard" align="center">
                                    <div id="row_1">
                                        <span id="key_1_1"><img id="1" src="w3tamil_wk_includes/images99/approx.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_1_2"><img id="2" src="w3tamil_wk_includes/images99/1.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_1_3_"><img id="3" src="w3tamil_wk_includes/images99/2.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_1_4"><img id="4" src="w3tamil_wk_includes/images99/3.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_1_5"><img id="5" src="w3tamil_wk_includes/images99/4.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_1_6"><img id="6" src="w3tamil_wk_includes/images99/5.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_1_7"><img id="7" src="w3tamil_wk_includes/images99/6.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_1_8"><img id="8" src="w3tamil_wk_includes/images99/7.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_1_9"><img id="9" src="w3tamil_wk_includes/images99/8.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_1_10"><img id="10" src="w3tamil_wk_includes/images99/9.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_1_11"><img id="11" src="w3tamil_wk_includes/images99/0.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_1_12"><img id="12" src="w3tamil_wk_includes/images99/minus.gif" width="29" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_1_13"><img id="13" src="w3tamil_wk_includes/images99/plus.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_1_14"><img id="14" src="w3tamil_wk_includes/images99/backspace.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="backspc()"/></span>
                                    </div>
                                    <div id="row_2">
                                        <span id="key_2_1"><img id="15" src="w3tamil_wk_includes/images99/tab.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)"/></span>
                                        <span id="key_2_2"><img id="16" src="w3tamil_wk_includes/images99/Q.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_2_3"><img id="17" src="w3tamil_wk_includes/images99/W.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_2_4"><img id="18" src="w3tamil_wk_includes/images99/E.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_2_5"><img id="19" src="w3tamil_wk_includes/images99/R.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_2_6"><img id="20" src="w3tamil_wk_includes/images99/T.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_2_7"><img id="21" src="w3tamil_wk_includes/images99/Y.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_2_8"><img id="22" src="w3tamil_wk_includes/images99/U.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_2_9"><img id="23" src="w3tamil_wk_includes/images99/I.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_2_10"><img id="24" src="w3tamil_wk_includes/images99/O.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_2_11"><img id="25" src="w3tamil_wk_includes/images99/P.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_2_12"><img id="26" src="w3tamil_wk_includes/images99/BRACKET_START.gif" width="29" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_2_13"><img id="27" src="w3tamil_wk_includes/images99/BRACKET_END.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_2_14"><img id="28" src="w3tamil_wk_includes/images99/PIPE.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                    </div>
                                    <div id="row_3">
                                        <span id="key_3_1"><img id="29" src="w3tamil_wk_includes/images99/CAPSLOCK.gif" width="54" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_3_2"><img id="30" src="w3tamil_wk_includes/images99/A.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_3_3"><img id="31" src="w3tamil_wk_includes/images99/S.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_3_4"><img id="32" src="w3tamil_wk_includes/images99/D.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_3_5"><img id="33" src="w3tamil_wk_includes/images99/F.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_3_6"><img id="34" src="w3tamil_wk_includes/images99/G.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_3_7"><img id="35" src="w3tamil_wk_includes/images99/H.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_3_8"><img id="36" src="w3tamil_wk_includes/images99/J.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_3_9"><img id="37" src="w3tamil_wk_includes/images99/K.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_3_10"><img id="38" src="w3tamil_wk_includes/images99/L.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_3_11"><img id="39" src="w3tamil_wk_includes/images99/SEMICOLON.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_3_12"><img id="40" src="w3tamil_wk_includes/images99/QUOTE.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_3_13"><img id="41" src="w3tamil_wk_includes/images99/ENTER.gif" width="40" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="callbuttonclick()"/></span>
                                    </div>
                                    <div id="row_4">
                                        <span id="key_4_1"><img id="42" src="w3tamil_wk_includes/images99/SHIFT.gif" width="60" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_4_2"><img id="43" src="w3tamil_wk_includes/images99/Z.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_4_3"><img id="44" src="w3tamil_wk_includes/images99/X.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_4_4"><img id="45" src="w3tamil_wk_includes/images99/C.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_4_5"><img id="46" src="w3tamil_wk_includes/images99/V.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_4_6"><img id="47" src="w3tamil_wk_includes/images99/B.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_4_7"><img id="48" src="w3tamil_wk_includes/images99/N.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_4_8"><img id="49" src="w3tamil_wk_includes/images99/M.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_4_9"><img id="50" src="w3tamil_wk_includes/images99/COMMA.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_4_10"><img id="51" src="w3tamil_wk_includes/images99/STOP.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_4_11"><img id="52" src="w3tamil_wk_includes/images99/SLASH.gif" width="28" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_4_12"><img id="53" src="w3tamil_wk_includes/images99/SHIFT2.gif" width="57" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                    </div>
                                    <div id="row_5">
                                        <span id="key_5_1"><img id="54" src="w3tamil_wk_includes/images99/CTRL.gif" width="51" height="28" alt="" style="cursor:default" /></span>
                                        <span id="key_5_2"><img id="55" src="w3tamil_wk_includes/images99/WIN.gif" width="41" height="28" alt="" style="cursor:default" /></span>
                                        <span id="key_5_3"><img id="56" src="w3tamil_wk_includes/images99/ALT.gif" width="41" height="28" alt="" style="cursor:default" /></span>
                                        <span id="key_5_4"><img id="57" src="w3tamil_wk_includes/images99/SPACE.gif" width="147" height="28" alt="" onmouseover="overW3Tamil(this)" onmouseout="outW3Tamil(this)" onclick="addW3Tamil(this)" /></span>
                                        <span id="key_5_5"><img id="58" src="w3tamil_wk_includes/images99/ALT2.gif" width="41" height="28" alt="" style="cursor:default" /></span>
                                        <span id="key_5_6"><img id="59" src="w3tamil_wk_includes/images99/WIN2.gif" width="41" height="28" alt="" style="cursor:default" /></span>
                                        <span id="key_5_7"><img id="60" src="w3tamil_wk_includes/images99/KEY_60.gif" width="41" height="28" alt="" style="cursor:default" /></span>
                                    </div>
                                    <div id="keyboard_status">
                                    <span id="lang_status"></span><span id="shiftcaps_status"></span>
                                    </div>	
                                </div>
                               </div>
                            </td>
                        </tr>
                    </table>
                 </div> 
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>
