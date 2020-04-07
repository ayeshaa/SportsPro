<%@ Page Title="3-C: Maintain customers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerMaintenance.aspx.cs" Inherits="SportsPro.Administration.CustomerMaintenance" %>

<asp:Content ID="main" ContentPlaceHolderID="mainContent" runat="server">
    
    <div class="row">
        <div class="col-sm-6 table-responsive">

            <%-- Customer GridView --%>
            <asp:GridView ID="grdCustomers" runat="server" AllowPaging="True" PageSize="8" AllowSorting="True" 
                AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="SqlDataSource1" SelectedIndex="0" 
                CssClass="table table-bordered table-condensed" OnPreRender="grdCustomers_PreRender">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                        <HeaderStyle CssClass="col-sm-5" />
                    </asp:BoundField>
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City">
                        <HeaderStyle CssClass="col-sm-3" />
                    </asp:BoundField>
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State">
                        <HeaderStyle CssClass="col-sm-1" />
                    </asp:BoundField>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <HeaderStyle CssClass="header" />
                <AlternatingRowStyle CssClass="active" />
                <SelectedRowStyle CssClass="warning" />
                <PagerSettings Mode="NextPreviousFirstLast" />
                <PagerStyle CssClass="header" HorizontalAlign="Center"  />
            </asp:GridView>
            <%-- Sql data source --%>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>"
                SelectCommand="SELECT [CustomerID], [Name], [City], [State] FROM [Customers] ORDER BY [Name]">
            </asp:SqlDataSource>
        </div>

        <div class="col-sm-6 ">
            <%-- Customer DetailsView --%>
            <asp:DetailsView ID="dtlCustomer" runat="server" DataSourceID="SqlDataSource2" 
                AutoGenerateRows="False" OnItemDeleted="dtlCustomer_ItemDeleted" 
                OnItemInserted="dtlCustomer_ItemInserted" OnItemUpdated="dtlCustomer_ItemUpdated" 
                CssClass="table table-bordered table-condensed">
                <HeaderTemplate>
                    <p>Selected Customer</p>
                </HeaderTemplate>
                <HeaderStyle CssClass="header" />
                <Fields>
                    <asp:BoundField DataField="CustomerID" HeaderText="ID:" InsertVisible="False"
                        ReadOnly="True" SortExpression="CustomerID">
                        <HeaderStyle CssClass="col-sm-4" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="Name:" SortExpression="Name">
                        <ControlStyle CssClass="form-control" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Address" HeaderText="Address:" SortExpression="Address">
                        <ControlStyle CssClass="form-control" />
                    </asp:BoundField>
                    <asp:BoundField DataField="City" HeaderText="City:" SortExpression="City">
                        <ControlStyle CssClass="form-control" />
                    </asp:BoundField>
                    <asp:BoundField DataField="State" HeaderText="State:" SortExpression="State">
                        <ControlStyle CssClass="form-control" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ZipCode" HeaderText="Zip code:" SortExpression="ZipCode">
                        <ControlStyle CssClass="form-control" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Phone" HeaderText="Phone:" SortExpression="Phone">
                        <ControlStyle CssClass="form-control" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Email" HeaderText="Email:" SortExpression="Email">
                        <ControlStyle CssClass="form-control" />
                    </asp:BoundField>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <%-- Sql data source --%>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" 
                DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @original_CustomerID AND [Name] = @original_Name AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND [Phone] = @original_Phone AND [Email] = @original_Email"
                InsertCommand="INSERT INTO [Customers] ([Name], [Address], [City], [State], [ZipCode], [Phone], [Email]) VALUES (@Name, @Address, @City, @State, @ZipCode, @Phone, @Email)"
                OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT [CustomerID], [Name], [Address], [City], [State], [ZipCode], [Phone], [Email] FROM [Customers] WHERE ([CustomerID] = @CustomerID)"
                UpdateCommand="UPDATE [Customers] SET [Name] = @Name, [Address] = @Address, [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [Phone] = @Phone, [Email] = @Email WHERE [CustomerID] = @original_CustomerID AND [Name] = @original_Name AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND [Phone] = @original_Phone AND [Email] = @original_Email">
                <DeleteParameters>
                    <asp:Parameter Name="original_CustomerID" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Address" Type="String" />
                    <asp:Parameter Name="original_City" Type="String" />
                    <asp:Parameter Name="original_State" Type="String" />
                    <asp:Parameter Name="original_ZipCode" Type="String" />
                    <asp:Parameter Name="original_Phone" Type="String" />
                    <asp:Parameter Name="original_Email" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="ZipCode" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="original_CustomerID" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Address" Type="String" />
                    <asp:Parameter Name="original_City" Type="String" />
                    <asp:Parameter Name="original_State" Type="String" />
                    <asp:Parameter Name="original_ZipCode" Type="String" />
                    <asp:Parameter Name="original_Phone" Type="String" />
                    <asp:Parameter Name="original_Email" Type="String" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="grdCustomers" Name="CustomerID" PropertyName="SelectedValue"
                        Type="Int32" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="ZipCode" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
    </div>

    <%-- message label --%>
    <div class="row">
        <div class="col-sm-12">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Please correct the following errors:"
                ValidationGroup="Edit" CssClass="text-danger" />
            <asp:Label ID="lblErrorMessage" runat="server" CssClass="text-danger" EnableViewState="False"></asp:Label>
        </div>
    </div>
    
</asp:Content>
