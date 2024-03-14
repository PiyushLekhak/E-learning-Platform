<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="E_learning_Platform.Student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
                <asp:BoundField DataField="STUDENT_NAME" HeaderText="STUDENT_NAME" SortExpression="STUDENT_NAME" />
                <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
                <asp:BoundField DataField="EMAIL_ADDRESS" HeaderText="EMAIL_ADDRESS" SortExpression="EMAIL_ADDRESS" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;STUDENT&quot; WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID" InsertCommand="INSERT INTO &quot;STUDENT&quot; (&quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot;, &quot;CONTACT&quot;, &quot;EMAIL_ADDRESS&quot;, &quot;DOB&quot;, &quot;COUNTRY&quot;) VALUES (:STUDENT_ID, :STUDENT_NAME, :CONTACT, :EMAIL_ADDRESS, :DOB, :COUNTRY)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot;, &quot;CONTACT&quot;, &quot;EMAIL_ADDRESS&quot;, &quot;DOB&quot;, &quot;COUNTRY&quot; FROM &quot;STUDENT&quot;" UpdateCommand="UPDATE &quot;STUDENT&quot; SET &quot;STUDENT_NAME&quot; = :STUDENT_NAME, &quot;CONTACT&quot; = :CONTACT, &quot;EMAIL_ADDRESS&quot; = :EMAIL_ADDRESS, &quot;DOB&quot; = :DOB, &quot;COUNTRY&quot; = :COUNTRY WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID">
            <DeleteParameters>
                <asp:Parameter Name="STUDENT_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="STUDENT_ID" Type="Decimal" />
                <asp:Parameter Name="STUDENT_NAME" Type="String" />
                <asp:Parameter Name="CONTACT" Type="String" />
                <asp:Parameter Name="EMAIL_ADDRESS" Type="String" />
                <asp:Parameter Name="DOB" Type="DateTime" />
                <asp:Parameter Name="COUNTRY" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="STUDENT_NAME" Type="String" />
                <asp:Parameter Name="CONTACT" Type="String" />
                <asp:Parameter Name="EMAIL_ADDRESS" Type="String" />
                <asp:Parameter Name="DOB" Type="DateTime" />
                <asp:Parameter Name="COUNTRY" Type="String" />
                <asp:Parameter Name="STUDENT_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource1">
            <InsertItemTemplate>
                STUDENT_ID:
                <asp:TextBox ID="STUDENT_IDTextBox" runat="server" Text='<%# Bind("STUDENT_ID") %>' />
                <br />
                STUDENT_NAME:
                <asp:TextBox ID="STUDENT_NAMETextBox" runat="server" Text='<%# Bind("STUDENT_NAME") %>' />
                <br />
                CONTACT:
                <asp:TextBox ID="CONTACTTextBox" runat="server" Text='<%# Bind("CONTACT") %>' />
                <br />
                EMAIL_ADDRESS:
                <asp:TextBox ID="EMAIL_ADDRESSTextBox" runat="server" Text='<%# Bind("EMAIL_ADDRESS") %>' />
                <br />
                DOB:
                <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' />
                <br />
                COUNTRY:
                <asp:TextBox ID="COUNTRYTextBox" runat="server" Text='<%# Bind("COUNTRY") %>' />
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
