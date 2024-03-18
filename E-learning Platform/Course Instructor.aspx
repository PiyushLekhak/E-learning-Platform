<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Course Instructor.aspx.cs" Inherits="E_learning_Platform.Course_Instructor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/Content/bootstrap.min.css" rel="stylesheet" />
    <style>

        .sidebar {
            height: 100%;
            width: 200px;
            position: fixed;
            top: 0;
            left: 0;
            background-color:blanchedalmond;
            padding-top: 60px;
            border-top-right-radius:20px;   
            border-bottom-right-radius:20px;  
        }

        .sidebar a {
            padding: 10px;
            text-decoration: none;
            font-size: 20px;
            color: black;
            display: block;
            margin-right:20px;
            border-top-right-radius:5px;
            border-bottom-right-radius:100px;

        }

        .sidebar a:hover {
            background-color:lightcoral;
        }

        .content {
            margin-left: 200px;
            padding: 16px;
            height: 1000px;
            justify-content: center;
            text-align: center;
        }
          
    </style>
</head>
<body>
    <form id="form1" runat="server">
                        <div class="sidebar">
<a href="/Home.aspx">Home</a>
<a href="/Student.aspx">Student</a>
<a href="/Instructor.aspx">Instructor</a>
<a href="/Course.aspx">Course</a>
<a href="/Lesson.aspx">Lesson</a>
<a href="/Student_Record.aspx">Student Record</a>
<a href="/Student Enrollment.aspx">Enrollment</a>
<a href="/Course Instructor.aspx">Course Instructor</a>
<a href="/Best E-learning Course.aspx">Best Course</a>
</div>
        <div class = "content">
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
        <asp:GridView ID="GridView1" CssClass="table" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="COURSE_ID,COURSE_INSTRUCTOR_ID" DataSourceID="SqlDataSource1">
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
            </div>
    </form>
</body>
</html>
