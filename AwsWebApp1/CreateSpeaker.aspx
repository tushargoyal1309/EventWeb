<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="CreateSpeaker.aspx.cs" Inherits="AwsWebApp1.CreateSpeaker" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div runat="server">
    <div class="panel panel-default">
        <div class="panel-heading" style="background-color: #F98E33; color: white">
            <h3 class="panel-title">Create a Speaker</h3>
        </div>
        <div class="panel-body text-center">
            <div class="col-md-12" id="divParent">
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-4 col-sm-4 col-md-4 text-right">
                                <div class="form-group">
                                    <span style="font-family:Adobe Hebrew">Biography</span>
                                   </div>
                            </div>

                            <div class="col-xs-8 col-sm-8 col-md-8">
                                <div class="form-group">
                                   <asp:TextBox runat="server" TextMode="multiline" cssclass="form-control" id="Biography" class="form-control input-lg" Columns="10" Height="100" Wrap="true" type="text" placeholder="">
                                       </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        </div>
                        </div>
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
                                <asp:TextBox runat="server" id="EventId" class="form-control input-sm" type="text" placeholder="">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                       <span style="font-family:Adobe Hebrew">SpeakerName</span>
                                    </div>
                            </div>

                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                  <asp:TextBox runat="server" id="SpeakerName" class="form-control input-sm" type="text" placeholder="">
                                      </asp:TextBox>
                                </div>
                            </div>
                        </div>
                         <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                        <span style="font-family:Adobe Hebrew">Email</span>
                                    </div>
                            </div>

                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                   <asp:TextBox runat="server" id="Email" class="form-control input-sm" type="text" placeholder="">
                                       </asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                       <span style="font-family:Adobe Hebrew">Designation</span>
                                    </div>
                            </div>

                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                  <asp:TextBox runat="server" id="Designation" class="form-control input-sm" type="text" placeholder="">
                                      </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                       <span style="font-family:Adobe Hebrew">ImageUrl</span>
                                   </div>
                            </div>

                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <asp:TextBox runat="server" id="ImageUrl" class="form-control input-sm" type="text" placeholder="">
                                        </asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                        <span style="font-family:Adobe Hebrew">Organization</span>
                                    </div>
                            </div>

                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                   <asp:TextBox runat="server" id="Organization" class="form-control input-sm" type="text" placeholder="">
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
