<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AutoCompTest.aspx.cs" Inherits="JQueryEx.AutoCompTest" %>
    <script src="js/jquery-1.12.0.js" type="text/javascript"></script>
    <script src="js/jquery-ui.js" type="text/javascript"></script>

    <script type="text/javascript" src="https://www.google.com/jsapi"></script>

    <link href="js/jquery-ui.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript">
    $(function() {
        $("[id$=txtSearch]").autocomplete({
            source: function(request, response) {
                $.ajax({
                url: '<%=ResolveClientUrl("~/AutoCompTest.aspx/GetCustomers") %>',
                    data: "{ 'prefix': '" + request.term + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json;",
                    success: function(data) {
                        response($.map(data.d, function(item) {
                            return {
                                label: item,
                                val: item
                            }
                        }))
                    },
                    error: function(response) {
                        alert(response.responseText);
                    },
                    failure: function(response) {
                        //alert(response.responseText);
                    }
                });
            },
            select: function(e, i) {
                $("[id$=hfCustomerId]").val(i.item.val);
            },
            minLength: 1
        });
    });  
</script>
</head>
<body>
<form id="form1" runat="server">
Enter search term:
<asp:TextBox ID="txtSearch" runat="server" />
<asp:HiddenField ID="hfCustomerId" runat="server" />
<asp:Label ID="lblMsg" runat=server />
</form>
</body>
</html>
