<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Record.aspx.cs" Inherits="E_learning_Platform.Student_Record" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID,COURSE_ID,LESSON_NUMBER" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
                    <asp:TemplateField HeaderText="Student Name">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="false" ID="DropDownList4" runat="server" DataSourceID="studentTitle" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="studentTitle" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                    <asp:TemplateField HeaderText="Course Title">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="false" ID="DropDownList5" runat="server" DataSourceID="courseTitle" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="courseTitle" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="LESSON_ID" HeaderText="LESSON_ID" SortExpression="LESSON_ID" />
                    <asp:BoundField DataField="LESSON_NUMBER" HeaderText="LESSON_NUMBER" ReadOnly="True" SortExpression="LESSON_NUMBER" />
                    <asp:TemplateField HeaderText="Lesson Title">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="false" ID="DropDownList6" runat="server" DataSourceID="lessontitle" DataTextField="LESSON_TITLE" DataValueField="LESSON_ID" SelectedValue='<%# Bind("LESSON_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="lessontitle" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT 
    lesson_title, STUDENT_RECORD.*, 
    lesson.course_id || '_' || lesson.lesson_number AS lesson_id
FROM 
    STUDENT_RECORD
JOIN 
    lesson ON STUDENT_RECORD.course_id = lesson.course_id"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="LESSON_STATUS" HeaderText="LESSON_STATUS" SortExpression="LESSON_STATUS" />
                    <asp:BoundField DataField="LAST_ACCESSED_DATE" HeaderText="LAST_ACCESSED_DATE" SortExpression="LAST_ACCESSED_DATE" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;STUDENT_RECORD&quot; WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID AND &quot;COURSE_ID&quot; = :COURSE_ID AND &quot;LESSON_NUMBER&quot; = :LESSON_NUMBER" InsertCommand="INSERT INTO &quot;STUDENT_RECORD&quot; (&quot;STUDENT_ID&quot;, &quot;COURSE_ID&quot;, &quot;LESSON_NUMBER&quot;, &quot;LESSON_STATUS&quot;, &quot;LAST_ACCESSED_DATE&quot;) VALUES (:STUDENT_ID, :COURSE_ID, :LESSON_NUMBER, :LESSON_STATUS, :LAST_ACCESSED_DATE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT 
    STUDENT_RECORD.*, 
    lesson.course_id || '_' || lesson.lesson_number AS lesson_id
FROM 
    STUDENT_RECORD
LEFT JOIN 
    lesson ON STUDENT_RECORD.course_id = lesson.course_id" UpdateCommand="UPDATE &quot;STUDENT_RECORD&quot; SET &quot;LESSON_STATUS&quot; = :LESSON_STATUS, &quot;LAST_ACCESSED_DATE&quot; = :LAST_ACCESSED_DATE WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID AND &quot;COURSE_ID&quot; = :COURSE_ID AND &quot;LESSON_NUMBER&quot; = :LESSON_NUMBER">
            <DeleteParameters>
                <asp:Parameter Name="STUDENT_ID" Type="Decimal" />
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="LESSON_NUMBER" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="STUDENT_ID" Type="Decimal" />
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="LESSON_NUMBER" Type="Decimal" />
                <asp:Parameter Name="LESSON_STATUS" Type="String" />
                <asp:Parameter Name="LAST_ACCESSED_DATE" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="LESSON_STATUS" Type="String" />
                <asp:Parameter Name="LAST_ACCESSED_DATE" Type="DateTime" />
                <asp:Parameter Name="STUDENT_ID" Type="Decimal" />
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="LESSON_NUMBER" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="STUDENT_ID,COURSE_ID,LESSON_NUMBER" DataSourceID="SqlDataSource1">
            <InsertItemTemplate>
                STUDENT_ID:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="student" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="student" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
                <br />
                COURSE_ID:
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="course" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="course" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                <br />
                LESSON_NUMBER:
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="lesson" DataTextField="LESSON_TITLE" DataValueField="LESSON_NUMBER">
                </asp:DropDownList>
                <asp:SqlDataSource ID="lesson" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;LESSON_TITLE&quot;, &quot;LESSON_NUMBER&quot; FROM &quot;LESSON&quot;"></asp:SqlDataSource>
                <br />
                LESSON_STATUS:
                <asp:TextBox ID="LESSON_STATUSTextBox" runat="server" Text='<%# Bind("LESSON_STATUS") %>' />
                <br />
                LAST_ACCESSED_DATE:
                <asp:TextBox ID="LAST_ACCESSED_DATETextBox" runat="server" Text='<%# Bind("LAST_ACCESSED_DATE") %>' />
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
