<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Session.aspx.cs" Inherits="AwsWebApp1.Session" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href=" https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css">
    <script src="scripts/js/jquery-1.10.2.min.js"></script>
    <script src="scripts/jquery-ui.min.js"></script>
    <link href="styles/datepicker.css" rel="stylesheet" />
    <script src="scripts/bootstrap-datepicker.js"></script>
    <script src="scripts/js/moment.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

    <link href="styles/Date/jquery.datetimepicker.css" rel="stylesheet" />
    <script src="scripts/Date/jquery.js"></script>
    <script src="scripts/Date/jquery.datetimepicker.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#txtEnd').datetimepicker();
            var hfproductid = $('#HfDateid').val();
            $('#txtEnd').val(hfproductid);

            //$('#txtEnd').datetimepicker({ value: '', step: 5 });
        });
    </script>
    <%--<script type="text/javascript">
        $(function () {
            $("[id$=txtEnd]").datepicker({
                showOn: 'button',
                buttonImageOnly: true,
                buttonImage: "../images/images.png"
            });
        });
    </script>--%>
    <%--<script type="text/javascript">
        $(function () {
            $('#divEnd').datetimepicker();
            $("#divEnd").on("dp.change", function (e) {
                $('#divEnd').data("DateTimePicker").minDate(e.date);
            });
        });
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="HfDateid" ClientIDMode="Static" runat="server" />
    <section id="divMain" runat="server" style="background-color: #ffffff; overflow: hidden">
        <div class="page ng-scope">
            <section class="panel panel-default">
                <div class="panel panel-heading" style="height: 50px">

                    <p style="font-size: large">
                        <span class="glyphicon glyphicon-time">&nbsp;</span>Session
        
               <span style="margin-top: -5px;">
                   <asp:Button Style="margin-top: -3px;" runat="server" Text="Create Session" OnClick="newSession_Click" type="button" ID="newSession" class="btn btn-info pull-right"></asp:Button>
               </span>
                    </p>
                </div>

                <div runat="server" class="panel-body">
                    <asp:GridView PageSize="5" OnPageIndexChanging="sessionData_PageIndexChanging" OnSelectedIndexChanged="sessionData_SelectedIndexChanged"
                        CssClass="table table-bordered table-striped table-responsive" AllowPaging="true"
                        AlternatingRowStyle-BackColor="#FFFFFF" BorderStyle="None" BackColor="#F9F9F9" ID="sessionData"
                        runat="server" AutoGenerateColumns="false" PagerStyle-BackColor="White">
                        <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First" LastPageText="Last" />
                        <PagerStyle BackColor="#FFFFFF" CssClass="GridPager" HorizontalAlign="center" />
                        <Columns>

                            <asp:TemplateField HeaderText="Event&nbsp;Id" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
                                <ItemTemplate>
                                    <asp:Label ID="eventId" runat="server" Text='<%# Eval("eventId") %>'></asp:Label>
                                </ItemTemplate>
                                <%--<EditItemTemplate>
<asp:TextBox ID="eventId" BorderStyle="None" runat="server" Text='<%# Eval("eventId") %>'></asp:TextBox>
</EditItemTemplate>--%>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
                                <ItemTemplate>
                                    <asp:Label ID="name" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                </ItemTemplate>
                                <%--<EditItemTemplate>
<asp:TextBox ID="TextBox1" BorderStyle="None" runat="server" Text='<%# Eval("name") %>'></asp:TextBox>
</EditItemTemplate>--%>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Start&nbsp;Time" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
                                <ItemTemplate>
                                    <asp:Label ID="startTime" runat="server" Text='<%# Eval("startTime") %>'></asp:Label>
                                </ItemTemplate>
                                <%--<EditItemTemplate>
<asp:TextBox ID="TextBox2" BorderStyle="None" runat="server" Text='<%# Eval("startTime") %>'></asp:TextBox>
</EditItemTemplate>--%>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="End&nbsp;Time" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
                                <ItemTemplate>
                                    <asp:Label ID="endTime" runat="server" Text='<%# Eval("endTime") %>'></asp:Label>
                                </ItemTemplate>
                                <%--<EditItemTemplate>
<asp:TextBox ID="TextBox3" BorderStyle="None" runat="server" Text='<%# Eval("endTime") %>'></asp:TextBox>
</EditItemTemplate>--%>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Speaker&nbsp;Name" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
                                <ItemTemplate>
                                    <asp:Label ID="speaker" runat="server" Text='<%# Eval("speakerName") %>'></asp:Label>
                                </ItemTemplate>
                                <%--<EditItemTemplate>
<asp:TextBox ID="TextBox3" BorderStyle="None" runat="server" Text='<%# Eval("endTime") %>'></asp:TextBox>
</EditItemTemplate>--%>
                            </asp:TemplateField>
                            <asp:ButtonField HeaderText="Actions" ImageUrl="images/edit%20(1).png" CommandName="Select" Text="Edit" ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#FFFFFFF" ButtonType="Image" ItemStyle-Height="10px" CausesValidation="false"></asp:ButtonField>
                        </Columns>
                    </asp:GridView>
                </div>
            </section>
        </div>
    </section>

    <div class="panel panel-default" runat="server" id="divEdit" visible="false">
        <div class="panel-heading" style="background-color: #449DD5; color: white">
            <h3 class="panel-title"><span class="glyphicon glyphicon-time">&nbsp;</span>Edit a Session</h3>
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
                            <asp:Label ID="lblId" Style="font-size: 13px" runat="server" CssClass="form-control input-sm"></asp:Label>
                        </div>
                    </div>

                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>

                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group" style="text-align: left">
                            <label style="text-align: left">Name</label>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:TextBox ID="txtName" Style="font-size: 13px" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                             <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator3" controltovalidate="txtName" errormessage="Please enter Name!" /> 
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
                <div class="row">

                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group" style="text-align: left">
                            <label>Start Time</label>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblStart" Style="font-size: 13px" runat="server" CssClass="form-control input-sm"></asp:Label>
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group" style="text-align: left">
                            <label>End Time</label>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:TextBox ID="txtEnd" Style="font-size: 13px" ClientIDMode="Static" runat="server" 
                                CssClass="form-control input-sm"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="txtEnd" errormessage="Please enter End date!" /> 
                        </div>
                    </div>

                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group" style="text-align: left">
                            <label>Speaker Name</label>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:TextBox ID="txtspeaker" Style="font-size: 13px" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" controltovalidate="txtspeaker" errormessage="Please enter Speaker name!" />
                        </div>
                    </div>

                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>

                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4"></div>
                    <div class="col-md-6">
                        <asp:Button ID="btncancle" runat="server" CssClass="btn btn-danger" CausesValidation="false" Text="Cancel" OnClick="btncancle_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-success" Text="Update" OnClick="btnUpdate_Click" />
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
            </div>
        </div>
    </div>
    <%--<div class="row">
                    <div class="col-md-6">
                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                    <span style="font-family: Adobe Hebrew">Speaker Name</span>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
        <asp:TextBox ID="speakername" runat="server"></asp:TextBox>
                              </div>
             </div>
                            </div>
                        </div>
                    </div>--%>
</asp:Content>
