using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace ProjectLibraryManagementSystem
{
    public static class Helper
    {
        public static string ConnectionStringKey { get; set; } = "ConnectionString";
        public static IConfiguration? Configuration { get; set; } = null;

        public static SqlConnection? Connection { get; private set; } = null;
        public static void LoadConfiguration(string jsonFile)
        {
            var builder = new ConfigurationBuilder()
              .AddJsonFile(jsonFile, optional: false, reloadOnChange: true);
            Configuration = builder.Build();
        }
        public static SqlConnection OpenConnection()
        {
            try
            {
                string connStr = Configuration.GetRequiredSection(ConnectionStringKey).Value;
                var conn = new SqlConnection(connStr);
                conn.Open();
                Connection = conn;
                return conn;
            }
            catch (Exception ex)
            {
                Connection = null;
                throw new Exception($"Failed to connect to the server > {ex.Message}");
            }
        }

        public static void HandleException(Exception ex)
        {
            MessageBox.Show("An error occurred: " + ex.Message);
        }
        public static bool ValidateTextBoxes(params TextBox[] textboxes)
        {
            foreach (var textbox in textboxes)
            {
                if (string.IsNullOrWhiteSpace(textbox.Text))
                {
                    MessageBox.Show($"{textbox.Tag} cannot be empty.", "Validation Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    textbox.Focus();
                    return false;
                }
            }
            return true;
        }
        public static bool ValidateComboBoxes(params ComboBox[] comboBoxes)
        {
            foreach (var comboBox in comboBoxes)
            {
                if (comboBox.SelectedIndex != -1)
                {
                    MessageBox.Show($"{comboBox.Tag} cannot be empty.", "Validation Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    comboBox.Focus();
                    return false;
                }
            }
            return true;
        }
        public static void ClearControls(this Control control)
        {
            foreach (Control childControl in control.Controls)
            {
                ClearControls(childControl);
            }
            if (control is TextBox)
            {
                ((TextBox)control).Text = "";
            }
            else if (control is ComboBox)
            {
                ((ComboBox)control).SelectedIndex = -1;
            }
            else if (control is CheckBox)
            {
                ((CheckBox)control).Checked = false;
            }
        }
        public static void AttachNavigationEvents(Control parent)
        {
            foreach (Control control in parent.Controls)
            {
                control.KeyDown += Control_KeyDown;
                if (control.HasChildren)
                {
                    AttachNavigationEvents(control);
                }
            }
        }
        private static void Control_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter || e.KeyCode == Keys.Down)
            {
                e.SuppressKeyPress = true;
                MoveFocusToNextControl((Control)sender);
            }
            else if (e.KeyCode == Keys.Up)
            {
                e.SuppressKeyPress = true;
                MoveFocusToPreviousControl((Control)sender);
            }
        }

        private static void MoveFocusToNextControl(Control currentControl)
        {
            currentControl.FindForm()?.SelectNextControl(currentControl, true, true, true, true);
        }

        private static void MoveFocusToPreviousControl(Control currentControl)
        {
            currentControl.FindForm()?.SelectNextControl(currentControl, false, true, true, true);
        }
    }
}
