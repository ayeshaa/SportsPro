<%@ Page Title="2-C: Site Navigation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IncidentDisplay.aspx.cs" Inherits="SportsPro.Administration.IncidentDisplay" %>

<asp:Content ID="main" ContentPlaceHolderID="mainContent" runat="server">

    <table class="table table-bordered table-striped table-condensed">
        <asp:ListView ID="ListView1" runat="server" 
            DataKeyNames="IncidentID" DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="ProductNameLable" runat="server" Text='<%# Eval("ProductName") %>' />
                        <br />
                        DateOpned:
                    <br />
                        DateClosed:
                    <br />
                        Title:
                    <br />
                        Description:
                    </td>
                    <td>
                        <asp:Label ID="CustomerNameLable" runat="server" Text='<%# Eval("CustomerName") %>' />
                        <br />
                        <asp:Label ID="DateOpenedLabel" runat="server" Text='<%# Eval("DateOpened") %>' />
                        <br />
                        <asp:Label ID="DateClosedLabel" runat="server" Text='<%# Eval("DateClosed") %>' />
                        <asp:Label ID="TitleLable" runat="server" Text='<%# Eval("Title") %>' />
                        <br />

                        <asp:Label ID="DescriptionLable" runat="server" Text='<%# Eval("Description") %>' />
                        <br />


                    </td>
                    <td>
                        <asp:Label ID="CustomerIDLabel" runat="server" Text='<%# Eval("TechName") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="ProductNameLable" runat="server" Text='<%# Eval("ProductName") %>' />
                        <br />
                        DateOpned:
                    <br />
                        DateClosed:
                    <br />
                        Title:
                    <br />
                        Description:
                    </td>
                    <td>
                        <asp:Label ID="CustomerNameLable" runat="server" Text='<%# Eval("CustomerName") %>' />
                        <br />
                        <asp:Label ID="DateOpenedLabel" runat="server" Text='<%# Eval("DateOpened") %>' />
                        <br />
                        <asp:Label ID="DateClosedLabel" runat="server" Text='<%# Eval("DateClosed") %>' />
                        <asp:Label ID="TitleLable" runat="server" Text='<%# Eval("Title") %>' />
                        <br />

                        <asp:Label ID="DescriptionLable" runat="server" Text='<%# Eval("Description") %>' />
                        <br />
                    </td>
                    <td>
                        <asp:Label ID="CustomerIDLabel" runat="server" Text='<%# Eval("TechName") %>' />
                    </td>
                </tr>

            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>

            <ItemTemplate>

                <tr style="">

                    <th>
                        <asp:Label ID="ProductNameLable" runat="server" Text='<%# Eval("ProductName") %>' />
                        <br />
                        DateOpned:
                    <br />
                        DateClosed:
                    <br />
                        Title:
                    <br />
                        Description:
                    </th>
                    <td>
                        <asp:Label ID="CustomerNameLable" runat="server" Text='<%# Eval("CustomerName") %>' />
                        <br />
                        <asp:Label ID="DateOpenedLabel" runat="server" Text='<%# Eval("DateOpened") %>' />
                        <br />
                        <asp:Label ID="DateClosedLabel" runat="server" Text='<%# Eval("DateClosed") %>' />
                        <asp:Label ID="TitleLable" runat="server" Text='<%# Eval("Title") %>' />
                        <br />

                        <asp:Label ID="DescriptionLable" runat="server" Text='<%# Eval("Description") %>' />
                        <br />


                    </td>
                    <td>
                        <asp:Label ID="CustomerIDLabel" runat="server" Text='<%# Eval("TechName") %>' />
                    </td>
                </tr>

            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <thead>
                                    <tr runat="server" style="">
                                        <th class="header" runat="server">Product</th>
                                        <th class="header" runat="server">Customer</th>
                                        <th class="header" runat="server">Technician</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </thead>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server" class="table-footer">
                        <td runat="server" style="">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="4">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="ProductNameLable" runat="server" Text='<%# Eval("ProductName") %>' />
                        <br />
                        DateOpned:
                    <br />
                        DateClosed:
                    <br />
                        Title:
                    <br />
                        Description:
                    </td>
                    <td>
                        <asp:Label ID="CustomerNameLable" runat="server" Text='<%# Eval("CustomerName") %>' />
                        <br />
                        <asp:Label ID="DateOpenedLabel" runat="server" Text='<%# Eval("DateOpened") %>' />
                        <br />
                        <asp:Label ID="DateClosedLabel" runat="server" Text='<%# Eval("DateClosed") %>' />
                        <asp:Label ID="TitleLable" runat="server" Text='<%# Eval("Title") %>' />
                        <br />

                        <asp:Label ID="DescriptionLable" runat="server" Text='<%# Eval("Description") %>' />
                        <br />


                    </td>
                    <td>
                        <asp:Label ID="CustomerIDLabel" runat="server" Text='<%# Eval("TechName") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
            
               
        </asp:ListView>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>"
        SelectCommand="SELECT Products.Name As ProductName, Technicians.Name AS TechName,
                                      Incidents.DateOpened, Incidents.DateClosed,
                                      Incidents.Description, Incidents.IncidentID, 
        Technicians.TechID, Incidents.Title As Title, Customers.Name As CustomerName, 
        Incidents.Description As Description
                               FROM Incidents
                               INNER JOIN Technicians
                                  ON Incidents.TechID = Technicians.TechID
                               INNER JOIN Products
                                  ON Incidents.ProductCode = Products.ProductCode
                               INNER JOIN Customers
                                  ON Customers.CustomerID = Incidents.CustomerID"></asp:SqlDataSource>

    <style>
        table {
            width: 100%;
        }
         #mainContent_ListView1_itemPlaceholderContainer > tbody > tr:nth-child(odd) {
                            background: #eeeeeea1;
                            color: #000;
                        }

                        #mainContent_ListView1_itemPlaceholderContainer > tbody > tr:nth-child(even) {
                            background: #FFF;
                            color: #000;
                        }
                        .table-footer>td, input[type="submit"]
                        {
                            background:#000;
                            color:#fff;
                            padding:10px;
                            text-align:center;
                            border:none;
                        }
    </style>
</asp:Content>
