<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Speaker.aspx.cs" Inherits="AwsWebApp1.Speaker" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section runat="server" id="divMain" style="background-color:#ffffff; overflow: hidden">
        <div class="page ng-scope">
            <section class="panel panel-default">
        <div class="panel panel-heading" style="height:50px">

                <p style="font-size:large"><span class="glyphicon glyphicon-user">&nbsp;</span>Speaker
           
        
               <span style="margin-top:-5px;"><asp:Button runat="server" Text="Create Speaker" OnClick="newSpeaker_Click" type="button" ID="newSpeaker" class="btn btn-info pull-right"></asp:Button>
         </span>
                   </p>
        </div>
       
        <div runat="server" class="panel-body">
    <asp:GridView OnSelectedIndexChanged="speakerData_SelectedIndexChanged" PageSize="5" OnPageIndexChanging="speakerData_PageIndexChanging"
        CssClass="table table-bordered table-striped table-responsive" AllowPaging="true" 
        AlternatingRowStyle-BackColor="#FFFFFF" BorderStyle="None" BackColor="#F9F9F9" ID="speakerData" 
        runat="server" AutoGenerateColumns="false" PagerStyle-BackColor="White">
        <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First" LastPageText="Last" />
        <PagerStyle BackColor="#FFFFFF" CssClass="GridPager" HorizontalAlign="center"/>
        <Columns>
   
        <asp:TemplateField HeaderText="Event&nbsp;Id" AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="eventId" runat="server" Text='<%# Eval("eventId") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="eventId" BorderStyle="None" runat="server" Text='<%# Eval("eventId") %>'></asp:TextBox>
</EditItemTemplate>--%>
            </asp:TemplateField>
<asp:TemplateField HeaderText="Speaker&nbsp;Name"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
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
<asp:TemplateField HeaderText="Image&nbsp;Url" Visible="false" AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
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
        </section>
            </div>
        </section>
        <div class="panel panel-default" runat="server" id="divEdit" visible="false">
        <div class="panel-heading" style="background-color: #F98E33; color: white">
            <h3 class="panel-title"><span class="glyphicon glyphicon-user">&nbsp;</span>Edit a Speaker</h3>
        </div>
        <div class="panel-body">
            <div id="divParent">
               <div class="row">
                    
                        <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                           
                                <div class="form-group"  style="text-align:left">
                                    <label>Event Id</label>
                                </div>
                          </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
        <asp:Label ID="EventId" style="font-size:13px"  runat="server"></asp:Label>
                             </div>
                            </div>
                     
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                   </div>
               <div class="row">
                     <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group" style="text-align:left">
                                    <label>Speaker Name</label>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
        <asp:TextBox ID="txtSpeakerName" style="font-size:13px"  runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" controltovalidate="txtSpeakerName" errormessage="Please enter Speaker name!" />
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
                                <div class="form-group">
        <asp:Label ID="txtmail" style="font-size:13px"  runat="server"></asp:Label>
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
                                <div class="form-group">
        <asp:TextBox ID="txtDesignation" style="font-size:13px"  runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="txtDesignation" errormessage="Please enter Designation!" />
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
        <textarea class="form-control" style="font-size:13px"  rows="5" ID="txtBio" runat="server"></textarea>
                                    <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator3" controltovalidate="txtBio" errormessage="Please enter Biography!" />
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
                                <div class="form-group" >
        <asp:Image ID="Image" Height="100px" Width="100px" runat="server"></asp:Image>
                                   <span style="font-size:13px" >Choose an Image to update</span> <br /><br /> <asp:FileUpload ID="file" runat="server" />
                </div>
                            </div>
                        <div class="col-xs-2 col-sm-2 col-md-2"></div>
                    </div>
               <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                           
                                <div class="form-group"  style="text-align:left">
                                    <label>Organization</label>
                                    </div>
                           </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
        <asp:TextBox ID="txtOrganisation" style="font-size:13px"   CssClass="form-control input-sm" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator4" controltovalidate="txtOrganisation" errormessage="Please enter Organisation!" />
                              </div>
                            </div>
                   
                   <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
            


                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4"></div>
                    <div class="col-md-6">
                        <asp:Button ID="btncancle" runat="server" CausesValidation="false" CssClass="btn btn-danger" Text="Cancel" OnClick="btncancle_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" CssClass="btn btn-success" Text="Update"/>
                    </div>          <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
