using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace AslaWebsite
{
    public partial class Region : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Save_Click(object sender, EventArgs e)
        {

            string connString = "Server=WC324-WIN17;Database=test;Trusted_Connection=True;";

            if (RegionIDBox.Text != "")
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();

                    SqlCommand command = new SqlCommand("updateRegion", conn);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add(new SqlParameter("RegionName", RegionNameBox.Text));

                    command.Parameters.Add(new SqlParameter("RegionID", int.Parse(RegionIDBox.Text)));


                    command.ExecuteNonQuery();
                    conn.Close();
                }
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();

                    SqlCommand command = new SqlCommand("AddRegion", conn);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add(new SqlParameter("RegionName", RegionNameBox.Text));




                    command.ExecuteNonQuery();
                    conn.Close();
                }
            }
            ListBox1.DataBind();
            RegionIDBox.Text = "";
            RegionNameBox.Text = "";
            
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

            RegionIDBox.Text = ListBox1.SelectedValue;
            RegionNameBox.Text = ListBox1.SelectedItem.Text;
            ListBox1.DataBind();

        }

        protected void Cancle_Click(object sender, EventArgs e)
        {
            RegionIDBox.Text = "";
            RegionNameBox.Text = "";
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            string connString = "Server=WC324-WIN17;Database=test;Trusted_Connection=True;";

            if (RegionIDBox.Text != "")
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();

                    SqlCommand command = new SqlCommand("deleteRegion", conn);
                    command.CommandType = CommandType.StoredProcedure;

                  
                    command.Parameters.Add(new SqlParameter("RegionID", int.Parse(RegionIDBox.Text)));


                    command.ExecuteNonQuery();
                    conn.Close();
                }
            }
            else
            {
              ErrorMsg.Text ="Please pick a Region first!";
            }
            ListBox1.DataBind();
            RegionIDBox.Text = "";
            RegionNameBox.Text = "";
        }

        
    }
}