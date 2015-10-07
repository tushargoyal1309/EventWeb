<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="CreateSession.aspx.cs" Inherits="AwsWebApp1.CreateSession" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div runat="server">
    <div class="panel panel-default">
        <div class="panel-heading" style="background-color: #449DD5; color: white">
            <h3 class="panel-title">Create a Session</h3>
        </div>
        <div class="panel-body">
            <div id="divParent">
                      <div class="row">
                  
                      <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group"  style="text-align:left">
                                    <label>EventId</label>
                                 </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                <asp:TextBox runat="server" id="eventId" cssclass="form-control input-sm" type="text" placeholder="">
                                    </asp:TextBox>
                                </div>
                            </div>
                     <div class="col-xs-2 col-sm-2 col-md-2"></div>
                        </div>
                <div class="row">
                  
                      <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group"  style="text-align:left">
                                    <label>Name</label>
                                    </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group" style="text-align:left;">
                                  <asp:TextBox runat="server" id="name" cssclass="form-control input-sm" type="text" placeholder="">
                                      </asp:TextBox>
                                </div>
                            </div>
                     <div class="col-xs-2 col-sm-2 col-md-2"></div>
                        </div>
                <div class="row">
                         <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group"  style="text-align:left">
                                    <label>Start Time</label>
                                        </div>
                                   </div>
                                                        <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group" style="text-align:left;">
                                   <asp:TextBox runat="server" id="startTime"  cssclass="form-control input-sm" type="text" placeholder="">
                                       </asp:TextBox>
                                </div>
                            </div>
                     <div class="col-xs-2 col-sm-2 col-md-2"></div>
                        </div>
                <div class="row">
                         <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group"  style="text-align:left">
                                    <label>End Time</label>
                                    </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group" style="text-align:left;">
                                  <asp:TextBox runat="server" id="endTime"  cssclass="form-control input-sm" type="text" placeholder="">
                                      </asp:TextBox>
                                </div>
                            </div>
                     <div class="col-xs-2 col-sm-2 col-md-2"></div>
                        </div>
                <div class="row">
                  
                      <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group"  style="text-align:left">
                                    <label>Speaker Name</label>
                                   </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <asp:TextBox runat="server" id="speakerName"  cssclass="form-control input-sm" type="text" placeholder="">
                                        </asp:TextBox>
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
</asp:Content>
