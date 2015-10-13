<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="QuizAnswer.aspx.cs" Inherits="AwsWebApp1.QuizAnswer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section runat="server" id="divMain" style="background-color:#ffffff">
        <div class="page ng-scope">
            <section class="panel panel-default">
        <div class="panel panel-heading" style="height:50px">

                <p style="font-size:large"><span class="fa fa-table">&nbsp;&nbsp;</span>Answer
           
        
               <span style="margin-top:-5px;">
            <%--<span>Showing {{filteredStores.length}}/{{stores.length}} entries
            </span>--%>
         <%--<div class="col-md-3">
       <asp:Button runat="server" Text="Create a New Attendee" OnClick="newContent_Click" type="button" ID="newContent" class="btn btn-info"></asp:Button>
        </div>--%>
       </span>
                   </p>
        </div>
       
        <div runat="server" class="panel-body">
        <asp:GridView OnSelectedIndexChanged="gvQuizAnswer_SelectedIndexChanged"
        CssClass="table table-bordered table-striped table-responsive" AllowPaging="true" PageSize="5"
        AlternatingRowStyle-BackColor="#FFFFFF" BorderStyle="None" BackColor="#F9F9F9" ID="gvQuizAnswer"
        runat="server" AutoGenerateColumns="false" PagerStyle-BackColor="White">
        <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First" LastPageText="Last" />
        <PagerStyle BackColor="#FFFFFF" CssClass="GridPager" HorizontalAlign="center"/>
        <Columns>
           
<asp:TemplateField HeaderText="UserName"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="lbluserId" runat="server" Text='<%# Eval("userName") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="contentId" BorderStyle="None" runat="server" Text='<%# Eval("contentId") %>'></asp:TextBox>
</EditItemTemplate>--%>
    </asp:TemplateField>
<asp:TemplateField Visible="false" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="lblQuestions" runat="server" Text='<%# Eval("answeredQuestions") %>'></asp:Label>
</ItemTemplate>
    </asp:TemplateField>
            <asp:TemplateField Visible="false" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="lblAnswers" runat="server" Text='<%# Eval("answersByUser") %>'></asp:Label>
</ItemTemplate>
    </asp:TemplateField>
            <asp:TemplateField Visible="false" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="lblCorrectAnswer" runat="server" Text='<%# Eval("rightChoice") %>'></asp:Label>
</ItemTemplate>
    </asp:TemplateField>
    <asp:ButtonField CommandName="Select" HeaderText="Answeres" ImageUrl="images/edit%20(1).png"  Text="Edit" ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#FFFFFFF" ButtonType="Image" ItemStyle-Height="10px" CausesValidation="false"></asp:ButtonField>
    </Columns>   
        </asp:GridView>
            </div>
    </section>
            </div>
        </section>
    <div class="panel panel-default" runat="server" id="divEdit" visible="false">
        <div class="panel-heading" style="background-color: #2EC1CC; color: white">
            <h3 class="panel-title">Information</h3>
        </div>
        <asp:Label runat="server" Text="User:" Font-Bold="true"></asp:Label>
        <asp:Label runat="server" id="lblName"></asp:Label><br />
        <asp:Label runat="server" Text="Questions:" Font-Bold="true"></asp:Label><br />
        <asp:Label runat="server" ID="lblRightAnswer"></asp:Label>
    </div>
</asp:Content>
