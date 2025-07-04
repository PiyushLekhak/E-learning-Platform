﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student Enrollment.aspx.cs" Inherits="E_learning_Platform.Student_Enrollment" %>

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
        <div class="content">
            <div class="welcome-text">
                <p>Student Enrollment Details</p>
            </div>        
        <div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select s.*, c.*, e.enrollment_date from student s 
join enrollment e on s.student_id=e.student_id 
join course c on e.course_id=c.course_id
where s.student_id = :student">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="student" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <label for="DropDownList1">Select Student Name : </label>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID">
            </asp:DropDownList>
        </div>
            <asp:GridView ID="GridView1" CssClass="table  mt-3 table-striped" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID,COURSE_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" HeaderStyle-BackColor="#ccffcc" />
                <asp:BoundField DataField="STUDENT_NAME" HeaderText="STUDENT_NAME" SortExpression="STUDENT_NAME" HeaderStyle-BackColor="#ccffcc" />
                <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" HeaderStyle-BackColor="#ccffcc" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" HeaderStyle-BackColor="#ccffcc" />
                <asp:BoundField DataField="EMAIL_ADDRESS" HeaderText="EMAIL_ADDRESS" SortExpression="EMAIL_ADDRESS" HeaderStyle-BackColor="#ccffcc" />
                <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY" HeaderStyle-BackColor="#ccffcc"/>
                <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" HeaderStyle-BackColor="#ccffcc" />
                <asp:BoundField DataField="COURSE_TITLE" HeaderText="COURSE_TITLE" SortExpression="COURSE_TITLE" HeaderStyle-BackColor="#ccffcc" />
                <asp:BoundField DataField="COURSE_LEVEL" HeaderText="COURSE_LEVEL" SortExpression="COURSE_LEVEL" HeaderStyle-BackColor="#ccffcc" />
                <asp:BoundField DataField="DURATION_MONTHS" HeaderText="DURATION_MONTHS" SortExpression="DURATION_MONTHS" HeaderStyle-BackColor="#ccffcc" />
                <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" SortExpression="DESCRIPTION" HeaderStyle-BackColor="#ccffcc"/>
                <asp:BoundField DataField="ENROLLMENT_DATE" HeaderText="ENROLLMENT_DATE" SortExpression="ENROLLMENT_DATE" HeaderStyle-BackColor="#ccffcc" />
            </Columns>
        </asp:GridView>
            </div>
    </form>
</body>
</html>
