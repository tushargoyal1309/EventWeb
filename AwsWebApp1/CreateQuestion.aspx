<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="CreateQuestion.aspx.cs" Inherits="AwsWebApp1.CreateQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        var specialKeys = new Array();
        specialKeys.push(8); //Backspace
        specialKeys.push(9); //Tab
        specialKeys.push(46); //Delete
        specialKeys.push(36); //Home
        specialKeys.push(35); //End
        specialKeys.push(37); //Left
        specialKeys.push(39); //Right
        function IsAlphaNumeric(e) {
            var keyCode = e.keyCode == 0 ? e.charCode : e.keyCode;
            var ret = ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 65 && keyCode <= 90) || (keyCode >= 97 && keyCode <= 122) || (specialKeys.indexOf(e.keyCode) != -1 && e.charCode != e.keyCode));
            document.getElementById("error").style.display = ret ? "none" : "inline";
            return ret;
        }
    </script>
    <script type="text/javascript">
        var specialKeys = new Array();
        specialKeys.push(8); //Backspace
        specialKeys.push(9); //Tab
        specialKeys.push(46); //Delete
        specialKeys.push(36); //Home
        specialKeys.push(35); //End
        specialKeys.push(37); //Left
        specialKeys.push(39); //Right
        function IsAlphaNumericforQuestion(e) {
            var keyCode = e.keyCode == 0 ? e.charCode : e.keyCode;
            var ret = ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 65 && keyCode <= 90) || (keyCode >= 97 && keyCode <= 122) || (specialKeys.indexOf(e.keyCode) != -1 && e.charCode != e.keyCode));
            document.getElementById("error1").style.display = ret ? "none" : "inline";
            return ret;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div runat="server">
        <div class="panel panel-default">
            <div class="panel-heading" style="background-color: #2EC1CC; color: white">
                <h3 class="panel-title">Create an Event</h3>
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
                            <div class="form-group">
                                <input type="text" runat="server" id="inId" class="form-control input-sm" onkeypress="return IsAlphaNumeric(event);" ondrop="return false;"
        onpaste="return false;" />
                                     <span id="error" style="color: Red; display: none">* Special Characters not allowed</span>
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
                            <div class="form-group">
                                <input type="text" runat="server" id="inQid" class="form-control input-sm" onkeypress="return IsAlphaNumericforQuestion(event);" ondrop="return false;"
        onpaste="return false;" />
                                     <span id="error1" style="color: Red; display: none">* Special Characters not allowed</span>
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
                            <div class="form-group">
                                <asp:DropDownList AppendDataBoundItems="true" AutoPostBack="true" runat="server" ID="ddlQuestionType" class="form-control input-sm" type="text" placeholder="" OnSelectedIndexChanged="ddlQuestionType_SelectedIndexChanged1">
                                    <asp:ListItem Value="0">Objective</asp:ListItem>
                                    <asp:ListItem Value="1">Descriptive</asp:ListItem>
                                </asp:DropDownList>
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
                            <div class="form-group">
                                <asp:TextBox runat="server" ID="txtQuestion" ClientIDMode="Static" class="form-control input-sm" type="text" placeholder=""></asp:TextBox><br />
                            </div>
                        </div>
                        <div class="col-xs-2 col-sm-2 col-md-2"></div>
                    </div>
                    <div id="divOptions" runat="server" class="row">

                        <div class="col-xs-2 col-sm-2 col-md-2"></div>
                        <div class="col-xs-2 col-sm-2 col-md-2">
                            <div class="form-group" style="text-align: left">
                                <label>Options</label>
                            </div>
                        </div>
                        <div  class="col-xs-4 col-sm-4 col-md-4">
                            <div class="form-group" id="divTest" runat="server">
                                <asp:TextBox runat="server" ID="txtOptions0" ClientIDMode="Static" class="form-control input-sm" type="text" placeholder=""></asp:TextBox><br />
                                
                            </div>
                        </div>
                        <div class="col-xs-2 col-sm-2 col-md-2">
                            <div class="form-group">
                                <asp:Button ID="btnAddMore" Text="Add More Option(s)" OnClick="btnAddMore_Click" runat="server" CssClass="btn btn-info" />
                            </div>
                        </div>
                        <div class="col-xs-2 col-sm-2 col-md-2"></div>
                    </div>
                    <div id="divDescriptive" visible="false" runat="server" class="row">

                        <div class="col-xs-2 col-sm-2 col-md-2"></div>
                        <div class="col-xs-2 col-sm-2 col-md-2">
                            <div class="form-group" style="text-align: left">
                                <label>Description</label>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <div class="form-group">
                                <asp:TextBox runat="server" rows="5" Wrap="true"  ID="txtDescription" class="form-control input-sm" type="text" placeholder=""></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-2 col-sm-2 col-md-2"></div>
                    </div>
                    <div id="divCorrectAnswer" runat="server" class="row">

                        <div class="col-xs-2 col-sm-2 col-md-2"></div>
                        <div class="col-xs-2 col-sm-2 col-md-2">
                            <div class="form-group" style="text-align: left">
                                <label>Correct Answer</label>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <div class="form-group">
                                <asp:TextBox runat="server" ID="txtCorrectAnswer" class="form-control input-sm" type="text" placeholder=""></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-2 col-sm-2 col-md-2"></div>
                    </div>
                    <div class="row">
                        <div class="col-xs-4 col-sm-4 col-md-4"></div>
                        <div class="col-md-6">
                            <asp:Button runat="server" ID="Cancel" Text="Cancel" value="Cancel" class="btn btn-danger" OnClick="Cancel_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:Button runat="server" type="submit" ID="submitButton" OnClick="submitButton_Click" Text="Create" value="Create" class="btn btn-success" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
