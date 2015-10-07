﻿<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="AwsWebApp1.Events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="scripts/vendor.js"></script>

    <script src="scripts/ui.js"></script>

    <script src="scripts/app.js"></script>
    <script src="scripts/bootstrap.min.js"></script>
    <script src="scripts/jquery.min.js"></script>
    <div id="divMain" runat="server" style="background-color: #ffffff; overflow: hidden">
        <br />
        <div class="row">

            <div class="col-md-4" style="padding-left: 40px;">
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
                <asp:Button runat="server" Text="Create a New Event" OnClick="newEvent_Click" type="button" ID="newEvent" class="btn btn-info"></asp:Button>
            </div>
        </div>
        <br />
        <div runat="server">

            <asp:GridView OnSelectedIndexChanged="EventData_SelectedIndexChanged" OnRowCancelingEdit="EventData_RowCancelingEdit"
                CssClass="table table-bordered table-striped table-responsive" AllowPaging="true"
                AlternatingRowStyle-BackColor="#FFFFFF" BorderStyle="None" BackColor="#F9F9F9" ID="EventData"
                runat="server" AutoGenerateColumns="false" PagerStyle-BackColor="White">
                <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First" LastPageText="Last" />
                <PagerStyle BackColor="#FFFFFF" CssClass="GridPager" HorizontalAlign="center" />
                <Columns>
                <asp:TemplateField HeaderText="Event&nbsp;Id" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
                        <ItemTemplate>
                            <asp:Label ReadOnly="true" BorderStyle="None" ID="eventId" runat="server" Text='<%# Eval("eventId") %>'></asp:Label>
                        </ItemTemplate>
                        <%--<EditItemTemplate>
                                <asp:Label ID="TextBox2" BorderStyle="None" runat="server" Text='<%# Eval("eventId") %>'></asp:Label>
                            </EditItemTemplate>--%>
                    </asp:TemplateField>
                <asp:TemplateField HeaderText="Event&nbsp;Name" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
                        <ItemTemplate>
                            <asp:Label ReadOnly="true" BorderStyle="None" ID="eventName" runat="server" Text='<%# Eval("eventName") %>'></asp:Label>
                        </ItemTemplate>
                        <%-- <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" BorderStyle="None" runat="server" Text='<%# Eval("eventName") %>'></asp:TextBox>
                            </EditItemTemplate>--%>
                    </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
                        <ItemTemplate>
                            <asp:Label ID="description1" CssClass="ShortDesc" BorderStyle="None" ReadOnly="true" runat="server" Text='<%# Eval("description1").ToString().Substring(0,Math.Min(150,Eval("description1").ToString().Length)) %>'></asp:Label>
                            <asp:Label ID="description11" Style="display: none" CssClass="ShortDesc" BorderStyle="None" ReadOnly="true" runat="server" Text='<%# Eval("description1") %>'></asp:Label>

                            <%--                                <asp:LinkButton CssClass="btn btn-info pull-right" ID="lnkBtn" runat="server"><a href="#" id="details" data-toggle="modal" data-target="#myModal">More info</a></asp:LinkButton>--%>

                            <p id="Eventmodel" class="pull-right"><a href="#" id="details" data-toggle="modal" name="'<%# Eval("description1") %>'" data-target="#myModal" style="font-size: x-small">More..</a></p>
                            <%-- <aps:button cssclass="btn btn-info" value="More Info"></aps:button>  --%>
                        </ItemTemplate>
                        <%-- <EditItemTemplate>
                                <asp:TextBox MaxLength="500" Wrap="true" BorderStyle="None" ID="description1" runat="server" Text='<%# Eval("description1") %>'></asp:TextBox>
                            </EditItemTemplate>--%>
                    </asp:TemplateField>
                <asp:TemplateField HeaderText="Star&nbsp;tDate" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
                        <ItemTemplate>
                            <asp:Label ReadOnly="true" BorderStyle="None" ID="startDate" runat="server" Text='<%# Eval("startDate") %>'></asp:Label>
                        </ItemTemplate>
                        <%-- <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" BorderStyle="None" runat="server" Text='<%# Eval("startDate") %>'></asp:TextBox>
                            </EditItemTemplate>--%>
                    </asp:TemplateField>
                <asp:TemplateField HeaderText="End&nbsp;Date" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
                        <ItemTemplate>
                            <asp:Label ReadOnly="true" BorderStyle="None" ID="endDate" runat="server" Text='<%# Eval("endDate") %>'></asp:Label>
                        </ItemTemplate>
                        <%-- <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" BorderStyle="None" runat="server" Text='<%# Eval("endDate") %>'></asp:TextBox>
                            </EditItemTemplate>--%>
                    </asp:TemplateField>
                <asp:TemplateField HeaderText="Organiser&nbsp;Name" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
                        <ItemTemplate>
                            <asp:Label ReadOnly="true" BorderStyle="None" ID="organiserName" runat="server" Text='<%# Eval("organiserName") %>'></asp:Label>
                        </ItemTemplate>
                        <%-- <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" BorderStyle="None" runat="server" Text='<%# Eval("organiserName") %>'></asp:TextBox>
                            </EditItemTemplate>--%>
                    </asp:TemplateField>
                <asp:TemplateField HeaderText="Venue" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
                        <ItemTemplate>
                            <asp:Label ReadOnly="true" BorderStyle="None" ID="venue" runat="server" Text='<%# Eval("venue") %>'></asp:Label>
                        </ItemTemplate>
                        <%-- <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" BorderStyle="None" runat="server" Text='<%# Eval("venue") %>'></asp:TextBox>
                            </EditItemTemplate>--%>
                        <%-- <ItemTemplate>
                <asp:LinkButton ID="lnkDetails" runat="server" Text="Send Details" PostBackUrl='<%# "~/EditEvent.aspx?RowIndex=" Container.DataItemIndex %>'></asp:LinkButton>
            </ItemTemplate>--%>
                    </asp:TemplateField>
                    <asp:ButtonField HeaderText="Actions" ImageUrl="images/edit%20(1).png" CommandName="Select" Text="Edit" ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#FFFFFFF" ButtonType="Image" ItemStyle-Height="10px" CausesValidation="false"></asp:ButtonField>
                </Columns>
            </asp:GridView>

        </div>
    </div>
    <div class="panel panel-default" runat="server" id="divSearchResult" visible="false">
        <div class="panel-heading" style="background-color: #2EC1CC; color: white">
            <h3 class="panel-title">Edit an Event</h3>
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
                                <div class="form-group" style="text-align:left;">
                                    <asp:Label ID="txtEventId" runat="server" cssclass="form-control input-sm"></asp:Label>
                                </div>
                            </div>
                     <div class="col-xs-2 col-sm-2 col-md-2"></div>
                        </div>
                <div class="row">
                  
                      <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group"  style="text-align:left">
                                    <label>Event Name</label>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtEventName" runat="server"  cssclass="form-control input-sm"></asp:TextBox>
                                </div>
                            </div>
                     <div class="col-xs-2 col-sm-2 col-md-2"></div>
                    </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                                      
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group" style="text-align:left">
                                    <label>Description</label>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <textarea name="txtDesc" class="form-control" rows="5" id="txtDesc" runat="server"></textarea>
                                </div>
                            </div>
                                        
                  <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
                <div class="row">
                    
                        <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                           
                                <div class="form-group"  style="text-align:left">
                                    <label>Start Date</label>
                                </div>
                          </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtSatrt" type="Date" runat="server"  cssclass="form-control input-sm"></asp:TextBox>
                                </div>
                            </div>
                     
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                   </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                      
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group" style="text-align:left">
                                   <label style="text-align:left">End Date</label>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group" >
                                    <asp:TextBox ID="txtEnd" type="Date"  runat="server" cssclass="form-control input-sm"></asp:TextBox>
                                </div>
                            </div>
                        <div class="col-xs-2 col-sm-2 col-md-2"></div>
                    </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                           
                                <div class="form-group"  style="text-align:left">
                                    <label>Organiser Name</label>
                                    </div>
                           </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtOName" runat="server"  cssclass="form-control input-sm"></asp:TextBox>
                                </div>
                            </div>
                   
                   <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
                <div class="row">
                     <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group" style="text-align:left">
                                    <label>Venue</label>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtVenue" runat="server"  cssclass="form-control input-sm"></asp:TextBox>
                                </div>
                            </div>
                     
                   <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>


                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4"></div>
                    <div class="col-md-6">
                        <asp:Button ID="btncancle" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="btncancle_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Text="Update" OnClick="btnUpdate_Click" />
                    </div>          <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #2EC1CC; height: 40px;">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                    <div style="float: left; margin: 2px;">
                        <p style="color: #fff; font-weight: bold; font-size: 12px">Description</p>
                    </div>
                    <div style="float: right; margin: 2px;">
                        <p id="jobid" style="font-size: 12px; color: #fff"></p>
                    </div>
                </div>

                <div id="data" class="modal-body">
                    <div id="dvLoadingImg" style="display: none">
                        <asp:Label ID="descriptionfull" CssClass="ShortDesc" BorderStyle="None" ReadOnly="true" runat="server" Text='<%# Eval("description1")%>'></asp:Label>
                        <%--<img src="~/Images/loading.gif" />--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        var $ = jQuery;
        $(document).ready(function () {
            //var telefon = document.getElementById('description1');
            $("#details").click(function (e) {
                var test = this.id;

                var x = $(this).attr('name');

                alert(x);
                // alert($("#description1").text());
                var lbltext = $('#description1');
                $("#descriptionfull").html(x);

            });
            //function getValue(element) {
            //    var test = element;

            //    debugger;

            //    var prevTest = $("#" + test.id).prev();
            //    alert(prevTest);

            //    alert(test);
            //    var text = $("[id*=description11]").text();
            //    $("#data").html(text);
            //    //alert(ID);
            //}

        });


        //var description = $(e.target).parent().attr('description11');
        // var row = this.parentElement.parentElement;
        //var obj = $(row);
        //var studyid = obj.find('#jobID').val();
        //var status = obj.find('#status').val();
        //value = $("#description11").text();
        //$("#descriptionfull").text('hellp');

        // (studyid, status);

        //$("#pName").text(obj.find('#patientname').text());
        //$("#pstatus").text(obj.find('#statusname').text());
        //$("#jobid").text("Job Id:" + obj.find('#jobID').val());








            </script>
</asp:Content>