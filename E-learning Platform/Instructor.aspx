<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Instructor.aspx.cs" Inherits="E_learning_Platform.Instructor" %>

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
        <div class =" container">
        
        <asp:GridView ID="GridView1" CssClass="table" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="COURSE_INSTRUCTOR_ID" DataSourceID="SqlDataSource1" AllowPaging="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="COURSE_INSTRUCTOR_ID" HeaderText="COURSE_INSTRUCTOR_ID" SortExpression="COURSE_INSTRUCTOR_ID" ReadOnly="True" />
                <asp:BoundField DataField="COURSE_INSTRUCTOR_NAME" HeaderText="COURSE_INSTRUCTOR_NAME" SortExpression="COURSE_INSTRUCTOR_NAME" />
                <asp:BoundField DataField="COURSE_INSTRUCTOR_ADDRESS" HeaderText="COURSE_INSTRUCTOR_ADDRESS" SortExpression="COURSE_INSTRUCTOR_ADDRESS" />
                <asp:BoundField DataField="COURSE_INSTRUCTOR_EMAIL" HeaderText="COURSE_INSTRUCTOR_EMAIL" SortExpression="COURSE_INSTRUCTOR_EMAIL" />
                <asp:BoundField DataField="COURSE_INSTRUCTOR_CONTACT" HeaderText="COURSE_INSTRUCTOR_CONTACT" SortExpression="COURSE_INSTRUCTOR_CONTACT" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;INSTRUCTOR&quot; WHERE &quot;COURSE_INSTRUCTOR_ID&quot; = :COURSE_INSTRUCTOR_ID" InsertCommand="INSERT INTO &quot;INSTRUCTOR&quot; (&quot;COURSE_INSTRUCTOR_ID&quot;, &quot;COURSE_INSTRUCTOR_NAME&quot;, &quot;COURSE_INSTRUCTOR_ADDRESS&quot;, &quot;COURSE_INSTRUCTOR_EMAIL&quot;, &quot;COURSE_INSTRUCTOR_CONTACT&quot;) VALUES (:COURSE_INSTRUCTOR_ID, :COURSE_INSTRUCTOR_NAME, :COURSE_INSTRUCTOR_ADDRESS, :COURSE_INSTRUCTOR_EMAIL, :COURSE_INSTRUCTOR_CONTACT)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;INSTRUCTOR&quot;" UpdateCommand="UPDATE &quot;INSTRUCTOR&quot; SET &quot;COURSE_INSTRUCTOR_NAME&quot; = :COURSE_INSTRUCTOR_NAME, &quot;COURSE_INSTRUCTOR_ADDRESS&quot; = :COURSE_INSTRUCTOR_ADDRESS, &quot;COURSE_INSTRUCTOR_EMAIL&quot; = :COURSE_INSTRUCTOR_EMAIL, &quot;COURSE_INSTRUCTOR_CONTACT&quot; = :COURSE_INSTRUCTOR_CONTACT WHERE &quot;COURSE_INSTRUCTOR_ID&quot; = :COURSE_INSTRUCTOR_ID">
            <DeleteParameters>
                <asp:Parameter Name="COURSE_INSTRUCTOR_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="COURSE_INSTRUCTOR_ID" Type="Decimal" />
                <asp:Parameter Name="COURSE_INSTRUCTOR_NAME" Type="String" />
                <asp:Parameter Name="COURSE_INSTRUCTOR_ADDRESS" Type="String" />
                <asp:Parameter Name="COURSE_INSTRUCTOR_EMAIL" Type="String" />
                <asp:Parameter Name="COURSE_INSTRUCTOR_CONTACT" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="COURSE_INSTRUCTOR_NAME" Type="String" />
                <asp:Parameter Name="COURSE_INSTRUCTOR_ADDRESS" Type="String" />
                <asp:Parameter Name="COURSE_INSTRUCTOR_EMAIL" Type="String" />
                <asp:Parameter Name="COURSE_INSTRUCTOR_CONTACT" Type="String" />
                <asp:Parameter Name="COURSE_INSTRUCTOR_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="COURSE_INSTRUCTOR_ID" DataSourceID="SqlDataSource1">
            <InsertItemTemplate>
                COURSE_INSTRUCTOR_ID:
                <asp:TextBox ID="COURSE_INSTRUCTOR_IDTextBox" runat="server" Text='<%# Bind("COURSE_INSTRUCTOR_ID") %>' />
                <br />
                COURSE_INSTRUCTOR_NAME:
                <asp:TextBox ID="COURSE_INSTRUCTOR_NAMETextBox" runat="server" Text='<%# Bind("COURSE_INSTRUCTOR_NAME") %>' />
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
            </div>
    </form>
</body>
</html>
