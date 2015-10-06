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
            <asp:TemplateField AccessibleHeaderText="center" HeaderText="Biography" HeaderStyle-BackColor="#FFFFFF">
                <ItemTemplate>
                    <asp:Label ID="biography" runat="server" Text='<%# Eval("biography") %>'></asp:Label>
                </ItemTemplate>
                <%--<EditItemTemplate>
                    <asp:ImageButton ID="btnUpdate" runat="server" CommandName="Update" ImageUrl="~/Images/update.gif" ToolTip="Update" />
                    <asp:TextBox ID="biography" BorderStyle="None" runat="server" Text='<%# Eval("biography") %>'></asp:TextBox>
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
            <asp:TemplateField HeaderText="Email"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
                <ItemTemplate>
                    <asp:Label ID="email" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                </ItemTemplate>
                <%--<EditItemTemplate>
                    <asp:TextBox ID="TextBox3" BorderStyle="None" runat="server" Text='<%# Eval("email") %>'></asp:TextBox>
                </EditItemTemplate>--%>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="EventId"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
                <ItemTemplate>
                    <asp:Label ID="eventId" runat="server" Text='<%# Eval("eventId") %>'></asp:Label>
                </ItemTemplate>
                <%--<EditItemTemplate>
                    <asp:TextBox ID="TextBox4" BorderStyle="None" runat="server" Text='<%# Eval("eventId") %>'></asp:TextBox>
                </EditItemTemplate>--%>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="imageUrl" Visible="false">
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
        <div class="panel-body text-center">
            <div class="col-md-12" id="divParent">
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-4 col-sm-4 col-md-4 text-right">
                                <div class="form-group">
                                    <span style="font-family: Adobe Hebrew">Biography</span>
                                </div>
                            </div>
                            <div class="col-xs-8 col-sm-8 col-md-8">
                                <div class="form-group text-center">
        <textarea class="form-control" rows="10" name="txtBio" ID="txtBio" runat="server" ></textarea>
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
                                    <span style="font-family: Adobe Hebrew">Designation</span>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
        <asp:TextBox ID="txtDesignation" runat="server" ></asp:TextBox>
                            </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                    <span style="font-family: Adobe Hebrew">Email</span>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
        <asp:Label ID="txtEmail" runat="server" ></asp:Label>
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
                                    <span style="font-family: Adobe Hebrew">EventId</span>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
        <asp:Label ID="txtEventId" runat="server" ></asp:Label>
                             </div>
                            </div>
                        </div>
                    </div>
                     <div class="col-md-6">
                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                    <span style="font-family: Adobe Hebrew">Name</span>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
        <asp:TextBox ID="txtName" runat="server" ></asp:TextBox>
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
                                    <span style="font-family: Adobe Hebrew">Image</span>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
        <asp:Image ID="Image" runat="server" ></asp:Image>
                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                    <span style="font-family: Adobe Hebrew">OrganiserName</span>
                                </div>
                            </div>
                            <asp:FileUpload ID="file" runat="server" />
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
        <asp:TextBox ID="txtOrganisation" runat="server" ></asp:TextBox>
                </div>
             </div>
                            </div></div></div>
         <div class="row">
             <div class="col-md-6">
                        <asp:Button ID="btncancle" OnClick="btncancle_Click" runat="server" CssClass="btn btn-danger" Text="Cancel" />

                    </div>
            <div class="col-md-6">
        <asp:Button ID="btnUpdate" runat="server"  CssClass="btn btn-success"  Text="Update" OnClick="btnUpdate_Click" />
                </div>
             </div>
    </div>
            </div>
        </div>
</asp:Content>