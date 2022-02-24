﻿<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="CS.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="js/jquery-1.12.0.js" type="text/javascript"></script>
<script src="js/jquery-ui.js" type="text/javascript"></script>

<script type = "text/javascript">
function ShowCurrentTime() {
    $.ajax({
        type: "POST",
        url: "CS.aspx/GetCurrentTime",
        data: '{name: "' + $("#<%=txtUserName.ClientID%>")[0].value + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: OnSuccess,
        failure: function(response) {
            alert(response.d);
        }
    });
}
function OnSuccess(response) {
    alert(response.d);
    $('#txtUserName').autocomplete({
    source: response.d
}); 
}
</script> 
</head>
<body style = "font-family:Arial; font-size:10pt">
<form id="form1" runat="server">
<div>
Your Name : 
<asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
<input id="btnGetTime" type="button" value="Show Current Time" 
    onclick = "ShowCurrentTime()" />
   
</div>
</form>
</body>
</html>
