using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class SucursalEmpleadoo : Form
    {

        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public SucursalEmpleadoo()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Supermercado;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }

        private void MostrarDatos()
        {
            consulta = "SELECT *FROM SucursalEmpleado";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "SucursalEmpleado");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["SucursalEmpleado"];
        }

        private void SucursalEmpleadoo_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idSucursal = textBox1.Text;
            string idEmpleado = textBox2.Text;
            string estatus = textBox3.Text;
            consulta = "INSERT INTO SucursalEmpleado (idSucursal, idEmpleado, estatus) values('" + idSucursal + "', '" + idEmpleado + "', '" + estatus + "')";
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();

        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            //Borrar
            int idSucursalEmpleado = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE SucursalEmpleado SET Estatus = 0 WHERE idSucursalEmpleado = " + idSucursalEmpleado.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            string idSucursal = textBox1.Text;
            string idEmpleado = textBox2.Text;
            string estatus = textBox3.Text;
            int idSucursalEmpleado = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE SucursalEmpleado SET idSucursal = '" + idSucursal + "',idEmpleado = '" + idEmpleado + "', estatus = '" + estatus + "' WHERE idSucursalEmpleado = " + idSucursalEmpleado.ToString();
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
        }

        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            ProductoVenta bode = new ProductoVenta();
            bode.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            TransportePaaquete bode = new TransportePaaquete();
            bode.Show();
        }
    }
}
