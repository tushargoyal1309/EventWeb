<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="QuizAnswer.aspx.cs" Inherits="AwsWebApp1.QuizAnswer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section runat="server" id="divMain" style="background-color:#ffffff">
        <div class="page ng-scope">
            <section class="panel panel-default">
        <div class="panel panel-heading" style="height:50px">

                <p style="font-size:large"><span class="glyphicon glyphicon-ok">&nbsp;</span>Answer
           
        
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
        <asp:GridView OnSelectedIndexChanged="gvQuizAnswer_SelectedIndexChanged" OnPageIndexChanging="gvQuizAnswer_PageIndexChanging"
        CssClass="table table-bordered table-striped table-responsive" AllowPaging="true" PageSize="5"
        AlternatingRowStyle-BackColor="#FFFFFF" BorderStyle="None" BackColor="#F9F9F9" ID="gvQuizAnswer"
        runat="server" AutoGenerateColumns="false" PagerStyle-BackColor="White">
        <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First" LastPageText="Last" />
        <PagerStyle BackColor="#FFFFFF" CssClass="GridPager" HorizontalAlign="center"/>
        <Columns>
           
<asp:TemplateField HeaderText="User&nbsp;Name"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
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
    <asp:ButtonField CommandName="Select" HeaderText="Answeres" ImageUrl="images/eye.png"  Text="Edit" ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#FFFFFFF" ButtonType="Image" ItemStyle-Height="10px" CausesValidation="false"></asp:ButtonField>
    </Columns>   
        </asp:GridView>
            </div>
    </section>
            </div>
        </section>
<%--   <div class="panel panel-default" runat="server" id="divEdit">--%>
       <%-- 
        </div>
       
        <asp:Label runat="server" ID="lblRightAnswer"></asp:Label>--%>
    
    <div id="divQuestion" runat="server" visible="false">
        <div class="panel-heading" style="background-color: #008000; color: white">
            <h3 class="panel-title"><span class="glyphicon glyphicon-ok">&nbsp;</span>Information</h3>
            </div>
        
        <div class="col-md-6">
                    <div class="col-md-2">
        <asp:Label  style="font-size:13px" runat="server" Text="User:" Font-Bold="true"></asp:Label>
                        </div>
                    <div class="col-md-4">
            <asp:Label style="font-size:13px"  runat="server" id="lblName"></asp:Label>

                        </div>
            </div>
        <div class="col-md-12" style="padding-top:30px">
        <asp:Label runat="server" style="font-size:13px;" Text="Questions:" Font-Bold="true"></asp:Label>
    </div>
        </div>
       <div class="row" style="padding-top:30px">
    <div id="divAnsUser" class="col-md-6" runat="server" visible="false" style="padding-left:20px">
    <asp:Label runat="server" style="font-size:13px; padding-left:20px"  Text="Answers given by this user" Font-Bold="true"></asp:Label>
        <br />
    </div>
    <div id="divCorrectAnswer" class="col-md-6" runat="server" visible="false">
    <asp:Label runat="server" style="font-size:13px"  Text="Correct Answers Of Objective questions only" Font-Bold="true"></asp:Label>
    </div>
           <div class="col-md-12 center-block" runat="server">
           <asp:Button ID="btncancle" runat="server" CausesValidation="false" CssClass="btn btn-danger" OnClick="btncancle_Click" Text="Cancel"/>
       </div>
           </div>
       
<%--       </div>--%>
</asp:Content>
