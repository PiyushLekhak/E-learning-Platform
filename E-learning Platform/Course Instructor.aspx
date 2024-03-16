<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Course Instructor.aspx.cs" Inherits="E_learning_Platform.Course_Instructor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
        <div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT c.*, i.*
FROM course c
LEFT JOIN course_instructor ci ON c.course_id = ci.course_id
LEFT JOIN ( SELECT * FROM instructor
WHERE course_instructor_id IN (
SELECT course_instructor_id
FROM course_instructor
GROUP BY course_instructor_id
HAVING COUNT(course_id) &gt;= 2)) 
i ON ci.course_instructor_id = i.course_instructor_id
WHERE c.course_id = :course">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="course" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID">
        </asp:DropDownList>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="COURSE_ID,COURSE_INSTRUCTOR_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                <asp:BoundField DataField="COURSE_TITLE" HeaderText="COURSE_TITLE" SortExpression="COURSE_TITLE" />
                <asp:BoundField DataField="COURSE_LEVEL" HeaderText="COURSE_LEVEL" SortExpression="COURSE_LEVEL" />
                <asp:BoundField DataField="DURATION_MONTHS" HeaderText="DURATION_MONTHS" SortExpression="DURATION_MONTHS" />
                <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" SortExpression="DESCRIPTION" />
                <asp:BoundField DataField="COURSE_INSTRUCTOR_ID" HeaderText="COURSE_INSTRUCTOR_ID" ReadOnly="True" SortExpression="COURSE_INSTRUCTOR_ID" />
                <asp:BoundField DataField="COURSE_INSTRUCTOR_NAME" HeaderText="COURSE_INSTRUCTOR_NAME" SortExpression="COURSE_INSTRUCTOR_NAME" />
                <asp:BoundField DataField="COURSE_INSTRUCTOR_ADDRESS" HeaderText="COURSE_INSTRUCTOR_ADDRESS" SortExpression="COURSE_INSTRUCTOR_ADDRESS" />
                <asp:BoundField DataField="COURSE_INSTRUCTOR_EMAIL" HeaderText="COURSE_INSTRUCTOR_EMAIL" SortExpression="COURSE_INSTRUCTOR_EMAIL" />
                <asp:BoundField DataField="COURSE_INSTRUCTOR_CONTACT" HeaderText="COURSE_INSTRUCTOR_CONTACT" SortExpression="COURSE_INSTRUCTOR_CONTACT" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
