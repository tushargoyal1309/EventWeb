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

  <script type = "text/javascript">
      function SetSource(SourceID) {
          var hidSourceID = document.getElementById("<%=hidSourceID.ClientID%>");
        hidSourceID.value = SourceID;
    }
</script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div id="divMain" runat="server" style="background-color: #ffffff">
        <br />
        <div class="row">

            <div class="col-md-4" style="padding-left: 40px;">
                <input type="text"
                    placeholder="Search..."
                    class="form-control fa-border"
                    data-ng-model="searchKeywords"
                    data-ng-keyup="search()">
            </div>
            <div class="col-md-5 filter-result-info">
                <%--<span>Showing {{filteredStores.length}}/{{stores.length}} entries
            </span>--%>
            </div>
            <div class="col-md-3">
                <asp:Button ID="btnNewQuestion" Text="Add a new Question" runat="server" OnClick="btnNewQuestion_Click" type="button" class="btn btn-info"></asp:Button>
            </div>
        </div>
        <br />
        <asp:GridView OnSelectedIndexChanged="questionData_SelectedIndexChanged" PageSize="5" OnPageIndexChanging="questionData_PageIndexChanging"
            CssClass="table table-bordered table-striped table-responsive" AllowPaging="true"
            AlternatingRowStyle-BackColor="#FFFFFF" BorderStyle="None" BackColor="#F9F9F9" ID="questionData"
            runat="server" AutoGenerateColumns="false" PagerStyle-BackColor="White">
            <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First" LastPageText="Last" />
            <PagerStyle BackColor="#FFFFFF" CssClass="GridPager" HorizontalAlign="center" />
            <Columns>


                <asp:TemplateField HeaderText="QuestionId" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
                    <ItemTemplate>
                        <asp:Label ID="questionId" runat="server" Text='<%# Eval("questionId") %>'></asp:Label>
                    </ItemTemplate>
                    <%--<EditItemTemplate>
<asp:TextBox ID="TextBox3" BorderStyle="None" runat="server" Text='<%# Eval("questionId") %>'></asp:TextBox>
</EditItemTemplate>--%>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="EventId" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
                    <ItemTemplate>
                        <asp:Label ID="eventId" runat="server" Text='<%# Eval("eventId") %>'></asp:Label>
                    </ItemTemplate>
                    <%--<EditItemTemplate>
<asp:TextBox ID="TextBox1" BorderStyle="None" runat="server" Text='<%# Eval("eventId") %>'></asp:TextBox>
</EditItemTemplate>--%>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="QuestionType" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
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
                <asp:TemplateField HeaderText="CorrectAnswer" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
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

    <%--<asp:Panel id="pnlEdit" ClientIDMode="Static"  visible="false" runat="server" >--%>
    <div class="panel panel-default" runat="server" id="pnlEdit" visible="false">
        <div class="panel-heading" style="background-color: #2EC1CC; color: white">
            <h3 class="panel-title">Edit a Question</h3>
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
                            <asp:Label ID="eId" CssClass="form-control input-sm" runat="server"></asp:Label>
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
                            <asp:Label ID="lblquestionId" CssClass="form-control input-sm" runat="server"></asp:Label>
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
                            <asp:TextBox ID="txtQuestionEdit" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group" style="text-align: left">
                            <label>QuestionType</label>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group" style="text-align: left;">
                            <asp:TextBox ID="txtQuestionType" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group" style="text-align: left">
                            <label>CorrectAnswer</label>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group" style="text-align: left;">
                            <asp:TextBox ID="txtCorrectanswer" CssClass="form-control input-sm" runat="server"></asp:TextBox>
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
                    <div class="col-xs-6 col-sm-6 col-md-6">
                       <div class="form-group"  ID="pnlOptions" ClientIDMode="Static" runat="server">
                           <asp:TextBox ID="txtOptions" ClientIDMode="Static" CssClass="form-control input-sm hideOne"  runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4"></div>
                    <div class="col-md-6">
                        <asp:Button ID="btncancle" OnClick="btncancle_Click" runat="server" CssClass="btn btn-danger" Text="Cancel" />&nbsp;&nbsp;&nbsp;&nbsp;
       
                        <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-info" Text="Add More Option(s)" OnClick="AddTextBox" />&nbsp;&nbsp;&nbsp;&nbsp;
    
                        <asp:Button ID="btnUpdate" runat="server" ClientIDMode="Static"  OnClientClick = "SetSource(this.id)" OnClick="Update_Click" CssClass="btn btn-success" Text="Update" />


                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <asp:HiddenField ID="hidSourceID" runat="server" />
                </div>
            </div>
        </div>
    </div>


    <%--</asp:Panel>--%>
</asp:Content>
