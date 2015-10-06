<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="CreateSession.aspx.cs" Inherits="AwsWebApp1.CreateSession" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div runat="server">
    <div class="panel panel-default">
        <div class="panel-heading" style="background-color: #449DD5; color: white">
            <h3 class="panel-title">Create a Session</h3>
        </div>
        <div class="panel-body text-center">
            <div class="col-md-12" id="divParent">
                      <div class="row">
                            <div class="col-md-6">
                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                    <span style="font-family:Adobe Hebrew">EventId</span>
                                 </div>
                            </div>

                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                <asp:TextBox runat="server" id="eventId" class="form-control input-sm" type="text" placeholder="">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                       <span style="font-family:Adobe Hebrew">Name</span>
                                    </div>
                            </div>

                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                  <asp:TextBox runat="server" id="name" class="form-control input-sm" type="text" placeholder="">
                                      </asp:TextBox>
                                </div>
                            </div>
                        </div>
                         <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                        <span style="font-family:Adobe Hebrew">StartTime</span>
                                    </div>
                            </div>

                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                   <asp:TextBox runat="server" id="startTime" class="form-control input-sm" type="text" placeholder="">
                                       </asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                       <span style="font-family:Adobe Hebrew">EndTime</span>
                                    </div>
                            </div>

                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                  <asp:TextBox runat="server" id="endTime" class="form-control input-sm" type="text" placeholder="">
                                      </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                       <span style="font-family:Adobe Hebrew">Speaker Name</span>
                                   </div>
                            </div>

                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <asp:TextBox runat="server" id="speakerName" class="form-control input-sm" type="text" placeholder="">
                                        </asp:TextBox>
                                </div>
                            </div>
                        </div>

                                            
                    </div>
                    
                </div>
                    <div class="row">
                        <div class="col-md-6">
                   <asp:Button runat="server" id="Cancel" Text="Cancel" value="Cancel" class="btn btn-danger" OnClick="Cancel_Click"/>
                   </div>
                        <div class="col-md-6">
                   <asp:Button runat="server" type="submit" id="submitButton" OnClick="submitButton_Click" Text="Create" value="Create" class="btn btn-success" />
                   </div>
                        </div>

            </div>
        </div>
       </div></div>
</asp:Content>
