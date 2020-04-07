using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SportsPro.Administration
{
    public partial class CustomerMaintenance : System.Web.UI.Page
    {
        protected void dtlCustomer_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblErrorMessage.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
                lblErrorMessage.Text = ConcurrencyErrorMessage();
            else
                grdCustomers.DataBind();
        }

        protected void dtlCustomer_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblErrorMessage.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
            else
                grdCustomers.DataBind();
        }

        protected void dtlCustomer_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblErrorMessage.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
                lblErrorMessage.Text = ConcurrencyErrorMessage();
            else
                grdCustomers.DataBind();

        }

        protected void grdCustomers_PreRender(object sender, EventArgs e)
        {
            grdCustomers.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        private string DatabaseErrorMessage(string msg)
        {
            return $"A database error has occurred. Message: {msg}";
        }

        private string ConcurrencyErrorMessage()
        {
            return "Another user may have updated this product. Please try again.";
        }
    }
}