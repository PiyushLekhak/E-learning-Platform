<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lesson.aspx.cs" Inherits="E_learning_Platform.Lesson" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="COURSE_ID,LESSON_NUMBER" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                <asp:BoundField DataField="LESSON_NUMBER" HeaderText="LESSON_NUMBER" ReadOnly="True" SortExpression="LESSON_NUMBER" />
                <asp:BoundField DataField="LESSON_TITLE" HeaderText="LESSON_TITLE" SortExpression="LESSON_TITLE" />
                <asp:BoundField DataField="CONTENT_TYPE" HeaderText="CONTENT_TYPE" SortExpression="CONTENT_TYPE" />
                <asp:TemplateField HeaderText="Course_Title">
                    <ItemTemplate>
                        <asp:DropDownList Enabled="false" ID="DropDownList2" runat="server" DataSourceID="Course_Title" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="Course_Title" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;LESSON&quot; WHERE &quot;COURSE_ID&quot; = :COURSE_ID AND &quot;LESSON_NUMBER&quot; = :LESSON_NUMBER" InsertCommand="INSERT INTO &quot;LESSON&quot; (&quot;COURSE_ID&quot;, &quot;LESSON_NUMBER&quot;, &quot;LESSON_TITLE&quot;, &quot;CONTENT_TYPE&quot;) VALUES (:COURSE_ID, :LESSON_NUMBER, :LESSON_TITLE, :CONTENT_TYPE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;LESSON&quot;" UpdateCommand="UPDATE &quot;LESSON&quot; SET &quot;LESSON_TITLE&quot; = :LESSON_TITLE, &quot;CONTENT_TYPE&quot; = :CONTENT_TYPE WHERE &quot;COURSE_ID&quot; = :COURSE_ID AND &quot;LESSON_NUMBER&quot; = :LESSON_NUMBER">
            <DeleteParameters>
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="LESSON_NUMBER" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="LESSON_NUMBER" Type="Decimal" />
                <asp:Parameter Name="LESSON_TITLE" Type="String" />
                <asp:Parameter Name="CONTENT_TYPE" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="LESSON_TITLE" Type="String" />
                <asp:Parameter Name="CONTENT_TYPE" Type="String" />
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="LESSON_NUMBER" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="COURSE_ID,LESSON_NUMBER" DataSourceID="SqlDataSource1">
            <InsertItemTemplate>
                COURSE_ID:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" SelectedValue='<%# Bind("COURSE_ID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
&nbsp;<br />LESSON_NUMBER:
                <asp:TextBox ID="LESSON_NUMBERTextBox" runat="server" Text='<%# Bind("LESSON_NUMBER") %>' />
                <br />
                LESSON_TITLE:
                <asp:TextBox ID="LESSON_TITLETextBox" runat="server" Text='<%# Bind("LESSON_TITLE") %>' />
                <br />
                CONTENT_TYPE:
                <asp:TextBox ID="CONTENT_TYPETextBox" runat="server" Text='<%# Bind("CONTENT_TYPE") %>' />
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
