<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Session.aspx.cs" Inherits="AwsWebApp1.Session" %>
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
            <asp:Button runat="server" Text="Create a New Session" OnClick="newSession_Click" type="button" ID="newSession" class="btn btn-info"></asp:Button>
        </div>
    </div>
    <br />
        <div runat="server">
    <asp:GridView PageSize="6" OnPageIndexChanging="sessionData_PageIndexChanging" OnSelectedIndexChanged="sessionData_SelectedIndexChanged"
        CssClass="table table-bordered table-striped table-responsive" AllowPaging="true" 
        AlternatingRowStyle-BackColor="#FFFFFF" BorderStyle="None" BackColor="#F9F9F9" ID="sessionData" 
        runat="server" AutoGenerateColumns="false" PagerStyle-BackColor="White">
        <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First" LastPageText="Last" />
        <PagerStyle BackColor="#FFFFFF" CssClass="GridPager" HorizontalAlign="center"/>
        <Columns>
           
<asp:TemplateField HeaderText="EventId"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="eventId" runat="server" Text='<%# Eval("eventId") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="eventId" BorderStyle="None" runat="server" Text='<%# Eval("eventId") %>'></asp:TextBox>
</EditItemTemplate>--%>
    </asp:TemplateField>
<asp:TemplateField HeaderText="Name"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="name" runat="server" Text='<%# Eval("name") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="TextBox1" BorderStyle="None" runat="server" Text='<%# Eval("name") %>'></asp:TextBox>
</EditItemTemplate>--%>
    </asp:TemplateField>
<asp:TemplateField HeaderText="StartTime"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="startTime" runat="server" Text='<%# Eval("startTime") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="TextBox2" BorderStyle="None" runat="server" Text='<%# Eval("startTime") %>'></asp:TextBox>
</EditItemTemplate>--%>
    </asp:TemplateField>
<asp:TemplateField HeaderText="EndTime"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="endTime" runat="server" Text='<%# Eval("endTime") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="TextBox3" BorderStyle="None" runat="server" Text='<%# Eval("endTime") %>'></asp:TextBox>
</EditItemTemplate>--%>
    </asp:TemplateField>
            <asp:TemplateField HeaderText="Speaker Name"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
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
        </div>

        <div class="panel panel-default" runat="server" id="divEdit" visible="false">
        <div class="panel-heading" style="background-color: #449DD5; color: white">
            <h3 class="panel-title">Edit a Session</h3>
        </div>
        <div class="panel-body text-center">
            <div class="col-md-12" id="divParent">
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
        <asp:TextBox ID="Id" runat="server" ></asp:TextBox>
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
        <asp:TextBox ID="Name" runat="server" ></asp:TextBox>
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
                                    <span style="font-family: Adobe Hebrew">StartTime</span>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
           <asp:TextBox ID="Start" runat="server" ></asp:TextBox>
                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                    <span style="font-family: Adobe Hebrew">EndTime</span>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
        <asp:TextBox ID="End" runat="server" ></asp:TextBox>
                              </div>
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
        <asp:TextBox ID="speakername" runat="server" ></asp:TextBox>
                              </div>
             </div>
                            </div>
                        </div>
                    </div>--%>
                 <div class="row">
                    <div class="col-md-6">
                                        <asp:Button ID="btncancle" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="btncancle_Click"/>

                    </div>
                    <div class="col-md-6">
                                    <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-success" Text="Update" OnClick="btnUpdate_Click" />
                    </div>


                </div>
                </div>
            </div>
             </div>
</asp:Content>
