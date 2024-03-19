<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Instructor.aspx.cs" Inherits="E_learning_Platform.Instructor" %>

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
        <div class ="content">
            <div class="welcome-text">
                <p>Instructor Details</p>
            </div>        
        <asp:GridView ID="GridView1" CssClass="table table-striped" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="COURSE_INSTRUCTOR_ID" DataSourceID="SqlDataSource1" AllowPaging="True">
            <Columns>
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" HeaderStyle-CssClass="text-black" HeaderStyle-BackColor="#ccffcc">
                        <ControlStyle CssClass="btn btn-danger " />
                    </asp:CommandField>
                    <asp:CommandField  HeaderText="Edit" ShowEditButton="True" HeaderStyle-CssClass="text-black " HeaderStyle-BackColor="#ccffcc">
                        <ControlStyle CssClass="btn btn-primary" />
                    </asp:CommandField>
                <asp:BoundField DataField="COURSE_INSTRUCTOR_ID" HeaderText="COURSE_INSTRUCTOR_ID" SortExpression="COURSE_INSTRUCTOR_ID" ReadOnly="True" HeaderStyle-BackColor="#ccffcc" />
                <asp:BoundField DataField="COURSE_INSTRUCTOR_NAME" HeaderText="COURSE_INSTRUCTOR_NAME" SortExpression="COURSE_INSTRUCTOR_NAME" HeaderStyle-BackColor="#ccffcc" />
                <asp:BoundField DataField="COURSE_INSTRUCTOR_ADDRESS" HeaderText="COURSE_INSTRUCTOR_ADDRESS" SortExpression="COURSE_INSTRUCTOR_ADDRESS" HeaderStyle-BackColor="#ccffcc" />
                <asp:BoundField DataField="COURSE_INSTRUCTOR_EMAIL" HeaderText="COURSE_INSTRUCTOR_EMAIL" SortExpression="COURSE_INSTRUCTOR_EMAIL"  HeaderStyle-BackColor="#ccffcc"/>
                <asp:BoundField DataField="COURSE_INSTRUCTOR_CONTACT" HeaderText="COURSE_INSTRUCTOR_CONTACT" SortExpression="COURSE_INSTRUCTOR_CONTACT" HeaderStyle-BackColor="#ccffcc" />
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
                <div style="text-align: left;">
                <div style="width: 250px; display: inline-block;">COURSE_INSTRUCTOR_ID:</div>
                <asp:TextBox ID="COURSE_INSTRUCTOR_IDTextBox" runat="server" Text='<%# Bind("COURSE_INSTRUCTOR_ID") %>' />
                <br /><br />
                <div style="width: 250px; display: inline-block;">COURSE_INSTRUCTOR_NAME:</div>
                <asp:TextBox ID="COURSE_INSTRUCTOR_NAMETextBox" runat="server" Text='<%# Bind("COURSE_INSTRUCTOR_NAME") %>' />
                <br /><br />
                <div style="width: 250px; display: inline-block;">COURSE_INSTRUCTOR_ADDRESS:</div>
                <asp:TextBox ID="COURSE_INSTRUCTOR_ADDRESSTextBox" runat="server" Text='<%# Bind("COURSE_INSTRUCTOR_ADDRESS") %>' />
                <br /><br />
                <div style="width: 250px; display: inline-block;">COURSE_INSTRUCTOR_EMAIL:</div>
                <asp:TextBox ID="COURSE_INSTRUCTOR_EMAILTextBox" runat="server" Text='<%# Bind("COURSE_INSTRUCTOR_EMAIL") %>' />
                <br /><br />
                <div style="width: 250px; display: inline-block;">COURSE_INSTRUCTOR_CONTACT:</div>
                <asp:TextBox ID="COURSE_INSTRUCTOR_CONTACTTextBox" runat="server" Text='<%# Bind("COURSE_INSTRUCTOR_CONTACT") %>' />
                <br /><br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-success" style="font-size: larger;" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" style="font-size: larger;" />
                </div>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" CssClass="btn btn-success" style="font-size: larger;"/>
            </ItemTemplate>
        </asp:FormView>
            </div>
    </form>
</body>
</html>
