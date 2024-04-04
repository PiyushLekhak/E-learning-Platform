<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Record.aspx.cs" Inherits="E_learning_Platform.Student_Record" %>

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
                <p>Student Progress Details</p>
            </div>        
            <asp:GridView ID="GridView2" CssClass="table table-striped" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID,COURSE_ID,LESSON_NUMBER" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" HeaderStyle-CssClass="text-black" HeaderStyle-BackColor="#ccffcc">
                        <ControlStyle CssClass="btn btn-danger " />

<HeaderStyle BackColor="#CCFFCC" CssClass="text-black"></HeaderStyle>
                    </asp:CommandField>
                    <asp:CommandField  HeaderText="Edit" ShowEditButton="True" HeaderStyle-CssClass="text-black " HeaderStyle-BackColor="#ccffcc">
                        <ControlStyle CssClass="btn btn-primary" />

<HeaderStyle BackColor="#CCFFCC" CssClass="text-black "></HeaderStyle>
                    </asp:CommandField>
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" HeaderStyle-BackColor="#ccffcc">
<HeaderStyle BackColor="#CCFFCC"></HeaderStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="STUDENT NAME" HeaderStyle-BackColor="#ccffcc">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList4" Enabled="false" runat="server" DataSourceID="SqlDataSourceStudent" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceStudent" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" HeaderStyle-BackColor="#ccffcc">
<HeaderStyle BackColor="#CCFFCC"></HeaderStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="COURSE TITLE" HeaderStyle-BackColor="#ccffcc">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList5" Enabled="false" runat="server" DataSourceID="SqlDataSourceCourse" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceCourse" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="LESSON_NUMBER" HeaderText="LESSON_NUMBER" ReadOnly="True" SortExpression="LESSON_NUMBER" HeaderStyle-BackColor="#ccffcc">
<HeaderStyle BackColor="#CCFFCC"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="LESSON_STATUS" HeaderText="LESSON_STATUS" SortExpression="LESSON_STATUS" HeaderStyle-BackColor="#ccffcc">
<HeaderStyle BackColor="#CCFFCC"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="LAST_ACCESSED_DATE" HeaderText="LAST_ACCESSED_DATE" SortExpression="LAST_ACCESSED_DATE" HeaderStyle-BackColor="#ccffcc">
<HeaderStyle BackColor="#CCFFCC"></HeaderStyle>
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;STUDENT_RECORD&quot; WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID AND &quot;COURSE_ID&quot; = :COURSE_ID AND &quot;LESSON_NUMBER&quot; = :LESSON_NUMBER" InsertCommand="INSERT INTO &quot;STUDENT_RECORD&quot; (&quot;STUDENT_ID&quot;, &quot;COURSE_ID&quot;, &quot;LESSON_NUMBER&quot;, &quot;LESSON_STATUS&quot;, &quot;LAST_ACCESSED_DATE&quot;) VALUES (:STUDENT_ID, :COURSE_ID, :LESSON_NUMBER, :LESSON_STATUS, :LAST_ACCESSED_DATE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;STUDENT_RECORD&quot;" UpdateCommand="UPDATE &quot;STUDENT_RECORD&quot; SET &quot;LESSON_STATUS&quot; = :LESSON_STATUS, &quot;LAST_ACCESSED_DATE&quot; = :LAST_ACCESSED_DATE WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID AND &quot;COURSE_ID&quot; = :COURSE_ID AND &quot;LESSON_NUMBER&quot; = :LESSON_NUMBER">
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
                <EditItemTemplate>
                    STUDENT_ID:
                    <asp:Label ID="STUDENT_IDLabel1" runat="server" Text='<%# Eval("STUDENT_ID") %>' />
                    <br />
                    COURSE_ID:
                    <asp:Label ID="COURSE_IDLabel1" runat="server" Text='<%# Eval("COURSE_ID") %>' />
                    <br />
                    LESSON_NUMBER:
                    <asp:Label ID="LESSON_NUMBERLabel1" runat="server" Text='<%# Eval("LESSON_NUMBER") %>' />
                    <br />
                    LESSON_STATUS:
                    <asp:TextBox ID="LESSON_TITLETextBox" runat="server" Text='<%# Bind("LESSON_TITLE") %>' />
                    <br />
                    LAST_ACCESSED_DATE:
                    <asp:TextBox ID="LESSON_STATUSTextBox" runat="server" Text='<%# Bind("LESSON_STATUS") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update"/>
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div style="text-align: left;">
                        <div style="width: 180px; display: inline-block;">STUDENT_NAME:</div>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
                        <br /><br />
                        <div style="width: 180px; display: inline-block;">COURSE_TITLE:</div>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                        <br /><br />
                        <div style="width: 180px; display: inline-block;">LESSON_TITLE:</div>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="LESSON_TITLE" DataValueField="LESSON_NUMBER" SelectedValue='<%# Bind("LESSON_NUMBER") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;LESSON_NUMBER&quot;, &quot;LESSON_TITLE&quot; FROM &quot;LESSON&quot;"></asp:SqlDataSource>
                        <br /><br />
                        <div style="width: 180px; display: inline-block;">LESSON_STATUS:</div>
                        <asp:TextBox ID="LESSON_STATUSTextBox" runat="server" Text='<%# Bind("LESSON_STATUS") %>' />
                        <br /><br />
                        <div style="width: 180px; display: inline-block;">LAST_ACCESSED_DATE:</div>
                        <asp:TextBox ID="LAST_ACCESSED_DATETextBox" runat="server" Text='<%# Bind("LAST_ACCESSED_DATE") %>' />
                        <br /><br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-success" style="font-size: larger;"/>
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" style="font-size: larger;" />
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
