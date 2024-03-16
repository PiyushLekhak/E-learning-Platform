<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Best E-learning Course.aspx.cs" Inherits="E_learning_Platform.Best_E_learning_Course" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT course_id, course_title, num_enrollments
FROM (
    SELECT c.course_id, c.course_title, COUNT(e.enrollment_id) AS num_enrollments,
           ROW_NUMBER() OVER (ORDER BY COUNT(e.enrollment_id) DESC) as rownumber
    FROM course c
    JOIN enrollment e ON c.course_id = e.course_id
    WHERE EXTRACT(MONTH FROM e.enrollment_date) = :month
    GROUP BY c.course_id, c.course_title
)
WHERE rownumber &lt;= 3
">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="month" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT 
       EXTRACT(MONTH FROM enrollment_date) AS month_number,
       TO_CHAR(enrollment_date, 'Month') AS month_name
FROM enrollment
ORDER BY month_number
"></asp:SqlDataSource>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="MONTH_NAME" DataValueField="MONTH_NUMBER">
            </asp:DropDownList>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" DataSourceID="SqlDataSource1">
        </asp:GridView>
    </form>
</body>
</html>
