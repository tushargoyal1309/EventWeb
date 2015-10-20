<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Question.aspx.cs" Inherits="AwsWebApp1.Question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style type="text/css">
        .txtOptions{
            display:none;
        }
         #txtOptions{
            display:none;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <section id="divMain" runat="server" style="background-color: #ffffff; overflow: hidden">
        <div class="page ng-scope">
            <section class="panel panel-default">
        <div class="panel panel-heading" style="height:50px">

                <p style="font-size:large"><span class="glyphicon glyphicon-question-sign">&nbsp;</span>Question
           
        
               <span style="margin-top:-5px;"><asp:Button ID="btnNewQuestion"  Style="margin-top:-3px;" Text="Create Question" runat="server" OnClick="btnNewQuestion_Click" type="button" class="btn btn-info pull-right"></asp:Button>
            </span>
                   </p>
        </div>
       
        <div runat="server" class="panel-body">
        <asp:GridView OnSelectedIndexChanged="questionData_SelectedIndexChanged" PageSize="5" OnPageIndexChanging="questionData_PageIndexChanging"
            CssClass="table table-bordered table-striped table-responsive" AllowPaging="true"
            AlternatingRowStyle-BackColor="#FFFFFF" BorderStyle="None" BackColor="#F9F9F9" ID="questionData"
            runat="server" AutoGenerateColumns="false" PagerStyle-BackColor="White">
            <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First" LastPageText="Last" />
            <PagerStyle BackColor="#FFFFFF" CssClass="GridPager" HorizontalAlign="center" />
            <Columns>


                <asp:TemplateField HeaderText="Question&nbsp;Id" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
                    <ItemTemplate>
                        <asp:Label ID="questionId" runat="server" Text='<%# Eval("questionId") %>'></asp:Label>
                    </ItemTemplate>
                    <%--<EditItemTemplate>
<asp:TextBox ID="TextBox3" BorderStyle="None" runat="server" Text='<%# Eval("questionId") %>'></asp:TextBox>
</EditItemTemplate>--%>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Event&nbsp;Id" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
                    <ItemTemplate>
                        <asp:Label ID="eventId" runat="server" Text='<%# Eval("eventId") %>'></asp:Label>
                    </ItemTemplate>
                    <%--<EditItemTemplate>
<asp:TextBox ID="TextBox1" BorderStyle="None" runat="server" Text='<%# Eval("eventId") %>'></asp:TextBox>
</EditItemTemplate>--%>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Question&nbsp;Type" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
                    <ItemTemplate>
                        <asp:Label ID="lblQuestionType" runat="server" Text='<%# Eval("questionType") %>'></asp:Label>
                    </ItemTemplate>
                    <%--<EditItemTemplate>
<asp:TextBox ID="TextBox3" BorderStyle="None" runat="server" Text='<%# Eval("questionId") %>'></asp:TextBox>
</EditItemTemplate>--%>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Question" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
                    <ItemTemplate>
                        <asp:Label ID="question" runat="server" Text='<%# Eval("question") %>'></asp:Label>
                    </ItemTemplate>
                    <%--<EditItemTemplate>
<asp:TextBox ID="TextBox2" BorderStyle="None" runat="server" Text='<%# Eval("question") %>'></asp:TextBox>
</EditItemTemplate>--%>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Options" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
                    <ItemTemplate>
                        <asp:Label ID="options" runat="server" Text='<%# Eval("options") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Correct&nbsp;Answer" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
                    <ItemTemplate>
                        <asp:Label ID="correctAnswer" runat="server" Text='<%# Eval("correctAnswer") %>'></asp:Label>
                    </ItemTemplate>
                    <%--<EditItemTemplate>
<asp:TextBox ID="correctAnswer" BorderStyle="None" runat="server" Text='<%# Eval("correctAnswer") %>'></asp:TextBox>
</EditItemTemplate>--%>
                </asp:TemplateField>


                <%--<EditItemTemplate>
<asp:TextBox ID="correctAnswer" BorderStyle="None" runat="server" Text='<%# Eval("correctAnswer") %>'></asp:TextBox>
</EditItemTemplate>--%>

                <%--  <asp:TemplateField Visible="false" HeaderText="CorrectAnswer"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="correctAnswerB" runat="server" Text='<%# Eval("optionB") %>'></asp:Label>
</ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField Visible="false" HeaderText="CorrectAnswer"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="correctAnswerC" runat="server" Text='<%# Eval("optionC") %>'></asp:Label>
</ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField Visible="false" HeaderText="CorrectAnswer"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="correctAnswerD" runat="server" Text='<%# Eval("optionD") %>'></asp:Label>
</ItemTemplate>
            </asp:TemplateField>--%>
                <asp:ButtonField CommandName="Select" ImageUrl="images/edit%20(1).png" HeaderText="Actions" ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#FFFFFFF" Text="Edit" ButtonType="Image" ItemStyle-Height="10px" CausesValidation="false"></asp:ButtonField>
            </Columns>
        </asp:GridView>
            </div>
    </section>
            </div>
        </section>

    <%--<asp:Panel id="pnlEdit" ClientIDMode="Static"  visible="false" runat="server" >--%>
    <div class="panel panel-default" runat="server" id="pnlEdit" visible="false">
        <div class="panel-heading" style="background-color: #2EC1CC; color: white">
            <h3 class="panel-title"><span class="glyphicon glyphicon-question-sign">&nbsp;</span>Edit a Question</h3>
        </div>
        <div class="panel-body">
            <div id="divParent">
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group" style="text-align: left">
                            <label>Event Id</label>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group" style="text-align: left;">
                            <asp:Label style="font-size:13px"  ID="eId" CssClass="form-control input-sm" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group" style="text-align: left">
                            <label>Question Id</label>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group" style="text-align: left;">
                            <asp:Label style="font-size:13px"  ID="lblquestionId" CssClass="form-control input-sm" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group" style="text-align: left">
                            <label>Question</label>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group" style="text-align: left;">
                            <asp:TextBox style="font-size:13px"  ID="txtQuestionEdit" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" controltovalidate="txtQuestionEdit" errormessage="Please enter Question!" />
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group" style="text-align: left">
                            <label>Question Type</label>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group" style="text-align: left;">
                            <asp:TextBox style="font-size:13px"  ID="txtQuestionType" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group" style="text-align: left">
                            <label>Correct Answer</label>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group" style="text-align: left;">
                            <asp:TextBox style="font-size:13px"  ID="txtCorrectanswer" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                       <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator4" controltovalidate="txtCorrectanswer" errormessage="Please enter Answer!" />
                             </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group" style="text-align: left">
                            <label>Options</label>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                       <div class="form-group"  ID="pnlOptions" ClientIDMode="Static" runat="server">
                           <asp:TextBox style="font-size:13px"  ID="txtOptions" ClientIDMode="Static" CssClass="form-control input-sm hideOne"  runat="server"></asp:TextBox>
                       <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator3" controltovalidate="txtOptions" errormessage="Please enter Options!" /> 
                       </div>
                    </div>
                                        <div class="col-xs-2 col-sm-2 col-md-2">
                                                                    <div class="form-group" style="text-align: left;">
                     <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-info" Text="Add More Option(s)" OnClick="AddTextBox" />
</div>
                                            </div>
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4"></div>
                    <div class="col-md-6">
                        <asp:Button ID="btncancle" ClientIDMode="Static" OnClick="btncancle_Click" CausesValidation="false" runat="server" CssClass="btn btn-danger" Text="Cancel" />&nbsp;&nbsp;&nbsp;&nbsp;
       
                       
                        <asp:Button ID="btnUpdate" runat="server" ClientIDMode="Static"  OnClick="Update_Click" CssClass="btn btn-success" Text="Update" />


                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                           
                </div>
            </div>
        </div>
    </div>


    <%--</asp:Panel>--%>
</asp:Content>
