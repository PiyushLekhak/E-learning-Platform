<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="E_learning_Platform.Course" %>

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
            <asp:GridView ID="GridView1" CssClass="table" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="COURSE_ID" DataSourceID="SqlDataSource1" AllowPaging="True">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                    <asp:BoundField DataField="COURSE_TITLE" HeaderText="COURSE_TITLE" SortExpression="COURSE_TITLE" />
                    <asp:BoundField DataField="COURSE_LEVEL" HeaderText="COURSE_LEVEL" SortExpression="COURSE_LEVEL" />
                    <asp:BoundField DataField="DURATION_MONTHS" HeaderText="DURATION_MONTHS" SortExpression="DURATION_MONTHS" />
                    <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" SortExpression="DESCRIPTION" />
                </Columns>
            </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;COURSE&quot; WHERE &quot;COURSE_ID&quot; = :COURSE_ID" InsertCommand="INSERT INTO &quot;COURSE&quot; (&quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot;, &quot;COURSE_LEVEL&quot;, &quot;DURATION_MONTHS&quot;, &quot;DESCRIPTION&quot;) VALUES (:COURSE_ID, :COURSE_TITLE, :COURSE_LEVEL, :DURATION_MONTHS, :DESCRIPTION)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;COURSE&quot;" UpdateCommand="UPDATE &quot;COURSE&quot; SET &quot;COURSE_TITLE&quot; = :COURSE_TITLE, &quot;COURSE_LEVEL&quot; = :COURSE_LEVEL, &quot;DURATION_MONTHS&quot; = :DURATION_MONTHS, &quot;DESCRIPTION&quot; = :DESCRIPTION WHERE &quot;COURSE_ID&quot; = :COURSE_ID">
            <DeleteParameters>
                <asp:Parameter Name="COURSE_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="COURSE_TITLE" Type="String" />
                <asp:Parameter Name="COURSE_LEVEL" Type="String" />
                <asp:Parameter Name="DURATION_MONTHS" Type="Decimal" />
                <asp:Parameter Name="DESCRIPTION" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="COURSE_TITLE" Type="String" />
                <asp:Parameter Name="COURSE_LEVEL" Type="String" />
                <asp:Parameter Name="DURATION_MONTHS" Type="Decimal" />
                <asp:Parameter Name="DESCRIPTION" Type="String" />
                <asp:Parameter Name="COURSE_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="COURSE_ID" DataSourceID="SqlDataSource1">
            <InsertItemTemplate>
                COURSE_ID:
                <asp:TextBox ID="COURSE_IDTextBox" runat="server" Text='<%# Bind("COURSE_ID") %>' />
                <br />
                COURSE_TITLE:
                <asp:TextBox ID="COURSE_TITLETextBox" runat="server" Text='<%# Bind("COURSE_TITLE") %>' />
                <br />
                COURSE_LEVEL:
                <asp:TextBox ID="COURSE_LEVELTextBox" runat="server" Text='<%# Bind("COURSE_LEVEL") %>' />
                <br />
                DURATION_MONTHS:
                <asp:TextBox ID="DURATION_MONTHSTextBox" runat="server" Text='<%# Bind("DURATION_MONTHS") %>' />
                <br />
                DESCRIPTION:
                <asp:TextBox ID="DESCRIPTIONTextBox" runat="server" Text='<%# Bind("DESCRIPTION") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
            </ItemTemplate>
        </asp:FormView>
        </div>
    </form>
</body>
</html>
