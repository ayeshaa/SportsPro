<%@ Page Title="3-A: Display Customer Incidents" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerIncidentDisplay.aspx.cs" Inherits="SportsPro.CustomerIncidentDisplay" %>

<asp:Content ID="main" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-sm-offset-1 col-sm-3">Select a customer:</div>
        <div class="col-sm-6">
            <asp:DropDownList ID="ddlCustomers" runat="server" DataSourceID="SqlDataSource1"
                DataTextField="Name" DataValueField="CustomerID" AutoPostBack="True" CssClass="form-control">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" 
                SelectCommand="SELECT [CustomerID], [Name] FROM [Customers] ORDER BY [Name]">
            </asp:SqlDataSource>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-offset-1 col-sm-10">
            <asp:DataList ID="dlIncidents" runat="server" DataSourceID="SqlDataSource2" 
                CssClass="table table-bordered table-condensed">
                <HeaderTemplate>
                    <span class="col-sm-5">Product/Incident</span>
                    <span class="col-sm-3">Tech name</span>
                    <span class="col-sm-2">Opened</span>
                    <span class="col-sm-2">Closed</span>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblProduct" runat="server" Text='<%# Eval("Name") %>' CssClass="col-sm-5"></asp:Label>
                    <asp:Label ID="lblTechnician" runat="server" Text='<%# Eval("TechName") %>' CssClass="col-sm-3"></asp:Label>
                    <asp:Label ID="lblDateOpened" runat="server" Text='<%# Eval("DateOpened", "{0:d}") %>' CssClass="col-sm-2"></asp:Label>
                    <asp:Label ID="lblDateClosed" runat="server" Text='<%# Eval("DateClosed", "{0:d}") %>' CssClass="col-sm-2"></asp:Label>
                    <br />
                    <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>' CssClass="col-sm-12"></asp:Label>
                </ItemTemplate>
                <AlternatingItemStyle CssClass="active" />
                <HeaderStyle CssClass="header" />
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>"
                SelectCommand="SELECT Products.Name, Technicians.Name AS TechName,
                                      Incidents.DateOpened, Incidents.DateClosed,
                                      Incidents.Description
                               FROM Incidents
                               INNER JOIN Technicians
                                  ON Incidents.TechID = Technicians.TechID
                               INNER JOIN Products
                                  ON Incidents.ProductCode = Products.ProductCode
                               WHERE (Incidents.CustomerID = @CustomerID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlCustomers" Name="CustomerID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
