<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Question.aspx.cs" Inherits="AwsWebApp1.Question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                <button type="button" class="btn btn-info">Create Question</button>
            </div>
        </div>
        <br />
        <asp:GridView OnSelectedIndexChanged="questionData_SelectedIndexChanged"
            CssClass="table table-bordered table-striped table-responsive" AllowPaging="true"
            AlternatingRowStyle-BackColor="#FFFFFF" BorderStyle="None" BackColor="#F9F9F9" ID="questionData"
            runat="server" AutoGenerateColumns="false" PagerStyle-BackColor="White">
            <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First" LastPageText="Last" />
            <PagerStyle BackColor="#FFFFFF" CssClass="GridPager" HorizontalAlign="center" />
            <Columns>
                <asp:TemplateField HeaderText="CorrectAnswer" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
                    <ItemTemplate>
                        <asp:Label ID="correctAnswer" runat="server" Text='<%# Eval("correctAnswer") %>'></asp:Label>
                    </ItemTemplate>
                    <%--<EditItemTemplate>
<asp:TextBox ID="correctAnswer" BorderStyle="None" runat="server" Text='<%# Eval("correctAnswer") %>'></asp:TextBox>
</EditItemTemplate>--%>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Options" AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="options" runat="server" Text='<%# Eval("options") %>'></asp:Label>
</ItemTemplate>
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
                <asp:TemplateField HeaderText="EventId" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
                    <ItemTemplate>
                        <asp:Label ID="eventId" runat="server" Text='<%# Eval("eventId") %>'></asp:Label>
                    </ItemTemplate>
                    <%--<EditItemTemplate>
<asp:TextBox ID="TextBox1" BorderStyle="None" runat="server" Text='<%# Eval("eventId") %>'></asp:TextBox>
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
                <asp:TemplateField HeaderText="QuestionId" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
                    <ItemTemplate>
                        <asp:Label ID="questionId" runat="server" Text='<%# Eval("questionId") %>'></asp:Label>
                    </ItemTemplate>
                    <%--<EditItemTemplate>
<asp:TextBox ID="TextBox3" BorderStyle="None" runat="server" Text='<%# Eval("questionId") %>'></asp:TextBox>
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
                <asp:ButtonField CommandName="Select" HeaderText="Actions" ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#FFFFFFF" Text="Edit" ButtonType="Image" ItemStyle-Height="10px" CausesValidation="false"></asp:ButtonField>
            </Columns>
        </asp:GridView>
    </div>
    <asp:Panel id="pnlEdit" ClientIDMode="Static"  visible="false" runat="server" >
        <asp:Label ID="eId" runat="server"></asp:Label>
        <asp:Label ID="lblquestionId" runat="server"></asp:Label>
        <asp:TextBox ID="txtQuestionEdit" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtQuestionType" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtCorrectanswer" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtOptions" runat="server"></asp:TextBox>
       
        <asp:Button ID="btnAdd" runat="server" Text="Add More Question(s)" OnClick="AddTextBox" />

     <asp:Button ID="Update" runat="server" OnClick="Update_Click" Text="Update Question(s)" />

    </asp:Panel>

    
</asp:Content>
