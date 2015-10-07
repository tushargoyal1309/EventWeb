<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Sponsor.aspx.cs" Inherits="AwsWebApp1.Sponsor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div  id="divMain" runat="server" style="background-color:#ffffff">
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
            <asp:Button runat="server" Text="Create a New Sponsor" OnClick="newSponsor_Click" type="button" ID="newSponsor" class="btn btn-info"></asp:Button>
        </div>
    </div>
    <br />
        <div runat="server">
    <asp:GridView OnSelectedIndexChanged="sponsorData_SelectedIndexChanged"
        CssClass="table table-bordered table-striped table-responsive" AllowPaging="true" 
        AlternatingRowStyle-BackColor="#FFFFFF" BorderStyle="None" BackColor="#F9F9F9" ID="sponsorData" 
        runat="server" AutoGenerateColumns="false" PagerStyle-BackColor="White">
        <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First" LastPageText="Last" />
        <PagerStyle BackColor="#FFFFFF" CssClass="GridPager" HorizontalAlign="center"/>
        <Columns> 
       <asp:TemplateField HeaderText="Sno" AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="sno" runat="server" Text='<%# Eval("sno") %>'></asp:Label>
</ItemTemplate>
<EditItemTemplate>
<asp:TextBox ID="sno" BorderStyle="None" runat="server" Text='<%# Eval("sno") %>'></asp:TextBox>
</EditItemTemplate>
        </asp:TemplateField>
<asp:TemplateField HeaderText="EventId" AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="eventId" runat="server" Text='<%# Eval("eventId") %>'></asp:Label>
</ItemTemplate>
<EditItemTemplate>
<asp:TextBox ID="TextBox1" BorderStyle="None" runat="server" Text='<%# Eval("eventId") %>'></asp:TextBox>
</EditItemTemplate>
    </asp:TemplateField>
<asp:TemplateField HeaderText="Name" AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="name" runat="server" Text='<%# Eval("name") %>'></asp:Label>
</ItemTemplate>
<EditItemTemplate>
<asp:TextBox ID="TextBox2" BorderStyle="None" runat="server" Text='<%# Eval("name") %>'></asp:TextBox>
</EditItemTemplate>
    </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="description" runat="server" Text='<%# Eval("description") %>'></asp:Label>
</ItemTemplate>
<EditItemTemplate>
<asp:TextBox ID="TextBox5" BorderStyle="None" runat="server" Text='<%# Eval("description") %>'></asp:TextBox>
</EditItemTemplate>
    </asp:TemplateField>
<asp:TemplateField HeaderText="Type" AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="type" runat="server" Text='<%# Eval("type") %>'></asp:Label>
</ItemTemplate>
<EditItemTemplate>
<asp:TextBox ID="TextBox3" BorderStyle="None" runat="server" Text='<%# Eval("type") %>'></asp:TextBox>
</EditItemTemplate>
    </asp:TemplateField>
<asp:TemplateField Visible="false" HeaderText="logoUrl">
<ItemTemplate>
<asp:Label ID="logoUrl" runat="server" Text='<%# Eval("logoUrl") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="TextBox4" BorderStyle="None" runat="server" Text='<%# Eval("logoUrl") %>'></asp:TextBox>
</EditItemTemplate>--%>
    </asp:TemplateField>

       <asp:ButtonField HeaderText="Actions" ImageUrl="images/edit%20(1).png" CommandName="Select" Text="Edit" ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#FFFFFFF" ButtonType="Image" ItemStyle-Height="10px" CausesValidation="false"></asp:ButtonField>
    </Columns>   
         </asp:GridView>
        </div>
        </div>
        <div class="panel panel-default" runat="server" id="divEdit" visible="false">
        <div class="panel-heading" style="background-color: #335397; color: white">
            <h3 class="panel-title">Edit a Sponsor</h3>
        </div>
     <div class="panel-body">
            <div id="divParent">
               
                <div class="row">
                  
                      <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group"  style="text-align:left">
                                    <label>Sno</label>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="sno" cssclass="form-control input-sm" runat="server"></asp:TextBox>
                                </div>
                            </div>
                     <div class="col-xs-2 col-sm-2 col-md-2"></div>
                    </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                                      
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group" style="text-align:left">
                                    <label>EventId</label>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <asp:Label ID="txtEventId" cssclass="form-control input-sm" runat="server"></asp:Label>
                                </div>
                            </div>
                                        
                  <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
                <div class="row">
                    
                        <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                           
                                <div class="form-group"  style="text-align:left">
                                    <label>Name</label>
                                </div>
                          </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtEventName" cssclass="form-control input-sm" runat="server"></asp:TextBox>
                                </div>
                            </div>
                     
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                   </div>
                <div class="row">
                         <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group"  style="text-align:left">
                                    <label>Description</label>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group" style="text-align:left;">
                                    <textarea name="txtDesc" class="form-control" rows="5" id="Description" runat="server"></textarea>
                                </div>
                            </div>
                     <div class="col-xs-2 col-sm-2 col-md-2"></div>
                        </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                      
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group" style="text-align:left">
                                   <label style="text-align:left">Type</label>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group" >
                                    <asp:TextBox ID="txttype" cssclass="form-control input-sm" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        <div class="col-xs-2 col-sm-2 col-md-2"></div>
                    </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                           
                                <div class="form-group"  style="text-align:left">
                                    <asp:Image ID="logo" runat="server"></asp:Image>
                                    </div>
                           </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <asp:FileUpload  ID="file" height="100px" Width="100px"  runat="server" />
                                </div>
                            </div>
                     
                   <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>


                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4"></div>
                    <div class="col-md-6">
                        <asp:Button ID="btncancle" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="btncancle_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-success" Text="Update" OnClick="btnUpdate_Click"/>
                    </div>          <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
