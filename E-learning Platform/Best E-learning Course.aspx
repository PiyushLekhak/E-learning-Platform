<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Best E-learning Course.aspx.cs" Inherits="E_learning_Platform.Best_E_learning_Course" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/Content/bootstrap.min.css" rel="stylesheet" />
    <style>

        .welcome-text {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100px;
            font-size: 36px;
            color: black;
            font-weight: bold;
        }

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
            <div class="welcome-text">
                <p>Best E-Learning Course By Month</p>
            </div>        
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT course_id, course_title, course_level, duration_months, description, num_enrollments as &quot;Number of Enrollments&quot;
FROM (
    SELECT c.*, COUNT(e.enrollment_id) AS num_enrollments,
           ROW_NUMBER() OVER (ORDER BY COUNT(e.enrollment_id) DESC) as rownumber
    FROM course c
    JOIN enrollment e ON c.course_id = e.course_id
    WHERE EXTRACT(MONTH FROM e.enrollment_date) = :month
      AND EXTRACT(YEAR FROM e.enrollment_date) = :year
    GROUP BY c.course_id, c.course_title, c.course_level, c.duration_months, c.description
)
WHERE rownumber &lt;= 3">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="month" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownList2" Name="year" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT 
       EXTRACT(MONTH FROM enrollment_date) AS month_number,
       TO_CHAR(enrollment_date, 'Month') AS month_name
FROM enrollment
ORDER BY month_number
"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT 
       EXTRACT(YEAR FROM enrollment_date) AS enrollment_year
FROM enrollment
ORDER BY enrollment_year"></asp:SqlDataSource>
            <label for="DropDownList1">Select Date : </label>
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="ENROLLMENT_YEAR" DataValueField="ENROLLMENT_YEAR">
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="MONTH_NAME" DataValueField="MONTH_NUMBER">
            </asp:DropDownList>
        </div>
        <asp:GridView ID="GridView1" CssClass="table table-striped mt-3" runat="server" AllowSorting="True" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" HeaderStyle-BackColor="#ccffcc" />
            <asp:BoundField DataField="COURSE_TITLE" HeaderText="COURSE_TITLE" ReadOnly="True" SortExpression="COURSE_TITLE" HeaderStyle-BackColor="#ccffcc" />
            <asp:BoundField DataField="COURSE_LEVEL" HeaderText="COURSE_LEVEL" ReadOnly="True" SortExpression="COURSE_LEVEL" HeaderStyle-BackColor="#ccffcc" />
            <asp:BoundField DataField="DURATION_MONTHS" HeaderText="DURATION_MONTHS" ReadOnly="True" SortExpression="DURATION_MONTHS" HeaderStyle-BackColor="#ccffcc" />
            <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" ReadOnly="True" SortExpression="DESCRIPTION" HeaderStyle-BackColor="#ccffcc" />
            <asp:BoundField DataField="NUMBER OF ENROLLMENTS" HeaderText="NUMBER OF ENROLLMENTS" ReadOnly="True" SortExpression="NUMBER OF ENROLLMENTS" HeaderStyle-BackColor="#ccffcc" />
        </Columns>
        </asp:GridView>
            </div>
    </form>
</body>
</html>
