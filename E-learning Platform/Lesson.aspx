<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lesson.aspx.cs" Inherits="E_learning_Platform.Lesson" %>

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
                <p>Lesson Details</p>
            </div>        
        <asp:GridView ID="GridView1" CssClass="table table-striped" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="COURSE_ID,LESSON_NUMBER" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True">
            <Columns>
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" HeaderStyle-CssClass="text-black" HeaderStyle-BackColor="#ccffcc">
                        <ControlStyle CssClass="btn btn-danger " />
                    </asp:CommandField>
                    <asp:CommandField  HeaderText="Edit" ShowEditButton="True" HeaderStyle-CssClass="text-black " HeaderStyle-BackColor="#ccffcc">
                        <ControlStyle CssClass="btn btn-primary" />
                    </asp:CommandField>
                <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" HeaderStyle-BackColor="#ccffcc" />
                <asp:TemplateField HeaderText="Course_Title" HeaderStyle-BackColor="#ccffcc">
                    <ItemTemplate>
                        <asp:DropDownList Enabled="false" ID="DropDownList2" runat="server" DataSourceID="Course_Title" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="Course_Title" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="LESSON_NUMBER" HeaderText="LESSON_NUMBER" ReadOnly="True" SortExpression="LESSON_NUMBER" HeaderStyle-BackColor="#ccffcc" />
                <asp:BoundField DataField="LESSON_TITLE" HeaderText="LESSON_TITLE" SortExpression="LESSON_TITLE" HeaderStyle-BackColor="#ccffcc" />
                <asp:BoundField DataField="CONTENT_TYPE" HeaderText="CONTENT_TYPE" SortExpression="CONTENT_TYPE"  HeaderStyle-BackColor="#ccffcc"/>
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
                <div style="text-align: left;">
                <div style="width: 150px; display: inline-block;">COURSE_ID:</div><asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" SelectedValue='<%# Bind("COURSE_ID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
&nbsp;<br /><br /><div style="width: 150px; display: inline-block;">LESSON_NUMBER:</div>
                <asp:TextBox ID="LESSON_NUMBERTextBox" runat="server" Text='<%# Bind("LESSON_NUMBER") %>' />
                <asp:RegularExpressionValidator ID="LessonNumberValidator" runat="server" ControlToValidate="LESSON_NUMBERTextBox" ErrorMessage="Lesson number must be greater than or equal to 1." ValidationExpression="^[1-9]\d*$" />
                <br /><br />
                <div style="width: 150px; display: inline-block;">LESSON_TITLE:</div>
                <asp:TextBox ID="LESSON_TITLETextBox" runat="server" Text='<%# Bind("LESSON_TITLE") %>' />
                <br /> <br />
                <div style="width: 150px; display: inline-block;">CONTENT_TYPE:</div>
                <asp:TextBox ID="CONTENT_TYPETextBox" runat="server" Text='<%# Bind("CONTENT_TYPE") %>' />
                <br /><br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-success" style="font-size: larger;"/>
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" style="font-size: larger;"/>
                 </div>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" CssClass="btn btn-success" style="font-size: larger;" />
            </ItemTemplate>
        </asp:FormView>
            </div>
    </form>
</body>
</html>
