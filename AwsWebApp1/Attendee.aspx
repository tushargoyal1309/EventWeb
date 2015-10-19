<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Attendee.aspx.cs" Inherits="AwsWebApp1.Attende" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="divMain" runat="server" style="background-color:#ffffff; overflow: hidden">
        <div class="page ng-scope">
            <section class="panel panel-default">
        <div class="panel panel-heading" style="height:50px">

                <p style="font-size:large"><span class="glyphicon glyphicon-hand-up">&nbsp;</span>Attendee
           
        
               <span style="margin-top:-5px;"><asp:Button Style="margin-top:-3px;"  runat="server" Text="Create Attendee" OnClick="newAttendee_Click" type="button" ID="newAttendee" class="btn btn-info pull-right"></asp:Button>
        </span>
                   </p>
        </div>
       
        <div runat="server" class="panel-body">
    <asp:GridView PageSize="5" OnSelectedIndexChanged="attendee_SelectedIndexChanged" OnPageIndexChanging="attendee_PageIndexChanging" 
        CssClass="table table-bordered table-striped table-responsive" AllowPaging="true" 
        AlternatingRowStyle-BackColor="#FFFFFF" BorderStyle="None" BackColor="#F9F9F9" ID="attendee" 
        runat="server" AutoGenerateColumns="false" PagerStyle-BackColor="White">
        <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First" LastPageText="Last" />
        <PagerStyle BackColor="#FFFFFF" CssClass="GridPager" HorizontalAlign="center"/>
        <Columns>
          <asp:TemplateField HeaderText="Event&nbsp;Id"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
                <ItemTemplate>
                    <asp:Label ID="eventId" runat="server" Text='<%# Eval("eventId") %>'></asp:Label>
                </ItemTemplate>
                <%--<EditItemTemplate>
                    <asp:TextBox ID="TextBox4" BorderStyle="None" runat="server" Text='<%# Eval("eventId") %>'></asp:TextBox>
                </EditItemTemplate>--%>
            </asp:TemplateField>
          <asp:TemplateField HeaderText="image&nbsp;Url" Visible="false">
                <ItemTemplate>
                    <asp:Label ID="imageUrl" runat="server" Text='<%# Eval("imageUrl") %>'></asp:Label>
                </ItemTemplate>
                <%--<EditItemTemplate>
                    <asp:TextBox ID="TextBox5" BorderStyle="None" runat="server" Text='<%# Eval("imageUrl") %>'></asp:TextBox>
                </EditItemTemplate>--%>
            </asp:TemplateField>
          <asp:TemplateField HeaderText="Name"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
                <ItemTemplate>
                    <asp:Label ID="name" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                </ItemTemplate>
                <%--<EditItemTemplate>
                    <asp:TextBox ID="TextBox6" BorderStyle="None" runat="server" Text='<%# Eval("name") %>'></asp:TextBox>
                </EditItemTemplate>--%>
            </asp:TemplateField>
          <asp:TemplateField HeaderText="Designation" AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
                <ItemTemplate>
                    <asp:Label ID="designation" runat="server" Text='<%# Eval("designation") %>'></asp:Label>
                </ItemTemplate>
                <%--<EditItemTemplate>
                    <asp:TextBox ID="TextBox2" BorderStyle="None" runat="server" Text='<%# Eval("designation") %>'></asp:TextBox>
                </EditItemTemplate>--%>
            </asp:TemplateField>
          <asp:TemplateField AccessibleHeaderText="center" HeaderText="Biography" HeaderStyle-BackColor="#FFFFFF">
                <ItemTemplate>
                    <asp:Label ID="biography" runat="server" Text='<%# Eval("biography") %>'></asp:Label>
                </ItemTemplate>
                <%--<EditItemTemplate>
                    <asp:ImageButton ID="btnUpdate" runat="server" CommandName="Update" ImageUrl="~/Images/update.gif" ToolTip="Update" />
                    <asp:TextBox ID="biography" BorderStyle="None" runat="server" Text='<%# Eval("biography") %>'></asp:TextBox>
                </EditItemTemplate>--%>
            </asp:TemplateField>
          <asp:TemplateField HeaderText="Email"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
                <ItemTemplate>
                    <asp:Label ID="email" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                </ItemTemplate>
                <%--<EditItemTemplate>
                    <asp:TextBox ID="TextBox3" BorderStyle="None" runat="server" Text='<%# Eval("email") %>'></asp:TextBox>
                </EditItemTemplate>--%>
            </asp:TemplateField>
          <asp:TemplateField HeaderText="Organization"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
                <ItemTemplate>
                    <asp:Label ID="organization" runat="server" Text='<%# Eval("organization") %>'></asp:Label>
                </ItemTemplate>
                <%--<EditItemTemplate>
                    <asp:TextBox ID="TextBox7" BorderStyle="None" runat="server" Text='<%# Eval("organization") %>'></asp:TextBox>
                </EditItemTemplate>--%>
            </asp:TemplateField>
                    <asp:ButtonField HeaderText="Actions" ImageUrl="images/edit%20(1).png" CommandName="Select" ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#FFFFFFF" ButtonType="Image" ItemStyle-Height="10px" CausesValidation="false"></asp:ButtonField>
<%--            <asp:ButtonField  HeaderText="Actions"  ImageUrl="images/edit%20(1).png"  CommandName="Select" ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#FFFFFFF" ButtonType="Image" ItemStyle-Height="10px" CausesValidation="false"></asp:ButtonField>--%>
        </Columns>
    </asp:GridView>
            </div>
        </section>
            </div>
        </section>
    <div id="divEdit" runat="server" class="panel panel-default" visible="false">
        <div class="panel-heading" style="background-color: #FFB61C; color: white">
            <h3 class="panel-title"><span class="glyphicon glyphicon-hand-up">&nbsp;</span>Edit an Attendee</h3>
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
                                <div class="form-group" style="text-align:left;">
        <asp:Label ID="txtEventId" style="font-size:13px"  runat="server"  cssclass="form-control input-sm"></asp:Label>
                             </div>
                            </div>
                     
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                   </div>
               <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                      
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group" style="text-align:left">
                                   <label style="text-align:left">Name</label>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group" style="text-align:left;">
        <asp:TextBox ID="txtName" style="font-size:13px"  runat="server" cssclass="form-control input-sm"></asp:TextBox>
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
        <asp:TextBox ID="txtDesignation" style="font-size:13px"  runat="server"  cssclass="form-control input-sm"></asp:TextBox>
                            </div>
                            </div>
                     <div class="col-xs-2 col-sm-2 col-md-2"></div>
                    </div>
               <div class="row">
                         <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group"  style="text-align:left">
                                    <label>Biography</label>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group" style="text-align:left;">
        <textarea class="form-control" style="font-size:13px"  rows="5" name="txtBio" ID="txtBio" runat="server"  cssclass="form-control input-sm"></textarea>
                </div>
                            </div>
                     <div class="col-xs-2 col-sm-2 col-md-2"></div>
                        </div>
               <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                                      
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group" style="text-align:left">
                                    <label>Email</label>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group" style="text-align:left;">
        <asp:Label ID="txtEmail" style="font-size:13px"  runat="server"  cssclass="form-control input-sm"></asp:Label>
                </div>
                            </div>
                                        
                  <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
               <div class="row">
                     <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group" style="text-align:left">
                                    <label>OrganiserName</label>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group" style="text-align:left;">
        <asp:TextBox ID="txtOrganisation" style="font-size:13px"  runat="server"  cssclass="form-control input-sm"></asp:TextBox>
                </div>
                            </div>
                     
                   <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
               <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                           
                                <div class="form-group"  style="text-align:left">
                                    <label>Image</label>
                                    </div>
                           </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group" style="text-align:left;">
        <asp:Image ID="Image" Height="100px" Width="100px" runat="server"></asp:Image>
                                    <br /><br />
                                    <asp:FileUpload ID="file" runat="server" />
                </div>
                            </div>
                   
                   <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>


                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4"></div>
                    <div class="col-md-6">
                        <asp:Button ID="btncancle" OnClick="btncancle_Click" runat="server" CssClass="btn btn-danger" Text="Cancel" />&nbsp;&nbsp;&nbsp;&nbsp;
                       <asp:Button ID="btnUpdate" runat="server"  CssClass="btn btn-success"  Text="Update" OnClick="btnUpdate_Click" />
                 </div>          <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>