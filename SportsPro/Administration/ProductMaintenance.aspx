<%@ Page Title="3-B: Maintain products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductMaintenance.aspx.cs" Inherits="SportsPro.Administration.ProductMaintenance" %>

<asp:Content ID="main" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">

        <%-- Products GridView --%>
        <div class="col-sm-12 table-responsive">
            <asp:GridView ID="grdProducts" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="ProductCode" DataSourceID="SqlDataSource1" 
                CssClass="table table-bordered table-striped table-condensed" 
                OnRowUpdated="grdProducts_RowUpdated" OnRowDeleted="grdProducts_RowDeleted"
                OnPreRender="grdProducts_PreRender">
                <Columns>
                    <asp:TemplateField HeaderText="Product code" SortExpression="ProductCode">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProductCode") %>'></asp:Label>
                        </EditItemTemplate>
                        <HeaderStyle CssClass="col-sm-2" />
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ProductCode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name" SortExpression="Name">
                        <EditItemTemplate>
                            <div class="row">
                                <div class="col-sm-11">
                                    <asp:TextBox ID="txtGridName" runat="server" Text='<%# Bind("Name") %>' CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtGridName"
                                    ErrorMessage="Name is a required field." ValidationGroup="Edit" CssClass="text-danger">*</asp:RequiredFieldValidator>
                            </div>
                        </EditItemTemplate>
                        <HeaderStyle CssClass="col-sm-4" />
                        <ItemTemplate>
                            <asp:Label ID="lblGridName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Version" SortExpression="Version">
                        <EditItemTemplate>
                            <div class="row">
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtGridVersion" runat="server" Text='<%# Bind("Version") %>' CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtGridVersion"
                                    Display="Dynamic" ErrorMessage="Version is a required field." CssClass="text-danger" 
                                    ValidationGroup="Edit">*</asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="txtGridVersion"
                                    ErrorMessage="Version must be a decimal value." Operator="DataTypeCheck"
                                    Type="Double" ValidationGroup="Edit" CssClass="text-danger">*</asp:CompareValidator>
                            </div>
                        </EditItemTemplate>
                        <HeaderStyle CssClass="col-sm-2" />
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Version") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Release date" SortExpression="ReleaseDate">
                        <EditItemTemplate>
                            <div class="row">
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtGridDate" runat="server" Text='<%# Bind("ReleaseDate", "{0:d}") %>'
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="txtGridDate" ErrorMessage="Release date is a required field." 
                                    ValidationGroup="Edit" CssClass="text-danger">*</asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtGridDate"
                                    Display="Dynamic" ErrorMessage="Invalid date format." Operator="DataTypeCheck"
                                    Type="Date" ValidationGroup="Edit" CssClass="text-danger">*</asp:CompareValidator>
                            </div>
                        </EditItemTemplate>
                        <HeaderStyle CssClass="col-sm-2" />
                        <ItemTemplate>
                            <asp:Label ID="lblGridDate" runat="server" Text='<%# Bind("ReleaseDate", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ValidationGroup="Edit" />
                    <asp:CommandField CausesValidation="False" ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle CssClass="active" />
                <HeaderStyle CssClass="header" />
            </asp:GridView>

            <%-- Sql data source --%>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" 
                OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT [ProductCode], [Name], [ReleaseDate], [Version] FROM [Products] ORDER BY [ProductCode]"
                InsertCommand="INSERT INTO [Products] ([ProductCode], [Name], [ReleaseDate], [Version]) VALUES (@ProductCode, @Name, @ReleaseDate, @Version)"
                UpdateCommand="UPDATE [Products] SET [Name] = @Name, [ReleaseDate] = @ReleaseDate, [Version] = @Version WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [ReleaseDate] = @original_ReleaseDate AND [Version] = @original_Version"
                DeleteCommand="DELETE FROM [Products] WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [ReleaseDate] = @original_ReleaseDate AND [Version] = @original_Version">
                <DeleteParameters>
                    <asp:Parameter Name="original_ProductCode" Type="String" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
                    <asp:Parameter Name="original_Version" Type="Decimal" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="ReleaseDate" Type="DateTime" />
                    <asp:Parameter Name="Version" Type="Decimal" />
                    <asp:Parameter Name="original_ProductCode" Type="String" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
                    <asp:Parameter Name="original_Version" Type="Decimal" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProductCode" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="ReleaseDate" Type="DateTime" />
                    <asp:Parameter Name="Version" Type="Decimal" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
    </div>

    <%-- Validation summary and message label --%>
    <div class="row">
        <div class="col-sm-12">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Please correct the following errors:"
                ValidationGroup="Edit" CssClass="text-danger" />
            <asp:Label ID="lblErrorMessage" runat="server" CssClass="text-danger" EnableViewState="False"></asp:Label>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <p>To add a new product, enter the product information and click Add Product</p>
        </div>
    </div>

    <%-- Product code text box --%>
    <div class="form-group">
        <div class="col-sm-2">Product code:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtProductCode" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtProductCode" ErrorMessage="Product code is a required field." 
                Display="Dynamic" CssClass="text-danger" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
        </div>
    </div>

    <%-- Name text box --%>
    <div class="form-group">
        <div class="col-sm-2">Name:</div>
        <div class="col-sm-5">
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtName" ErrorMessage="Name is a required field." 
                CssClass="text-danger" Display="Dynamic" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
        </div>
    </div>

    <%-- Version text box --%>
    <div class="form-group">
        <div class="col-sm-2">Version:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtVersion" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="txtVersion" ErrorMessage="Version is a required field." 
                Display="Dynamic" CssClass="text-danger" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator3" runat="server" 
                ControlToValidate="txtVersion" ErrorMessage="Version must be a decimal value." 
                Display="Dynamic" CssClass="text-danger" 
                Operator="DataTypeCheck" Type="Double" ValidationGroup="Add">
            </asp:CompareValidator>
        </div>
    </div>

    <%-- Release date text box --%>
    <div class="form-group">
        <div class="col-sm-2">Release date:</div>
        <div class="col-sm-3">
            <asp:TextBox ID="txtReleaseDate" runat="server" CssClass="form-control">mm/dd/yy</asp:TextBox>
        </div>
        <div class="col-sm-7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtReleaseDate" ErrorMessage="Date is a required field." 
                Display="Dynamic" CssClass="text-danger" InitialValue="mm/dd/yy" ValidationGroup="Add">
            </asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtReleaseDate"
                ErrorMessage="Invalid date format." Operator="DataTypeCheck"
                Type="Date" Display="Dynamic" CssClass="text-danger" ValidationGroup="Add">
            </asp:CompareValidator>
        </div>
    </div>

    <%-- Add button --%>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <asp:Button ID="btnAdd" runat="server" Text="Add Product" ValidationGroup="Add" 
                CssClass="btn btn-primary" OnClick="btnAdd_Click" />
        </div>
    </div>
</asp:Content>
