<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="CreateSponsor.aspx.cs" Inherits="AwsWebApp1.CreateSponsor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div runat="server">
    <div class="panel panel-default">
        <div class="panel-heading" style="background-color: #335397; color: white">
            <h3 class="panel-title">Create Sponsor</h3>
        </div>
        <div class="panel-body text-center">
            <div class="col-md-12" id="divParent">
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-4 col-sm-4 col-md-4 text-right">
                                <div class="form-group">
                                    <span style="font-family:Adobe Hebrew">Description</span>
                                   </div>
                            </div>

                            <div class="col-xs-8 col-sm-8 col-md-8">
                                <div class="form-group">
                                   <asp:TextBox runat="server" TextMode="multiline" cssclass="form-control" id="description" class="form-control input-lg" Columns="10" Height="100" Wrap="true" type="text" placeholder="">
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
                                    <span style="font-family:Adobe Hebrew">Sno</span>
                                 </div>
                            </div>

                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                <asp:TextBox runat="server" id="sno" class="form-control input-sm" type="text" placeholder="">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>

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
                                        <span style="font-family:Adobe Hebrew">Name</span>
                                    </div>
                            </div>

                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                   <asp:TextBox runat="server" id="Name" class="form-control input-sm" type="text" placeholder="">
                                       </asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                       <span style="font-family:Adobe Hebrew">Type</span>
                                    </div>
                            </div>

                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                  <asp:TextBox runat="server" id="Type" class="form-control input-sm" type="text" placeholder="">
                                      </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                        <span style="font-family:Adobe Hebrew">logoUrl</span>
                                    </div>
                            </div>

                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                   <asp:TextBox runat="server" id="logo" class="form-control input-sm" type="text" placeholder="">
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
                   <asp:Button runat="server" CssClass="btn btn-success" type="submit" id="submitButton" OnClick="submitButton_Click" Text="Create" value="Create" />
                   </div>
                        </div>

            </div>
        </div>
       </div></div>
</asp:Content>

