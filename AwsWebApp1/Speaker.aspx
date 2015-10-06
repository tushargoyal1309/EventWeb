<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Speaker.aspx.cs" Inherits="AwsWebApp1.Speaker" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div runat="server" id="divMain" style="background-color:#ffffff">
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
            <asp:Button runat="server" Text="Create a New Speaker" OnClick="newSpeaker_Click" type="button" ID="newSpeaker" class="btn btn-info"></asp:Button>
        </div>
    </div>
    <br />
         <div runat="server">
    <asp:GridView OnSelectedIndexChanged="speakerData_SelectedIndexChanged"
        CssClass="table table-bordered table-striped table-responsive" AllowPaging="true" 
        AlternatingRowStyle-BackColor="#FFFFFF" BorderStyle="None" BackColor="#F9F9F9" ID="speakerData" 
        runat="server" AutoGenerateColumns="false" PagerStyle-BackColor="White">
        <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First" LastPageText="Last" />
        <PagerStyle BackColor="#FFFFFF" CssClass="GridPager" HorizontalAlign="center"/>
        <Columns>
   
        <asp:TemplateField HeaderText="EventId" AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="eventId" runat="server" Text='<%# Eval("eventId") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="eventId" BorderStyle="None" runat="server" Text='<%# Eval("eventId") %>'></asp:TextBox>
</EditItemTemplate>--%>
            </asp:TemplateField>
<asp:TemplateField HeaderText="SpeakerName"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="speakerName" runat="server" Text='<%# Eval("speakerName") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="TextBox1" BorderStyle="None" runat="server" Text='<%# Eval("speakerName") %>'></asp:TextBox>
</EditItemTemplate>--%>
    </asp:TemplateField>
<asp:TemplateField HeaderText="Email"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="email" runat="server" Text='<%# Eval("email") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="TextBox2" BorderStyle="None" runat="server" Text='<%# Eval("email") %>'></asp:TextBox>
</EditItemTemplate>--%>
    </asp:TemplateField>
<asp:TemplateField HeaderText="Designation"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="designation" runat="server" Text='<%# Eval("designation") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="TextBox3" BorderStyle="None" runat="server" Text='<%# Eval("designation") %>'></asp:TextBox>
</EditItemTemplate>--%>
    </asp:TemplateField>
<asp:TemplateField HeaderText="Biography"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="biography" runat="server" Text='<%# Eval("biography") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="TextBox4" BorderStyle="None" runat="server" Text='<%# Eval("biography") %>'></asp:TextBox>
</EditItemTemplate>--%>
    </asp:TemplateField>
<asp:TemplateField HeaderText="ImageUrl"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="imageUrl" runat="server" Visible="false" Text='<%# Eval("imageUrl") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="TextBox5" BorderStyle="None" runat="server" Text='<%# Eval("imageUrl") %>'></asp:TextBox>
</EditItemTemplate>--%>
    </asp:TemplateField>
<asp:TemplateField HeaderText="Organization"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="organization" runat="server" Text='<%# Eval("organization") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="TextBox6" BorderStyle="None" runat="server" Text='<%# Eval("organization") %>'></asp:TextBox>
</EditItemTemplate>--%>
    </asp:TemplateField>
    <asp:ButtonField HeaderText="Actions" CommandName="Select" ItemStyle-HorizontalAlign="Center"  ImageUrl="images/edit%20(1).png"  HeaderStyle-BackColor="#FFFFFFF" ButtonType="Image" ItemStyle-Height="10px" Text="Edit" CausesValidation="false"></asp:ButtonField>
    </Columns>   
        </asp:GridView>
        </div>
        </div>
        <div class="panel panel-default" runat="server" id="divEdit" visible="false">
        <div class="panel-heading" style="background-color: #F98E33; color: white">
            <h3 class="panel-title">Edit an Event</h3>
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
        <textarea class="form-control" rows="10" ID="txtBio" runat="server" ></textarea>
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
        <asp:Label ID="txtmail" runat="server" ></asp:Label>
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
        <asp:Label ID="EventId" runat="server" ></asp:Label>
                             </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                    <span style="font-family: Adobe Hebrew">ImageUrl</span>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
        <asp:Image ID="Image" runat="server" ></asp:Image>
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
                                    <span style="font-family: Adobe Hebrew">Organization</span>
                                </div>
                            </div>
                            <asp:FileUpload ID="file" runat="server" />
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
        <asp:TextBox ID="txtOrganisation" runat="server" ></asp:TextBox>
                              </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-6">
                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                    <span style="font-family: Adobe Hebrew">SpeakerName</span>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
        <asp:TextBox ID="txtSpeakerName" runat="server"></asp:TextBox>
                </div>
             </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                    <div class="col-md-6">
                        <asp:Button ID="btncancle" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="btncancle_Click"/>

                    </div>
                    <div class="col-md-6">
                        <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" CssClass="btn btn-success" Text="Update"/>
                    </div>
                </div>
             </div>
</asp:Content>
