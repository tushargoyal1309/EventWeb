<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Attendee.aspx.cs" Inherits="AwsWebApp1.Attende" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="divMain" runat="server" style="background-color:#ffffff">
        <br />
    <div class="row">
       
        <div class="col-md-4" style="padding-left:40px;">
            <input type="text"
                placeholder="Search..."
                class="form-control fa-border"
                data-ng-model="searchKeywords"
                data-ng-keyup="search()">
        </div>
        <div class="col-md-5 filter-result-info">
            <%--<span>Showing {{filteredStores.length}}/{{stores.length}} entries
            </span>--%>
        </div>
        <div class="col-md-3">
       <asp:Button runat="server" Text="Create a New Attendee" OnClick="newAttendee_Click" type="button" ID="newAttendee" class="btn btn-info"></asp:Button>
        </div>
    </div>
    <br />
    <asp:GridView PageSize="6" OnSelectedIndexChanged="attendee_SelectedIndexChanged" OnPageIndexChanging="attendee_PageIndexChanging" 
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
    <div id="divEdit" runat="server" class="panel panel-default" visible="false">
        <div class="panel-heading" style="background-color: #FFB61C; color: white">
            <h3 class="panel-title">Edit an Attendee</h3>
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
        <asp:Label ID="txtEventId" runat="server"  cssclass="form-control input-sm"></asp:Label>
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
        <asp:TextBox ID="txtName" runat="server"  cssclass="form-control input-sm"></asp:TextBox>
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
        <asp:TextBox ID="txtDesignation" runat="server"  cssclass="form-control input-sm"></asp:TextBox>
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
        <textarea class="form-control" rows="5" name="txtBio" ID="txtBio" runat="server"  cssclass="form-control input-sm"></textarea>
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
        <asp:Label ID="txtEmail" runat="server"  cssclass="form-control input-sm"></asp:Label>
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
        <asp:TextBox ID="txtOrganisation" runat="server"  cssclass="form-control input-sm"></asp:TextBox>
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
        <asp:Image ID="Image" runat="server"></asp:Image>
                                    <br /><br />
                                    <asp:FileUpload height="100px" Width="100px" ID="file" runat="server" />
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