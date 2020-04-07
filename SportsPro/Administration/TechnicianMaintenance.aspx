<%@ Page Title="2-C: Site Navigation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TechnicianMaintenance.aspx.cs" Inherits="SportsPro.Administration.TechnicianMaintenance" %>

<asp:Content ID="main" ContentPlaceHolderID="mainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6">Select a technician:</div>
            <div class="col-sm-6">
                <asp:DropDownList ID="DropDownList1" CssClass="form-control" AutoPostBack="True"
                    runat="server" DataSourceID="SqlDataSource2" DataTextField="Name"
                    DataValueField="TechID">
                </asp:DropDownList>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>"
                    SelectCommand="SELECT * FROM [Technicians] ORDER BY [Name]"></asp:SqlDataSource>
                <div class="table table-responsive">

                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="TechID" DataSourceID="SqlDataSource3">
                        <EditItemTemplate>
                            <table class="table table-bordered table-striped table-condensed">
                                <tr>
                                    <td>Selected Technician</td>
                                </tr>
                                <tr>
                                    <td>TechID:
                                    </td>
                                    <td>
                                        <asp:Label ID="TechIDLabel1" runat="server" Text='<%# Eval("TechID") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Name:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                                        <asp:RequiredFieldValidator runat="server" ID="reqName" ControlToValidate="NameTextBox" ErrorMessage="Please enter your name!" />
                            <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Email:</td>
                                    <td>
                                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="EmailTextBox" ErrorMessage="Please enter your Email!" />
                            <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Phone:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="PhoneTextBox" ErrorMessage="Please enter your Phone!" />
                            <br />
                                    </td>
                                </tr>




                            </table>
                            <div>
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </div>
                        </EditItemTemplate>

                        <InsertItemTemplate>
                            Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />

                            <br />
                            <asp:RequiredFieldValidator runat="server" ID="reqName" ControlToValidate="NameTextBox" ErrorMessage="Please enter your name!" />
                            <br />
                            Email:
            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                            <br />
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="EmailTextBox" ErrorMessage="Please enter your Email!" />
                            <br />
                            Phone:
            <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                            <br />
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="PhoneTextBox" ErrorMessage="Please enter your Phone!" />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>

                            <p class="Header">Selected Technician</p>

                            <table class="table table-bordered table-striped table-condensed">
                                <thead>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th>TechID:
                                        </th>
                                        <td>
                                            <asp:Label ID="TechIDLabel" runat="server" Text='<%# Eval("TechID") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Name:
                                        </th>
                                        <td>
                                            <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Email:
                                        </th>
                                        <td>
                                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Phone:
                                        </th>
                                        <td>
                                            <asp:Label ID="PhoneLabel" runat="server" Text='<%# Bind("Phone") %>' />

                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False"
                                CommandName="Edit" Text="Edit" />
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False"
                                CommandName="Delete" Text="Delete" />
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False"
                                CommandName="New" Text="New" />
                        </ItemTemplate>
                    </asp:FormView>
                </div>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                    ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>"
                    SelectCommand="SELECT * FROM [Technicians] WHERE ([TechID] = @TechID)"
                    DeleteCommand="DELETE FROM [Technicians] WHERE [TechID] = @TechID"
                    InsertCommand="INSERT INTO [Technicians] ([Name], [Email], [Phone]) VALUES (@Name, @Email, @Phone)"
                    UpdateCommand="UPDATE [Technicians] SET  [Name] = @Name, [Email] = @Email, [Phone]=@Phone WHERE [TechID] = @TechID">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="TechID" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>"
                    SelectCommand="SELECT * FROM [Technicians]
                               WHERE CustomerID = @TechID">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="TechID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <style>
                    #mainContent_FormView1 > tbody > tr > th, #mainContent_FormView1 > tbody > tr:nth-child(0) {
                        text-align: left;
                        background: #000 !important;
                        color: #fff;
                    }

                    .Header {
                        color: #fff;
                        background: #000;
                        padding: 10px;
                    }

                    #mainContent_FormView1 {
                        width: 100%;
                    }

                        #mainContent_FormView1 > tbody > tr:nth-child(even) {
                            background: #eeeeeea1;
                            color: #000;
                        }

                        #mainContent_FormView1 > tbody > tr:nth-child(odd) {
                            background: #FFF;
                            color: #000;
                        }

                    tr {
                        margin-bottom: 20px !important;
                        color: #000;
                    }
                </style>
            </div>
        </div>
    </div>
</asp:Content>
