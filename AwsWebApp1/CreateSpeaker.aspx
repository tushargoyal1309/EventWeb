<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="CreateSpeaker.aspx.cs" Inherits="AwsWebApp1.CreateSpeaker" %>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div runat="server">
    <div class="panel panel-default">
        <div class="panel-heading" style="background-color: #F98E33; color: white">
            <h3 class="panel-title">Create a Speaker</h3>
        </div>
        <div class="panel-body">
            <div id="divParent">
                <div class="row">
                    <div class="row">
                  
                      <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group"  style="text-align:left">
                                    <label>Biography</label>
                                 </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                   <asp:TextBox runat="server" TextMode="multiline" cssclass="form-control input-sm" id="Biography" class="form-control input-lg" Columns="10" Height="100" Wrap="true" type="text" placeholder="">
                                       </asp:TextBox>
                                </div>
                            </div>
                     <div class="col-xs-2 col-sm-2 col-md-2"></div>
                        </div>
                <div class="row">
                  
                      <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group"  style="text-align:left">
                                    <label>EventId</label>
                                    </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group" style="text-align:left;">
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
                                <div class="form-group"  style="text-align:left">
                                    <label>SpeakerName</label>
                                        </div>
                                   </div>
                                                        <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group" style="text-align:left;">
                                  <asp:TextBox runat="server" id="SpeakerName" class="form-control input-sm" type="text" placeholder="">
                                      </asp:TextBox>
                                </div>
                            </div>
                     <div class="col-xs-2 col-sm-2 col-md-2"></div>
                        </div>
                <div class="row">
                         <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group"  style="text-align:left">
                                    <label>Email</label>
                                    </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group" style="text-align:left;">
                                   <asp:TextBox runat="server" id="Email" class="form-control input-sm" type="text" placeholder="">
                                       </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate = "Email" Display ="Dynamic" runat="server" ErrorMessage="Please enter email"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate = "Email" Display ="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.(com|co\.(in|uk)|org)$"
    ErrorMessage="Please enter valid email address. Eg. Something@domain.com"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                     <div class="col-xs-2 col-sm-2 col-md-2"></div>
                        </div>
                <div class="row">
                  
                      <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group"  style="text-align:left">
                                    <label>Designation</label>
                                    </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group" style="text-align:left;">
                                  <asp:TextBox runat="server" id="Designation" class="form-control input-sm" type="text" placeholder="">
                                      </asp:TextBox>
                                </div>
                            </div>
                     <div class="col-xs-2 col-sm-2 col-md-2"></div>
                        </div>
                <%--<div class="row">
                         <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group"  style="text-align:left">
                                    <label>Choose a file to upload</label>
                                    </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group" style="text-align:left;">
                                    <asp:FileUpload ID="file" runat="server" />
                                   </div>
                            </div>
                     <div class="col-xs-2 col-sm-2 col-md-2"></div>
                        </div>--%>
                <div class="row">
                         <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group"  style="text-align:left">
                                    <label>Organization</label>
                                    </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group" style="text-align:left;">
                                   <asp:TextBox runat="server" id="Organization" class="form-control input-sm" type="text" placeholder="">
                                       </asp:TextBox>
                                </div>
                            </div>
                     
                   <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
               <div class="row">
                  
                      <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group"  style="text-align:left">
                                    <label>Choose image to upload</label>
                                    </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group" style="text-align:left;">
                                  <asp:FileUpload runat="server" ID="flFile" class="form-control input-sm">
                                      </asp:FileUpload>
                                </div>
                            </div>
                     <div class="col-xs-2 col-sm-2 col-md-2"></div>
                        </div>


                    <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4"></div>
                    <div class="col-md-6">
                   <asp:Button runat="server" id="Cancel" Text="Cancel" value="Cancel" class="btn btn-danger" OnClick="Cancel_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:Button runat="server" type="submit" id="submitButton" OnClick="submitButton_Click" Text="Create" value="Create" class="btn btn-success" />
                   </div>
                        </div>

            </div>
        </div>
       </div></div>
         </div>
</asp:Content>
