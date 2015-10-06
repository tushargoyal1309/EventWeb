<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="CreateContentPage.aspx.cs" Inherits="AwsWebApp1.CreateContentPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div runat="server">
    <div class="panel panel-default">
        <div class="panel-heading" style="background-color: #2EC1CC; color: white">
            <h3 class="panel-title">Create a Attendee</h3>
        </div>
        <div class="panel-body text-center">
            <div class="col-md-12" id="divParent">
                <div class="row">
                    <div class="col-md-6">
                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                    <span style="font-family:Adobe Hebrew">Biography</span>
                                   </div>
                            </div>

                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                   <input class="form-control input-sm" type="text" placeholder="">
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                    <span style="font-family:Adobe Hebrew">Designation</span>
                                 </div>
                            </div>

                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                <input class="form-control input-sm" type="text" placeholder="">
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
                                  <input class="form-control input-sm" type="text" placeholder="">
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="col-md-6">
                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                       <span style="font-family:Adobe Hebrew">EventId</span>
                                    </div>
                            </div>

                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                  <input class="form-control input-sm" type="text" placeholder="">
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
                                    <input class="form-control input-sm" type="text" placeholder="">
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
                                   <input class="form-control input-sm" type="text" placeholder="">
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
                    <div class="row">
                   <input type="submit" id="submitButton" value="Create" class="btn btn-success" />
                   </div>

            </div>
        </div>
        </div>
</div>
</asp:Content>
