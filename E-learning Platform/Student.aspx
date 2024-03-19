<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="E_learning_Platform.Student" %>

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
                <p>Student Details</p>
            </div>
        <asp:GridView ID="GridView1" CssCLass="table table-striped" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource1" AllowPaging="True">
            <Columns>
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" HeaderStyle-CssClass="text-black" HeaderStyle-BackColor="#ccffcc">
                        <ControlStyle CssClass="btn btn-danger " />
                    </asp:CommandField>
                    <asp:CommandField  HeaderText="Edit" ShowEditButton="True" HeaderStyle-CssClass="text-black " HeaderStyle-BackColor="#ccffcc">
                        <ControlStyle CssClass="btn btn-primary" />
                    </asp:CommandField>
                <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" HeaderStyle-BackColor="#ccffcc" />
                <asp:BoundField DataField="STUDENT_NAME" HeaderText="STUDENT_NAME" SortExpression="STUDENT_NAME" HeaderStyle-BackColor="#ccffcc" />
                <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" HeaderStyle-BackColor="#ccffcc" />
                <asp:BoundField DataField="EMAIL_ADDRESS" HeaderText="EMAIL_ADDRESS" SortExpression="EMAIL_ADDRESS" HeaderStyle-BackColor="#ccffcc" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" HeaderStyle-BackColor="#ccffcc"/>
                <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY" HeaderStyle-BackColor="#ccffcc"/>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;STUDENT&quot; WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID" InsertCommand="INSERT INTO &quot;STUDENT&quot; (&quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot;, &quot;CONTACT&quot;, &quot;EMAIL_ADDRESS&quot;, &quot;DOB&quot;, &quot;COUNTRY&quot;) VALUES (:STUDENT_ID, :STUDENT_NAME, :CONTACT, :EMAIL_ADDRESS, :DOB, :COUNTRY)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot;, &quot;CONTACT&quot;, &quot;EMAIL_ADDRESS&quot;, &quot;DOB&quot;, &quot;COUNTRY&quot; FROM &quot;STUDENT&quot;" UpdateCommand="UPDATE &quot;STUDENT&quot; SET &quot;STUDENT_NAME&quot; = :STUDENT_NAME, &quot;CONTACT&quot; = :CONTACT, &quot;EMAIL_ADDRESS&quot; = :EMAIL_ADDRESS, &quot;DOB&quot; = :DOB, &quot;COUNTRY&quot; = :COUNTRY WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID">
            <DeleteParameters>
                <asp:Parameter Name="STUDENT_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="STUDENT_ID" Type="Decimal" />
                <asp:Parameter Name="STUDENT_NAME" Type="String" />
                <asp:Parameter Name="CONTACT" Type="String" />
                <asp:Parameter Name="EMAIL_ADDRESS" Type="String" />
                <asp:Parameter Name="DOB" Type="DateTime" />
                <asp:Parameter Name="COUNTRY" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="STUDENT_NAME" Type="String" />
                <asp:Parameter Name="CONTACT" Type="String" />
                <asp:Parameter Name="EMAIL_ADDRESS" Type="String" />
                <asp:Parameter Name="DOB" Type="DateTime" />
                <asp:Parameter Name="COUNTRY" Type="String" />
                <asp:Parameter Name="STUDENT_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource1">
            <InsertItemTemplate>
                <div style="text-align: left;">
                    <div style="width: 150px; display: inline-block;">STUDENT_ID:</div>
                    <asp:TextBox ID="STUDENT_IDTextBox" runat="server" Text='<%# Bind("STUDENT_ID") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="STUDENT_IDTextBox" ErrorMessage="This Field is Required." />
                    <br /> <br />
                    <div style="width: 150px; display: inline-block;">STUDENT_NAME:</div>
                    <asp:TextBox ID="STUDENT_NAMETextBox" runat="server" Text='<%# Bind("STUDENT_NAME") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="STUDENT_NAMETextBox" ErrorMessage="This Field is Required." />
                    <br /><br />
                    <div style="width: 150px; display: inline-block;">CONTACT:</div>
                    <asp:TextBox ID="CONTACTTextBox" runat="server" Text='<%# Bind("CONTACT") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="CONTACTTextBox" ErrorMessage="This Field is Required." />
                    <br /><br />
                    <div style="width: 150px; display: inline-block;">EMAIL_ADDRESS:</div>
                    <asp:TextBox ID="EMAIL_ADDRESSTextBox" runat="server" Text='<%# Bind("EMAIL_ADDRESS") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="EMAIL_ADDRESSTextBox" ErrorMessage="This Field is Required." />
                    <br /><br />
                    <div style="width: 150px; display: inline-block;">DOB:</div>
                    <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DOBTextBox" ErrorMessage="This Field is Required." />
                    <br /><br />
                    <div style="width: 150px; display: inline-block;">COUNTRY:</div>
                    <asp:TextBox ID="COUNTRYTextBox" runat="server" Text='<%# Bind("COUNTRY") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="COUNTRYTextBox" ErrorMessage="This Field is Required." />
                    <br /><br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-success" style="font-size: larger;" />
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
