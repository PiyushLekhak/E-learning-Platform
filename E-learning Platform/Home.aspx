<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="E_learning_Platform.Home" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

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
            background-color: blanchedalmond;
            padding-top: 60px;
            border-top-right-radius: 20px;
            border-bottom-right-radius: 20px;
        }

        .content {
            margin-left: 200px;
            padding: 15px;
        }

        .dashcard {
            background-color: lavender;
            max-width: 450px;
            margin-bottom: 20px;
        }
        .dashcard2 {
            background-color: lightcyan;
            max-width: 450px;
            margin-bottom: 20px;
        }       
        
        .dashcard3 {
            background-color: lavenderblush;
            max-width: 450px;
            margin-bottom: 20px;
        }

        .card-body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 200px;
            font-size: 24px;
            color: black;
            text-align: center;
        }

        .dashcard:hover, .dashcard2:hover, .dashcard3:hover {
            background-color: lightcoral;
            cursor: pointer;
        }

        .sidebar a {
            padding: 10px;
            text-decoration: none;
            font-size: 20px;
            color: black;
            display: block;
            margin-right: 20px;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 100px;
        }

        .sidebar a:hover {
            background-color: lightcoral;
        }

        .gridview-cell {
            padding: 20px 10px;
            font-size: 30px;
            font-weight: bold;
        }

        .chart-text {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100px;
            font-size: 36px;
            color: black;
            font-weight: bold;
            margin-top: 50px;
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

        <div class="content">
            <div class="mb-5 welcome-text">
                <p>Welcome, Admin</p>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="dashcard card mb-3">
                        <div class="card-body">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BorderStyle="None">
                                <Columns>
                                    <asp:BoundField DataField="Total Number of Students" HeaderText="Total Number of Students" SortExpression="Total Number of Students" ItemStyle-CssClass="gridview-cell" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS &quot;Total Number of Students&quot; FROM student"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="dashcard2 card mb-3">
                        <div class="card-body">
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" BorderStyle="None">
                                <Columns>
                                    <asp:BoundField DataField="Total Number of Courses" HeaderText="Total Number of Courses" SortExpression="Total Number of Courses" ItemStyle-CssClass="gridview-cell" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS &quot;Total Number of Courses&quot; FROM course"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="dashcard3 card mb-3">
                        <div class="card-body">
                            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" BorderStyle="None">
                                <Columns>
                                    <asp:BoundField DataField="Total Number of Instructors" HeaderText="Total Number of Instructors" SortExpression="Total Number of Instructors" ItemStyle-CssClass="gridview-cell" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS &quot;Total Number of Instructors&quot; FROM instructor"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <p class="chart-text">Distribution of students across countries</p>
                    <asp:Chart ID="Chart1" runat="server" DataSourceID="country" OnLoad="Chart1_Load" Width="600px" Height="500px">
                        <series>
                            <asp:Series ChartType="Doughnut" Name="Series1" XValueMember="COUNTRY" YValueMembers="STUDENT_COUNT"></asp:Series>
                        </series>
                        <chartareas>
                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        </chartareas>
                    </asp:Chart>
                    <asp:SqlDataSource ID="country" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT country, COUNT(*) AS student_count FROM student GROUP BY country" OnSelecting="country_Selecting"></asp:SqlDataSource>
                </div>
                <div class="col-md-6"">
                    <p class="chart-text">Most Completed Courses</p>
                    <div style="margin-left: 100px;">
                        <asp:Chart ID="Chart2" runat="server" DataSourceID="coursecompletion" Width="650px" Height="500px">
                            <series>
                                <asp:Series Name="Series1" XValueMember="COURSE_TITLE" YValueMembers="COMPLETED_STUDENTS" ChartType="Radar" Color="#99ff99"></asp:Series>
                            </series>
                            <chartareas>
                                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                            </chartareas>
                        </asp:Chart>
                        <asp:SqlDataSource ID="coursecompletion" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT c.course_title, COUNT(sr.student_id) AS completed_students FROM course c JOIN student_record sr ON c.course_id = sr.course_id AND sr.lesson_status = 'Completed' GROUP BY c.course_title ORDER BY completed_students DESC" OnSelecting="coursecompletion_Selecting"></asp:SqlDataSource>
                    </div>
                 </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <p class="chart-text">Total Enrollments by Month</p>
                    <asp:Chart ID="Chart6" runat="server" DataSourceID="enrollmentpermonth" Width="700px" Height="600px">
                        <series>
                            <asp:Series Name="Series1" XValueMember="MONTH_NAME" YValueMembers="NUM_ENROLLMENTS" Color="#3366ff"></asp:Series>
                        </series>
                        <chartareas>
                            <asp:ChartArea Name="ChartArea1"><AxisX Interval="1"></AxisX></asp:ChartArea>
                        </chartareas>
                    </asp:Chart>
                    <asp:SqlDataSource ID="enrollmentpermonth" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT TO_CHAR(enrollment_date, 'Month') AS month_name, COUNT(*) AS num_enrollments FROM enrollment GROUP BY TO_CHAR(enrollment_date, 'Month') ORDER BY MIN(enrollment_date)" OnSelecting="enrollmentpermonth_Selecting"></asp:SqlDataSource>
                </div>
                <div class="col-md-6">
                    <p class="chart-text">Most Popular Courses</p>
                    <asp:Chart ID="Chart4" runat="server" DataSourceID="mostpopularcourse" Width="700px" Height="600px">
                        <series>
                            <asp:Series Name="Series1" XValueMember="COURSE_TITLE" YValueMembers="ENROLLED_STUDENTS" ChartType="Bar" Color="#ff6600"></asp:Series>
                        </series>
                        <chartareas>
                            <asp:ChartArea Name="ChartArea1"><AxisX Interval="1"></AxisX></asp:ChartArea>
                        </chartareas>
                    </asp:Chart>
                    <asp:SqlDataSource ID="mostpopularcourse" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT c.course_title, COUNT(e.student_id) AS enrolled_students FROM course c LEFT JOIN enrollment e ON c.course_id = e.course_id GROUP BY c.course_title ORDER BY enrolled_students DESC"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
