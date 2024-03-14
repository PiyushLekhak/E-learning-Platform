<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Instructor.aspx.cs" Inherits="E_learning_Platform.Instructor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="COURSE_INSTRUCTOR_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="COURSE_INSTRUCTOR_NAME" HeaderText="COURSE_INSTRUCTOR_NAME" SortExpression="COURSE_INSTRUCTOR_NAME" />
                <asp:BoundField DataField="COURSE_INSTRUCTOR_ID" HeaderText="COURSE_INSTRUCTOR_ID" ReadOnly="True" SortExpression="COURSE_INSTRUCTOR_ID" />
                <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" SortExpression="COURSE_ID" />
                <asp:BoundField DataField="COURSE_INSTRUCTOR_ADDRESS" HeaderText="COURSE_INSTRUCTOR_ADDRESS" SortExpression="COURSE_INSTRUCTOR_ADDRESS" />
                <asp:BoundField DataField="COURSE_INSTRUCTOR_EMAIL" HeaderText="COURSE_INSTRUCTOR_EMAIL" SortExpression="COURSE_INSTRUCTOR_EMAIL" />
                <asp:BoundField DataField="COURSE_INSTRUCTOR_CONTACT" HeaderText="COURSE_INSTRUCTOR_CONTACT" SortExpression="COURSE_INSTRUCTOR_CONTACT" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;INSTRUCTOR&quot; WHERE &quot;COURSE_INSTRUCTOR_ID&quot; = :COURSE_INSTRUCTOR_ID" InsertCommand="INSERT INTO &quot;INSTRUCTOR&quot; (&quot;COURSE_INSTRUCTOR_NAME&quot;, &quot;COURSE_INSTRUCTOR_ID&quot;, &quot;COURSE_ID&quot;, &quot;COURSE_INSTRUCTOR_ADDRESS&quot;, &quot;COURSE_INSTRUCTOR_EMAIL&quot;, &quot;COURSE_INSTRUCTOR_CONTACT&quot;) VALUES (:COURSE_INSTRUCTOR_NAME, :COURSE_INSTRUCTOR_ID, :COURSE_ID, :COURSE_INSTRUCTOR_ADDRESS, :COURSE_INSTRUCTOR_EMAIL, :COURSE_INSTRUCTOR_CONTACT)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_INSTRUCTOR_NAME&quot;, &quot;COURSE_INSTRUCTOR_ID&quot;, &quot;COURSE_ID&quot;, &quot;COURSE_INSTRUCTOR_ADDRESS&quot;, &quot;COURSE_INSTRUCTOR_EMAIL&quot;, &quot;COURSE_INSTRUCTOR_CONTACT&quot; FROM &quot;INSTRUCTOR&quot;" UpdateCommand="UPDATE &quot;INSTRUCTOR&quot; SET &quot;COURSE_INSTRUCTOR_NAME&quot; = :COURSE_INSTRUCTOR_NAME, &quot;COURSE_ID&quot; = :COURSE_ID, &quot;COURSE_INSTRUCTOR_ADDRESS&quot; = :COURSE_INSTRUCTOR_ADDRESS, &quot;COURSE_INSTRUCTOR_EMAIL&quot; = :COURSE_INSTRUCTOR_EMAIL, &quot;COURSE_INSTRUCTOR_CONTACT&quot; = :COURSE_INSTRUCTOR_CONTACT WHERE &quot;COURSE_INSTRUCTOR_ID&quot; = :COURSE_INSTRUCTOR_ID">
            <DeleteParameters>
                <asp:Parameter Name="COURSE_INSTRUCTOR_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="COURSE_INSTRUCTOR_NAME" Type="String" />
                <asp:Parameter Name="COURSE_INSTRUCTOR_ID" Type="Decimal" />
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="COURSE_INSTRUCTOR_ADDRESS" Type="String" />
                <asp:Parameter Name="COURSE_INSTRUCTOR_EMAIL" Type="String" />
                <asp:Parameter Name="COURSE_INSTRUCTOR_CONTACT" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="COURSE_INSTRUCTOR_NAME" Type="String" />
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="COURSE_INSTRUCTOR_ADDRESS" Type="String" />
                <asp:Parameter Name="COURSE_INSTRUCTOR_EMAIL" Type="String" />
                <asp:Parameter Name="COURSE_INSTRUCTOR_CONTACT" Type="String" />
                <asp:Parameter Name="COURSE_INSTRUCTOR_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="COURSE_INSTRUCTOR_ID" DataSourceID="SqlDataSource1">
            <InsertItemTemplate>
                COURSE_INSTRUCTOR_NAME:
                <asp:TextBox ID="COURSE_INSTRUCTOR_NAMETextBox" runat="server" Text='<%# Bind("COURSE_INSTRUCTOR_NAME") %>' />
                <br />
                COURSE_INSTRUCTOR_ID:
                <asp:TextBox ID="COURSE_INSTRUCTOR_IDTextBox" runat="server" Text='<%# Bind("COURSE_INSTRUCTOR_ID") %>' />
                <br />
                COURSE_ID:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                <br />
                COURSE_INSTRUCTOR_ADDRESS:
                <asp:TextBox ID="COURSE_INSTRUCTOR_ADDRESSTextBox" runat="server" Text='<%# Bind("COURSE_INSTRUCTOR_ADDRESS") %>' />
                <br />
                COURSE_INSTRUCTOR_EMAIL:
                <asp:TextBox ID="COURSE_INSTRUCTOR_EMAILTextBox" runat="server" Text='<%# Bind("COURSE_INSTRUCTOR_EMAIL") %>' />
                <br />
                COURSE_INSTRUCTOR_CONTACT:
                <asp:TextBox ID="COURSE_INSTRUCTOR_CONTACTTextBox" runat="server" Text='<%# Bind("COURSE_INSTRUCTOR_CONTACT") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
               <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
            </ItemTemplate>
        </asp:FormView>
    </form>
</body>
</html>
