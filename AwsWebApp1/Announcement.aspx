<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Announcement.aspx.cs" Inherits="AwsWebApp1.Announcement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href=" https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css">
    <script src="scripts/js/jquery-1.10.2.min.js"></script>
    <script src="scripts/jquery-ui.min.js"></script>
    <link href="styles/datepicker.css" rel="stylesheet" />
    <script src="scripts/bootstrap-datepicker.js"></script>
    <script src="scripts/js/moment.js"></script>
    <script type="text/javascript">
        //$(function () {
        //    $('#divPublishTime').datetimepicker();
        //    $("#divPublishTime").on("dp.change", function (e) {
        //        $('#divPublishTime').data("DateTimePicker").minDate(e.date);
        //    });
        //});




    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section id="divMain" runat="server" style="background-color:#ffffff; overflow: hidden">
       <div class="page ng-scope">
            <section class="panel panel-default">
        <div class="panel panel-heading" style="height:50px">

                <p style="font-size:large"><span class="glyphicon glyphicon-volume-up">&nbsp;</span>Announcement
           
        
               <span style="margin-top:-5px;"><asp:Button runat="server" Style="margin-top:-3px;" Text="Create Announcement" OnClick="newAnnouncement_Click" type="button" ID="newAnnouncement" class="btn btn-info pull-right"></asp:Button>
       </span>
                   </p>
        </div>
       
        <div runat="server" class="panel-body">
    <asp:GridView OnSelectedIndexChanged="announcementData_SelectedIndexChanged" OnPageIndexChanging="announcementData_PageIndexChanging" PageSize="5"
        CssClass="table table-bordered table-striped table-responsive" AllowPaging="true" 
        AlternatingRowStyle-BackColor="#FFFFFF" BorderStyle="None" BackColor="#F9F9F9" ID="announcementData" 
        runat="server" AutoGenerateColumns="false" PagerStyle-BackColor="White">
        <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First" LastPageText="Last" />
        <PagerStyle BackColor="#FFFFFF" CssClass="GridPager" HorizontalAlign="center"/>
     <Columns>
     <asp:TemplateField HeaderText="AnnouncementId"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="announcementId" runat="server" Text='<%# Eval("announcementId") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="announcementId" BorderStyle="None" runat="server" Text='<%# Eval("announcementId") %>'></asp:TextBox>
</EditItemTemplate>--%>
         </asp:TemplateField>
<asp:TemplateField HeaderText="EventId"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="eventId" runat="server" Text='<%# Eval("eventId") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="TextBox1" BorderStyle="None" runat="server" Text='<%# Eval("eventId") %>'></asp:TextBox>
</EditItemTemplate>--%>
    </asp:TemplateField>
<asp:TemplateField HeaderText="PublishTime"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="publishTime" runat="server" Text='<%# Eval("publishTime") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="TextBox2" BorderStyle="None" runat="server" Text='<%# Eval("publishTime") %>'></asp:TextBox>
</EditItemTemplate>--%>
    </asp:TemplateField>
<asp:TemplateField HeaderText="Text"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="text" runat="server" Text='<%# Eval("text") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="TextBox3" BorderStyle="None" runat="server" Text='<%# Eval("text") %>'></asp:TextBox>
</EditItemTemplate>--%>
    </asp:TemplateField>
     <asp:ButtonField HeaderText="Actions" CommandName="Select"   ImageUrl="images/edit%20(1).png"  Text="Edit" ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#FFFFFFF" ButtonType="Image" ItemStyle-Height="10px" CausesValidation="false"></asp:ButtonField>
    </Columns>  
        </asp:GridView>
    </div>
    </section>
           </div>
    </section>
        <div class="panel panel-default" runat="server" id="divEdit" visible="false">
        <div class="panel-heading" style="background-color: #00C7F7; color: white">
            <h3 class="panel-title"><span class="glyphicon glyphicon-volume-up">&nbsp;</span>Edit an Announcement</h3>
        </div>
        <div class="panel-body">
            <div id="divParent">
                <div class="row">
                         <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group"  style="text-align:left">
                                    <label>AnnouncementId</label>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group" style="text-align:left;">
        <asp:Label ID="AnnouncementId"  style="font-size:13px"  cssclass="form-control input-sm" runat="server"></asp:Label>
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
                                <div class="form-group">
        <asp:Label ID="EventId" runat="server" style="font-size:13px"   cssclass="form-control input-sm"></asp:Label>
                            </div>
                            </div>
                     <div class="col-xs-2 col-sm-2 col-md-2"></div>
                    </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                                      
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group" style="text-align:left">
                                    <label>PublishTime</label>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class='input-group date' id='divPublishTime'>
        <asp:TextBox ID="PublishTime" style="font-size:13px"  runat="server" cssclass="form-control input-sm"></asp:TextBox>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                </div>
                            </div>
                                        
                  <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
                <div class="row">
                    
                        <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                           
                                <div class="form-group"  style="text-align:left">
                                    <label>Text</label>
                                </div>
                          </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
        <asp:TextBox ID="Text" runat="server"  style="font-size:13px"  cssclass="form-control input-sm"></asp:TextBox>
                              </div>
                            </div>
                   
                   <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>


                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4"></div>
                    <div class="col-md-6">
                        <asp:Button ID="btncancle" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="btncancle_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Update" runat="server" OnClick="btnUpdate_Click" CssClass="btn btn-success" Text="Update"/>
                    </div>
                </div>
    </div>
             </div>
            </div>
</asp:Content>
